@extends('layouts.applications')

@section('main')
    <h1>Edit the Article</h1>
    <div>
        <h3>{{ $article['title'] }}</h3>
        <h4>{{ $article['content'] }}</h4>
        <h5>{{ $article['state'] }}</h5>
        <h6>{{ $article['user_id'] }}</h6>
        <h7>{{ $article['created_at'] }}</h7>
    </div>
    
    @if($errors->any())
    <div>
        <ul>
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    <div>
        <form action="{{ route('article.update', $article) }}" method="post">
            @csrf
            @method('patch')
            <lable for="">ID </lable>
            <input type="int" value="{{$article['id']}}" name="id"/><br/>
            <lable for="">Title </lable>
            <input type="text" value="{{$article['title']}}" name="title"/><br/>
            <lable for="">State </lable>
            <input type="text" value="{{$article['state']}}" name="state"/><br/>
            <lable for="">Content </lable>
            <input type="text" value="{{$article['content']}}" name="content"/><br/>
            <lable for="">user_id </lable>
            <input type="int" value="{{$article['user_id']}}" name="user_id"/><br/>
            <button type="submit" value="submit">Submit</button>
        </form>
    </div>
@endsection
