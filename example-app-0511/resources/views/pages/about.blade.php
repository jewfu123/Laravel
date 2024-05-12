@extends('layouts.applications')

@section('main')
<div>
    <h1>fuhong view about</h1>
    {{ $name }}
    
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
</div>
@endsection