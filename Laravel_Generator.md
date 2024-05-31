手把手带你创建一个 Laravel CRUD 代码生成器

置顶
张涛的小迷妹

于 2018-06-15 17:33:39 发布

阅读量2.9k
 收藏 5

点赞数 1
file

让我们来看看如何在 Laravel 中创建自己的 CRUD 生成器，来提升我们的工作效率。

通常情况下，一旦决定使用控制器提供的架构方案，你需要一个生成器，以便将来不会被重写。

你可以从 这里 获取到源代码。


第 1 步 --- 创建项目
创建一个新的 Laravel 项目:

composer create-project laravel/laravel Contest
第 2 步--- 启动
将你的 Laravel 应用程序连接到数据库并启动服务器。

第 3 步--- 使用命令生成
下面我们开始研究 CRUD 生成器的命令。

创建一个 CRUD 生成器命令：

php artisan make:command CrudGenerator
如果你运行:

php artisan
你应该有一个新的命令可用：

command:name         Command description
当然，该命令还没有设置，这就是为什么你看到一个默认的名称和说明。

在我们处理命令之前，如果你愿意，我们需要一些存根或蓝图。


第 4 步---stub 模板
复制下面的代码到 resources/stubs 目录。

stubs 目录默认是不存在的，所以请确认你首先创建了它。并且，请用后面的名字命名这些文件：Controller.stub，Model.stub 和 Request.stub。

正如你在下面所看到的，这些 stub 模板文件里有一些占位符，我们稍后会用真实数据来替换它们。

Controller.stub
```PHP
<?php
 
namespace App\Http\Controllers;
 
use App\Http\Requests\{{modelName}}Request;
use App\{{modelName}};
 
class {{modelName}}Controller extends Controller
{
    public function index()
    {
        ${{modelNamePluralLowerCase}} = {{modelName}}::latest()->get();
 
        return response()->json(${{modelNamePluralLowerCase}});
    }
 
    public function store({{modelName}}Request $request)
    {
        ${{modelNameSingularLowerCase}} = {{modelName}}::create($request->all());
 
        return response()->json(${{modelNameSingularLowerCase}}, 201);
    }
 
    public function show($id)
    {
        ${{modelNameSingularLowerCase}} = {{modelName}}::findOrFail($id);
 
        return response()->json(${{modelNameSingularLowerCase}});
    }
 
    public function update({{modelName}}Request $request, $id)
    {
        ${{modelNameSingularLowerCase}} = {{modelName}}::findOrFail($id);
        ${{modelNameSingularLowerCase}}->update($request->all());
 
        return response()->json(${{modelNameSingularLowerCase}}, 200);
    }
 
    public function destroy($id)
    {
        {{modelName}}::destroy($id);
 
        return response()->json(null, 204);
    }
}
```
Model.stub
```PHP
<?php
 
namespace App;
 
use Illuminate\Database\Eloquent\Model;
 
class {{modelName}} extends Model
{
    protected $guarded = ['id'];
}
```
Request.stub
```PHP
<?php
 
namespace App\Http\Requests;
 
use Illuminate\Foundation\Http\FormRequest;
 
class {{modelName}}Request extends FormRequest
{
    public function authorize()
    {
        return true;
    }
 
    public function rules()
    {
        return [];
    }
}
```
你的 resources 目录看起来应该像下面这样：

file


第 5 步 --- 实现代码生成器
现在让我们来实现第 3 步所创建的控制台命令。

在 app/Console/Commands 文件夹找到 CrudGenerator.php

修改命令标志和描述，如下：

protected $signature = 'crud:generator
    {name : Class (singular) for example User}';
 
protected $description = 'Create CRUD operations';
描述要简洁、明了。

至于命令标志，可以根据个人喜好命名，就是后面我们要调用的 artisan 命令，如下：

php artisan crud:generator Car
接下来创建一个方法用来获取桩代码。
```PHP
protected function getStub($type)
{
    return file_get_contents(resource_path("stubs/$type.stub"));
}
```
getStub 方法只是简单的返回我们需要的桩代码内容。


下面，我们来看看怎样使用 resources/stubs 文件夹下的 stub 模板来创建模型。
```PHP
protected function model($name)
{
    $modelTemplate = str_replace(
        ['{{modelName}}'],
        [$name],
        $this->getStub('Model')
    );
 
    file_put_contents(app_path("/{$name}.php"), $modelTemplate);
}
```
从代码可以看到，model方法需要一个 name 参数，它由我们在 artisan 命令里传入。

