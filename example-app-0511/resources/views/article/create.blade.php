@extends('layouts.applications')

@section('main')

<h1>Create new article</h1>

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
    <form action="{{ route('article.store') }}" method="post">
        @csrf
        <lable for="">ID </lable>
        <input type="int" value="{{old('id')}}" name="id"/><br/>
        <lable for="">Title </lable>
        <input type="text" value="{{old('title')}}" name="title"/><br/>
        <lable for="">State </lable>
        <input type="text" value="{{old('state')}}" name="state"/><br/>
        <lable for="">Content </lable>
        <input type="text" value="{{old('content')}}" name="content"/><br/>
        <lable for="">user_id </lable>
        <input type="int" value="{{old('user_id')}}" name="user_id"/><br/>
        <button type="submit" value="submit">Submit</button>
    </form>
</div>
@endsection
