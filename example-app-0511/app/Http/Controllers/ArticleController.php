<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Article;

class ArticleController extends Controller
{
    public function index()
    {
        $articles = Article::all();
        return view('article.index',compact('articles'));
        // return view('article.index', [
        //     'articles' => $articles
        // ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('article.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $content = $request->validate([
            'title' => 'required|max:255',
            'user_id' => 'required|max:10',
            'state' => 'required|max:2',
            'content' => 'required',
        ]);

        Article::create($content);
        //return redirect()->route('root');
        return redirect()->route('article.index')
                ->with('notice','Article created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return view('article', [
            'article' => Article::findOrFail($id)
        ]);

    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //$article = auth()->user()->articcles->find($id);
        $article = Article::find($id);
        return view('article.edit', ['article' => $article]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $content = $request->validate([
            'title' => 'required|max:255',
            'user_id' => 'required|max:10',
            'state' => 'required|max:2',
            'content' => 'required',
        ]);

        $article = Article::findOrFail($id);

        $article->update($content);
        return redirect()->route('article.index')->with('notice', 'Article is updated successed!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
