@extends('layouts.app')
@section('content')
    <main class="container">
        <section>
            <form method="post" action="{{ route('products.update', $product->id) }}" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="titlebar">
                    <h1>Edit Product</h1>
                    <button>Save</button>
                </div>
                @if ($errors->any())
                    <div>
                        <ul>
                            @foreach ($errors->all() as $error )
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                @endif
                <div class="card">
                <div>
                        <label>Name</label>
                        <input type="text" name="name" value="{{ $product->name }}"/>
                        <label>Description (optional)</label>
                        <textarea cols="10" rows="5" name="description">{{ $product->description }}</textarea>
                        <label>Add Image</label>
                        <img src="{{ asset('images/' . $product->image)}}" alt="" class="img-product" id="file-preview"/>
                        <input type="hidden" name="hidden_id" value="{{ $product->id }}" />
                        <input type="file" name="image" accept="image/*" onchange="showFile(event)"/>
                    </div>
                <div>
                        <label>Category</label>
                        <select  name="category" >
                            @foreach(json_decode('{"Smartphone":"SmartPhone","Smart TV":"Smart TV","Computer":"Computer"}',true) as $optionKey => $optionValue)
                                <option value="{{ $optionKey}}" {{ (isset($product->category) && $product->category == $optionKey) ? 'selected' : '' }}>{{ $optionValue }}</option>
                            @endforeach
                        </select>
                        <hr>
                        <label>Inventory</label>
                        <input type="text" class="input" value="{{ $product->quantity }}" name="quantity">
                        <hr>
                        <label>Price</label>
                        <input type="text" class="input" value="{{ $product->price }}" name="price">
                </div>
                </div>
                <div class="titlebar">
                    <h1></h1>
                    <button>Save</button>
                </div>
        </form>
        </section>
    </main>

    <script>
        function showFile(event) {
            var input = event.target;
            var reader = new FileReader();
            reader.onload = function() {
                var dataURL = reader.result;
                var output = document.getElementById('file-preview');
                output.src = dataURL;
            }
            reader.readAsDataURL(input.files[0]);
        }
    </script>
@endsection
