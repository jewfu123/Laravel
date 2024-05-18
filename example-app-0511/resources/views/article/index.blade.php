@extends('layouts.applications')

@section('main')
<h1>Articles List</h1>
<a href="{{ route('article.create') }}">New Article</a>

@foreach($articles as $article)
    <div>
        <h2>{{ $article->title }}</h2>
        <a href="{{ route('article.edit', ['article' => $article->id]) }}">Edit</a>
        &nbsp;&nbsp;&nbsp;
        <form action="{{ route('article.destroy', $article->id) }}" method="post">
            @csrf
            @method('delete')
            <button type="submit">Delete</button>
        </form>
    </div>
@endforeach

@endsection