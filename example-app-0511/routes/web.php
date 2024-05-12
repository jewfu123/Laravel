<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HelloController;
use App\Http\Controllers\MyPostsController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/testme/{id}', function ($id) {
    return 'testme ' . $id . ' is good number.';
});

Route::get('/about', [HelloController::class, 'about']);

//Route::resource('posts', MyPostsController::class);
Route::resource('posts', MyPostsController::class)->only(['index','show']);
Route::resource('posts.comments', MyPostsController::class);
