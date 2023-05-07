@php
    $core_user = Auth::user();
@endphp
@extends('layout')

@section('content')
    <div class="container-fluid">
        <h1 class="display-1">
            <b>Bienvenido a </b><img src="{{ asset(($core_user->membership !== 'premium') ? 'img/logo.png' : 'img/logo-premium.png') }}" alt="Logo" class="img-fluid"
                style="max-height: 100px;">{{ config('app.name') }}

        </h1>
        @guest
            <small class="text-muted">Invitado</small>
        @endguest
        @auth
            <small class="text-muted">
                <i class="fa fa-user" aria-hidden="true"></i> {{ $user->nombre }} {{ $user->apellido_paterno }}
                {{ $user->apellido_materno }}
            </small>
            {{-- membership --}}
            @if ($core_user->membership == 'premium')
                <span class="badge bg-info text-white">Premium</span>
            @elseif ($core_user->membership == 'basica')
                <span class="badge bg-primary text-white">Básica</span>
            @else
                <span class="badge bg-secondary text-white">Sin membresía</span>
            @endif
        @endauth
        <div id="carouselExampleCaptions" class="carousel slide p-2 mb-3" data-bs-ride="false">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    {{-- Set image height fixed crop --}}
                    <img src="{{ asset('img/escrito.jpg') }}" class="d-block w-100" alt="cursos escritos"
                        style="filter: brightness(50%);">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Cursos escritos: <b>Aprendedores tradicionales</b></h5>
                        <p>
                            Cursos escritos por profesionales de la industria. Para los que prefieren aprender de forma más
                            tradicional.
                        </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="{{ asset('img/auditivo.jpg') }}" class="d-block w-100" alt="cursos auditivos"
                        style="filter: brightness(50%);">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Cursos tipo <em>Podcast</em>: <b>Aprendedores auditivos</b></h5>
                        <p>
                            Cursos en formato de podcast. Para los que prefieren aprender escuchando.
                        </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="{{ asset('img/visual.jpg') }}" class="d-block w-100" alt="..."
                        style="filter: brightness(50%);">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Cursos tipo <em>Video</em>: <b>Aprendedores visuales</b></h5>
                        <p>
                            Cursos en formato de video. Para los que prefieren aprender viendo.
                        </p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
        <h1>
            Mira nuestros mejores cursos...
        </h1>
        <section class="row row-cols-1 row-cols-md-3 g-4 justify-content-around">
            @foreach ($courses as $course)
                @include('content.cards', ['course' => $course])
            @endforeach

            {{-- Ver más... --}}
            <div class="col">
                <div class="card h-100">
                    <div class="card-body d-flex flex-column justify-content-center align-items-center">

                        <h5 class="card-title text-center">Ver más...</h5>
                        <p class="card-text text-center">
                            <a href="{{ route('course') }}" class="btn btn-primary">Ver todos los cursos</a>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection('content')
