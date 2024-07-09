## Laravel Commands
php artisan make:factory XXXFactory --model=XXX

php artisan list

php artisan serve

php artisan migrate

php artisan about

## Model about commands
php artisan make:model Store -m

php artisan migrate

php artisan migrate --force
php artisan cache:clear
php artisan config:cache
php artisan view:cache


## laravel new my-blog

C:\Users\jewfu\Git\Laravel\my-blog>php artisan tinker
Psy Shell v0.12.3 (PHP 8.1.17 — cli) by Justin Hileman
> User::factory()->make()

User::factory()->count(10)->make()

## set route from rout to view 
``` PHP 
Route::get('/cats/{id}/{name}', function($x, $name) {
	return 'I am ' . $x . ' xxx ' . $name;
});

Route::get('/about', 'WelcomeController@about');
--> after laravel8 as below write:
Route::get('/user',[UserController::class, 'index']);
                      class<full path>     action
```
*path don't include '.'

``` PHP
public function about() {
	$name = "abc";
	return view("pages/about", ['x' => $name]);
}
```
## /pages/about -> controller -> view
about.blade.php
<h1>abc</h1>
{{ $x }}

=> web.php
``` PHP
Route::get('/about', [HelloController::class, 'about']);

=> HelloController.php
public function about() {
	$name = 'fu';
	return view('pages/about', ['name' => $name]);
}
```
=> about.blade.php
<div>
    <h1>fuhong view about</h1>
    {{ $name }}
</div>

## Laravel website doc
https://laravel.com/docs/10.x/blade

### view templete:
``` PHP
@if (count($heroes)>0)
	@foreach($heroes as $hero)
		@if ($loop->first || $loop->last)
			<li>
				<strong>{{ $hero }}</strong>
			</li>
		@else
			<li>
				{{ $hero }}
			</li>
		@endif
	@endforeach
@endif
```
*$loop->first $loop->odd/even(表示奇数与偶数)

### Controller.php
```PHP
public function about() {
    $name = 'fu';
    $heroes = ['a','b','c','d','e','f'];
    return view('pages/about', ['name' => $name, 'heroes' => $heroes]);
}
```

## Layout
views/layouts/application.blade.php
```Html
<body>
	<main>
		@yield('main')
	</main>

	<footer>
		@yield('footer')
	</footer>
</body>
```
## Pages
```Html
@extends('layouts.applications')
@section('main')
	<h1>Hi</h1>
	@if....
	@endif
@endsection
```

## Route and Controller.
php artisan route:list

php artisan make:controller MyPostsController --resource
--resource will add index(), show(), store(), create() into Controller file.

Route::resource('posts', MyPostsController::class);
php artisan route:list
*will new 8 methods: GET->index PUT->update POST->store GET-create->create DELETE->destroy GET-edit->edit
Route::resource('posts', MyPostsController::class)->only/except(['index','show']); *only select two methods; except is mean others methods unselected.

*shadow() can be made simple for router.


## DateBase
$table->timestamps();
*this line will auto add two timestamps: created_at updated_at

php artisan make:migration abcdtest
php artisan make:migration create_posts_table --create="post"
*by the way, create table name is post.

Ruby on rails vs. Laravel

## Model eloquent ORM ActiveRecord
php artisan make:model modelname -m
-m is mean migerate.make table as same as.

Model vs. Table
Post <--> posts
MyBook    my_books

Post      user_posts
How to do?
Model file add below:
protected $table = 'user_posts';
protected $primaryKey = 'post_id';
PK = id    PK = post_id
...

## CRUD
php artisan make:model Book -m

php artisan tinker
>Book::all();

composer dump-autoload    // this line for error:  Error  Class "Book" not found.

>$b = new Book
>$b->title = '' ... $b->save()

in Model file. below fields is opened. Other fields can not be accessed. for example admin.
and as this, then can use Book::create($xx) put mass data into this model.
```PHP
protected $fillable = [
    'title',
    'description',
    'price',
];
```
Book::find(number)
Book::findOrFail(number)

> Book::findOrFail(2)

   Illuminate\Database\Eloquent\ModelNotFoundException  No query results for model [App\Models\Book] 2.

> Book::find(2)
= null

Book::where('price',1.00)->get()

> Book::where('title','like','abc')->get()
= Illuminate\Database\Eloquent\Collection {#6039
    all: [],
  }

