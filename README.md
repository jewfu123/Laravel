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








































