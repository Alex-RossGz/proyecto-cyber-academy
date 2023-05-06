@extends('layout')

@section('content')


<section>
    <h1 class="display-1">Tu sesión de {{ $title }}</h1>

    <section class="d-flex justify-content-between">

        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Ir a la página principal</h5>
                <p class="card-text">
                    Visita la página principal de la aplicación
                </p>
                <a href="{{route('home')}}" class="btn btn-primary">Menú principal</a>
            </div>
        </div>

        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Iniciar sesión con tu cuenta</h5>
                <p class="card-text">
                    Entrar con tu cuenta de usuario
                </p>
                <a href="{{route('login')}}" class="btn btn-primary">Iniciar sesión</a>
            </div>
        </div>

        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Registrarse en la plataforma</h5>
                <p class="card-text">
                    Regístrese en la plataforma para poder acceder a los cursos y a las clases en vivo.
                </p>
                <a href="#" class="btn btn-primary">Regístrate</a>
            </div>
        </div>
    </section>


</section>
@endsection('content')