> Book::where('title','like','abcehaha')->get()
= Illuminate\Database\Eloquent\Collection {#6020
    all: [
      App\Models\Book {#5972
        id: 1,
        title: "abcehaha",
        description: "xxx da sha gua",
        price: "1.00",
        available: 0,
        created_at: "2024-05-11 23:59:05",
        updated_at: "2024-05-11 23:59:05",
      },
    ],
  }

> Book::where('title','like','abc%')->get()

> Book::where('title','like','abc%')->orderBy('id', 'desc')

> Book::sum('price')

> Book::avg('price')

> Book::max('price')

> Book::min('price')

> Book::where('availabel', true)->update(['available' => false])

### SoftDelete
```PHP
php artisan make:migration add_deleted_at_to_books

Schema::table('books', function (Blueprint $table) {
    $table->softDeletes();
});

Schema::table('books', function (Blueprint $table) {
    $table->dropSoftDeletes();
});

in Model file:
use Illuminate\Database\Eloquent\SoftDeletes;
use SoftDeletes;

$b->delete()

> Book::withTrashed()->find(1)
```

## OneToOne OneToMany
php artisan make:model Store -m

// good line.
php artisan make:migration add_deleted_at_to_stores

#### in Model file Store.php
```PHP
public function book() {
        return $this->hasOne('App\Models\Book');
}

protected $fillable = [
    'title'
];

php artisan make:migration add_store_id_to_books

in migration file:
$table->integer('store_id')->nullable();

> $s1->book()
> $b1 = Book::first()
> $s1->book()->save($b1)

> $s = Store::first()
> $s -> book
> $s->book->title
```

#### in Model file: Book.php
```PHP
public function store() {
    return $this->belongsTo('App\Models\Store');
}

> $by = Book::first()
> $by->store
> $by->store->title

// ----- make books and store relation
> $ss = Store::first()
> $ss->books()
> $b2 = Book::create(['title'=>'book no 2','description'=>'book 2 is a good book','price'=>100.00])
>
> $s1 = Store::first()
> $s1->book()->save($b2);
> $s1
> $s1->books()
> $s1->books
```

## ManyToMany

php artisan make:model Author -m
php artisan migrate

php artisan make:model AuthorBook

php artisan make:migration add_book_id_to_books

#### make third table to manage two Model of Many to Many
php artisan make:migration create_table_author_book

		Schema::create('author_book', function (Blueprint $table) {
            $table->id();
            $table->integer('book_id')->nullable();
            $table->integer('author_id')->nullable();
            $table->timestamps();
        });

php artisan migrate

create table author_book [author_id, book_id]

> $b1->authors()

> $a1->books()

> $b1->authors()->save($a1)

---------------------------
## Factory Mode
#### ready factory
php artisan make:factory BookFactory --model=Book

in BookFactory:
```PHP
return [
    'title' => $this->faker->name,
    'description' => $this->faker->text,
    'price' => $this->faker->numberBetween(10,300)
];
```
> Book::factory()->make()

> Book::factory()->make()->save() // only one record be saved into table.

> Book::factory()->count(20)->create() // many records be saved.

#### create StoreFactory
php artisan make:factory StoreFactory --model=Store

> Store::factory()->make()

> Store::factory()->has(Book::factory()->count(5))->create()

> Store::factory()->has(Book::factory()->count(3))->count(3)->create()

> Book::factory()->for(Store::factory())->create(['title'=>'xxx da sha gua'])

> Store::factory()->hasBooks(3)->create()
> Book::factory()->forStore()->create(['title'=>'xxx'])

Summary:

hasOne, hasMany <==> belongTo, belongToMany

has <==> for

## Seeding
php artisan db:seed  // create a seed function (include many tasks)

php artisan make:seeder StoreSeeder // create a seed task

in seeder file:
DB::table('stores')->insert(..)
or use factory method:
Store::factory()->count(3)->create();

action:
php artisan db:seed // run DatabaseSeeder.php
php artisan db:seed --class=StoreSeeder // run specified php class function

## Controller
php artisan make:controller PhotoController --model=Photo --resource

php artisan make:controller PostController --api

php artisan make:model xxx -m

php artisan make:view xxx


*add notice message:
return redirect()->route('root')->with('notice', 'article create successed!');