看看 $modelTemplate 属性。我们使用 str_replace 函数把 Model.stub文件里的占位符替换为我们期望的值。

基本上，在Model.stub文件里，我们用$name替换了{{modelName}}。请记住，在我们的例子中，$name的值是 Car。

你可以打开Model.stub文件检查一下，所有的{{modelName}}都被替换为了 Car。

file_put_contents函数再次使用了$name创建了一个新文件，因此它被命名为Car.php。并且，我们给这个文件传入内容，这些内容是从$modelTemplate属性获取的。$modelTemplate属性值是Model.stub文件的内容，只是所有的占位符均被替换了。

同样的事情还发生在controller和request方法里。因此，我将这两个方法的内容粘贴在这里。
```PHP
protected function controller($name)
{
    $controllerTemplate = str_replace(
        [
            '{{modelName}}',
            '{{modelNamePluralLowerCase}}',
            '{{modelNameSingularLowerCase}}'
        ],
        [
            $name,
            strtolower(str_plural($name)),
            strtolower($name)
        ],
        $this->getStub('Controller')
    );
 
    file_put_contents(app_path("/Http/Controllers/{$name}Controller.php"), $controllerTemplate);
}
protected function request($name)
{
    $requestTemplate = str_replace(
        ['{{modelName}}'],
        [$name],
        $this->getStub('Request')
    );
 
    if(!file_exists($path = app_path('/Http/Requests')))
        mkdir($path, 0777, true);
 
    file_put_contents(app_path("/Http/Requests/{$name}Request.php"), $requestTemplate);
}
```
好极了，现在我们来看受保护方法handle。


在 handle() 方法里，我们只需要调用刚刚定义好的那些方法。
```PHP
public function handle()
{
    $name = $this->argument('name');
 
    $this->controller($name);
    $this->model($name);
    $this->request($name);
 
    File::append(base_path('routes/api.php'), 'Route::resource(\'' . str_plural(strtolower($name)) . "', '{$name}Controller');");
}
```
很显然，我们需要获得用户使用命令传递过来的参数值，在这个例子中这个参数值将永远都是 Car ，接下来调用上面几段里面的解释过的三个函数，最后在 rotues/api.php 文件中追加一个资源路由。


第 6 步 --- 运行控制台命令
现在让我们去尝试运行一下我们已经写好的控制台命令。

打开一个终端控制台并在终端输入如下命令：

php artisan crud:generator Car
现在，你应该可以得到三个可用的文件，一个是 app/ 文件夹下 Model 层的 Car.php ，第二个是 app/Http/Controllers 文件夹下 Controller 层的 CarController.php ，第三个是 app/Http/Requests 文件夹的 CarRequest.php 文件。

你可以看到，这个控制台命令创建不了表的迁移文件。由于这篇文章要发到 Medium 上，我们要让它更简单易懂，所以，接下来我们利用 Laravel 框架已经封装好的控制台命令去快速创建 cars 的表的迁移文件。

php artisan make:migration create_cars_table --create=cars
修改 app/database/migrations 的 cars 的表格迁移文件里的 up 方法为下面的内容：
```PHP
public function up()
{
    Schema::create('cars', function (Blueprint $table) {
        $table->increments('id');
        $table->string('model');
        $table->integer('year');
        $table->timestamps();
    });
}
```
接下来运行以下命令来应用迁移：

php artisan migrate

第 7 步 --测试用控制台命令生成的 CRUD
在这个步骤中，我将会使用 postman 工具来进行测试。

保存
file

显示
file

显示指定数据
file

更新
file

删除
file

总结
在你的项目中，你现在已经拥有了一个 CRUD 代码生成器。假如你看不惯 resources/stubs 文件夹下的文件，你可以点进去，然后修改这些文件。

一般来说， 你只需要通过一个简洁的控制台命令来创建一些简单的 CRUD 代码，而不用花费 10 到 15 分钟甚至更多的时间去创建它。很酷的一件事情，是不是？

因为这篇文章已经收到了很多好评，所以我这阵子打算把这个 CRUD 代码生成器改写成一个完整的 PHP 包！:blush:

敬请期待 & 快乐编码！


https://imgs.699pic.com/images/402/584/095.jpg!list1x.v2











