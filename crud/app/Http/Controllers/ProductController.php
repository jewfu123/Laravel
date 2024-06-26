<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    public function index(Request $request) {
        $products = "Product List from in ProductController";
        $products = Product::orderby('created_at')->get();

        $keyword = $request->get('search');
        $perPage = 5;
        if (!empty($keyword)) {
            $products = Product::where('name', 'LIKE', "%$keyword%")
            ->orWhere('category','LIKE',"%$keyword%")
            ->latest()->paginate($perPage);
        } else {
            $products = Product::latest()->paginate($perPage);
        }

        return view('products.index', ['products' => $products])->with('i', (request()->input('page',1) -1) * 5);
    }

    public function create() {
        return view('products.create');
    }

    public function edit($id) {
        $product = Product::findOrFail($id);
        return view('products.edit', ['product' => $product]);
    }

    public function store(Request $request) {
        $request->validate([
            'name'  => 'required',
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2028',
        ]);

        $product = new Product;
        $file_name = time() . '.' . request()->image->getClientOriginalExtension();
        
        request()->image->move(public_path('images'),$file_name);

        $product->name = $request->name;
        $product->description = $request->description;
        $product->category = $request->category;
        $product->quantity = $request->quantity;
        $product->price = $request->price;
        $product->image = $file_name;

        $product->save();

        //return view('products.index');
        return redirect()->route('products.index')->with('success','Product Add successed!!!');
    }

    public function update(Request $request, Product $product) {
        $request->validate([
            'name' => 'required'
        ]);

        //$file_name = $request->hidden_product_image;
        $file_name = $product->image;

        if ($request->image != '') {
            $file_name = time() . '.' . request()->image->getClientOriginalExtension();
            request()->image->move(public_path('images'), $file_name);
        }

        $product = Product::find($request->hidden_id);

        $product->name = $request->name;
        $product->description = $request->description;
        $product->category = $request->category;
        $product->quantity = $request->quantity;
        $product->price = $request->price;
        $product->image = $file_name;

        $product->save();

        return redirect()->route('products.index')->with('success','Product has been updated!!!');
    }

    public function destroy($id) {
        $product = Product::findOrFail($id);
        $product->delete();
        return redirect()->route('products.index')->with('success','Product has been deleted!!!');
    }
}