```PHP
controller.php

public function show(string $id)
{
    //echo "haha" . $id . Post::findOrFail($id);
    return view('post', [
        'post' => Post::findOrFail($id)
    ]);

}

Model -> Post

protected $fillable = [
    'id',
    'title',
    'content',
];

view -> post.blade.php

<div>
    <h5>{{$post['id']}}</h5>
    <h1>{{$post['title']}}</h1>
    <h2>{{$post['content']}}</h2>
</div>

route -> web.php

Route::resource('posts', MyPostsController::class)->only(['index','show']);
*above must be used new Controller, for example:
use App\Http\Controllers\ArticleController;

## Article -> crud
php artisan make:model Article -m 

migration -> migrate
```PHP
Model: Article.php
Schema::create('articles', function (Blueprint $table) {
    $table->id();
    $table->sring('title');
    $table->text('content');
    $table->enum('state', ['draft','published']);
    $table->softDeletes();
    $table->foreignId('user_id');
    $table->timestamps();
});


Controller =>
index()

public function index()
{
    $articles = Article::all();
    return view('article.index',compact('articles'));  // a.

    return view('article.index', [
             'articles' => $articles                   // b.
    ]);
    
    return view('article.index', [
             'articles' => Article::all()
    ]);

}

store()

public function store(Request $request)
{
    $request->validate([
        'title' => 'required|max:255',
        'user_id' => 'required|max:10',
        'state' => 'required|max:2',
        'content' => 'required',
    ]);

    Article::create($request->all());
    return redirect()->route('article.index')
            ->with('success','Article created successfully.');
}

view file ->
<form action="{{ route('article.store') }}" method="post">
    @csrf
    <lable for="">Title </lable>
    <input type="text" name="title"/>
    <lable for="">Content </lable>
    <input type="text" name="content"/>
    <lable for="">user_id </lable>
    <input type="text" name="user_id"/>
    <button type="submit" value="submit">Submit</button>
</form>

@csrf -> insert into view file. is very import!

*about post type submit, check fields count? type? validate? all right then can be insert.
about enum: '','','',... the number is from 1..n.

*@csrf                  //add hidden code for csrf
*@method('patch')       //add hidden code to tell server this is path method can be passed.

* migration set default for enum method:
$table->enum('state', ['draft','published'])->default('draft');

View file insert check error validate:

@if($errors->any())
    <div>
        <ul>
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif


$a->title <==> $a['title']

```

## Order by records

$articles = Article::orderBy('id', 'desc')->paginate(3); // desc and paginate by 3 pages.

<a href="{{ route('articles.show', $article) }}">
    {{ $article->title }}
</a>

## open or close any functions.

public function __construct() {
    $this->middleware('auth')->except(['index']);
}

## Delete Record
as above.

## auto search again.
{{ $artice->created_at }} from {{ $article->user-name }} shared.
                                          *search again.


## Laravel plugins.

1. Laravel debugbar.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
composer require barryvdh/laravel-debugbar --dev
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

## N+1:
eager-loading > $book = App\Models\Book::with('author')->get();
                                        *with help eager query.


## npm i packagename <=> yarn add packagename
yarn add jquery

in app.js

require('./bootstrap');

window.$ = window.jQuery = require('jquery');

--> npm run dev

npm run watch


## Seeding from one Seeder

php artisan db:seed --class=DatabaseSeeder


## drop table 

$ php artisan make:migration drop_user_table

$ php artisan migrate


You can also rollback if you want to drop your last migrated table

php artisan migrate:rollback
The migrate:reset command will roll back all of your application's migrations:

php artisan migrate:reset
The migrate:fresh command will drop all tables from the database and then execute the migrate command:

php artisan migrate:fresh

php artisan migrate:fresh --seed

php artisan migrate:rollback  --path=/database/migrations/22_03_18_010_create_users_table.php

php artisan migrate:refresh --path=/database/migrations/22_03_18_010_create_users_table.php

## sqlite points.

set full path:
DB_DATABASE=C:\xampp\htdocs\laravel10_11_crud\laravel_basic_crud

## crud:
route('products.index')
```HTML
@crsf
<form action="" method="POST" enctype="multipart-forms">
</form>

<img src="" alt="" class="img-product" id="file-preview" />
<input type="file" name="image" accept="image/*" onchange="showFile(event)" />

<script>
    function showFile(event) {
        var input = event.target;
        var reader = new FileReader();
        reader.onload = function() {
            var dataURL = reader.result;
            var output = document.getElementById('file-preview');
            output.src = dataURL;
        };
        reader.readAsDataURL(input.files[0]);
    }
</script>

```

#### Laravel command:
```shell
composer require laravel/ui

php artisan config:publish broad casting
```

#### php + composer.phar
```shell
mv composer.phar /usr/local/bin/composer

php composer install
..
```

















