<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HelloController extends Controller
{
    public function about() {
        $name = 'fu';
        $heroes = ['a','b','c','d','e','f'];
        return view('pages/about', ['name' => $name, 'heroes' => $heroes]);
    }
}
