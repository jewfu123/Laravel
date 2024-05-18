@extends('layouts.applications')

@section('main')
<h1>Articles List</h1>
<a href="{{ route('article.create') }}">New Article</a>

@foreach($articles as $article)
    <div>
        <h2>{{ $article->title }}</h2>
        <a href="{{ route('article.edit', ['article' => $article->id]) }}">Edit</a>
    </div>
@endforeach

@endsection