@extends('layouts.app')
@section('content')
<div>
<main class="container">
    <section>
        <div class="titlebar">
            <h1>Products</h1>
            <a href="{{ route('products.create') }}"><button>Add Product</button></a>
        </div>
        @if ( $message = Session::get('success'))
            <script type="text/javascript">
            const Toast = Swal.mixin({
                toast: true,
                position: "top-end",
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.onmouseenter = Swal.stopTimer;
                    toast.onmouseleave = Swal.resumeTimer;
                }
                });
                Toast.fire({
                    icon: 'success',
                    title: '{{ $message }}'
                });
            </script>
        @endif
        <div class="table">
            <div class="table-filter">
                <div>
                    <ul class="table-filter-list">
                        <li>
                            <p class="table-filter-link link-active">All</p>
                        </li>
                    </ul>
                </div>
            </div>
            <form method="GET" action="{{ route('products.index') }}" accept-charset="UTF-8" role="search">
                <div class="table-search">   
                    <div>
                        <button class="search-select">
                        Search Product
                        </button>
                        <span class="search-select-arrow">
                            <i class="fas fa-caret-down"></i>
                        </span>
                    </div>
                    <div class="relative">
                        <input class="search-input" type="text" name="search" placeholder="Search product..." value="{{ request('search') }}">
                    </div>
                </div>
            </form>
            <div class="table-product-head">
                <p>Image</p>
                <p>Name</p>
                <p>Category</p>
                <p>Inventory</p>
                <p>Actions</p>
            </div>
            <div class="table-product-body">
                @if (count($products)>0)
                    @foreach ($products as $product) 
                        <img src="{{ asset('images/' . $product->image)}}"/>
                        <p>{{$product->name}}</p>
                        <p>{{$product->category}}</p>
                        <p>{{$product->quantity}}</p>
                        <div>     
                            <button class="btn btn-success" >
                                <a href="{{ route('products.edit', $product->id) }}"><i class="fas fa-pencil-alt" >Edit</i></a>
                            </button>
                            <form method="post" action="{{ route('products.destroy', $product->id) }}">
                                @csrf
                                @method('delete')
                                <button class="btn btn-danger" >
                                    <i class="far fa-trash-alt">Del</i>
                                </button>
                            </form>
                        </div>
                    @endforeach
                @else
                    <p>Product not found!</p>
                @endif
            </div>
            <div class="table-paginate">
                {{ $products->links('layouts.pagination') }}
            </div>
        </div>
    </section>
</main>
</div>
@endsection