<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Test Layout</title>
</head>
<body>
    <main>
        @if(session()->has('notice'))
            <div class="bg-pink-300 px-3 py-2 rounded">
                {{ session()->get('notice') }}
            </div>
        @endif
        @yield('main')
    </main>
    <footer>
        @yield('footer')
    </footer>
</body>
</html>