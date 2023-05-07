<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="shortcut icon" href="{{ asset('favicon.png') }}" type="image/x-icon">

    @vite(['resources/sass/app.scss', 'resources/sass/style.scss', 'resources/js/app.js'])

    <title>{{ config('app.name', 'Laravel') }}</title>

</head>

@php
    $disabled = Route::currentRouteName() == 'home' ? 'disabled' : '';
@endphp

<body class="antialiased">
    <nav class="navbar bg-light fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand {{ $disabled }}" href="{{ route('home') }}">
                <img src="{{ asset('favicon.png') }}" alt="" width="30" height="24"
                    class="d-inline-block align-text-top">
                {{ config('app.name', 'Laravel') }}
            </a>


            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <div id="logo" class="text-center">
                        <img src="{{ asset('favicon.png') }}" alt="" width="30" height="24"
                            class="d-inline-block align-text-top">
                        <h5 class="d-inline block offcanvas-title" id="offcanvasNavbarLabel">
                            {{ config('app.name', 'Laravel') }}</h5>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link active {{ $disabled }}" aria-current="page"
                                href="{{ route('home') }}">Menú principal</a>

                        <li class="nav-item">
                            <!-- if login then salir sesión -->

                        <li class="nav-item dropdown" id="{{ Auth::user() ? 'user' : 'login' }}">
                            <a class="nav-link dropdown-toggle " href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <i class="fas fa-user"></i>
                                {{ Auth::user() ? Auth::user()->name : ' Invitado' }}
                            </a>
                            <div class="dropdown-menu">
                                @auth
                                    <h6 class="dropdown-header">Perfil de alumno</h6>
                                    <a class="dropdown-item" href="{{ route('subscribed') }}">Mis cursos inscritos</a>
                                    <a class="dropdown-item disabled" href="#">Mi suscripción
                                        <i>(Próximamente...)</i></a>

                                    <a href="{{ route('membership') }}" class="dropdown-item">
                                        <i class="fas fa-certificate"></i>
                                        Membresías</a>
                                    <hr class="dropdown-divider">
                                    <h6 class="dropdown-header">Perfil de profesor</h6>
                                    <a class="dropdown-item disabled" href="#">Mis cursos <i>(Próximamente...)
                                        </i></a>
                                    <a class="dropdown-item" href="{{ route('proponer') }}"><i class="fa fa-upload"
                                            aria-hidden="true"></i> Proponer curso</a>
                                    <hr class="dropdown-divider">
                                    <h6 class="dropdown-header">Perfil de usuario</h6>
                                    <a class="dropdown-item" href="{{ route('profile') }}">Mi perfil</a>
                                    <form id="logout-form" action="{{ url('logout') }}" method="POST">
                                        {{ csrf_field() }}
                                        <button type="submit" class="dropdown-item">Salir</button>
                                    </form>
                                @endauth
                                @guest
                                    <a class="dropdown-item" href="{{ route('login') }}">Login sesión</a>
                                    <a class="dropdown-item" href="{{ route('register') }}">Registrarse</a>
                                @endguest
                            </div>
                        </li>

                    </ul>
                    {{-- Buscar curso: abajo mostrará los cursos que coincidan con la búsqueda Searchabla Curs --}}

                    <form class="d-flex mt-3" action="{{ route('course') }}" method="GET">
                        <input class="form-control me-2" type="search" placeholder="Buscar curso" aria-label="Search"
                            name="course">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>

                    @auth
                        <div class="mt-3">
                            <a href="{{ route('course') }}" class="btn btn-primary">Ver todos los cursos</a>
                        </div>
                    @endauth

                </div>
            </div>
        </div>
    </nav>

    <div class="content-wrapper p-5" class="d-flex flex-column">
        {{-- Responsive --}}
        <main class="container align-items-center p-5 bg-white" id="app">
            @yield('content')
        </main>
    </div>

    <!-- Footer -->
    <footer class="text-center text-lg-start bg-white text-muted">
        <!-- Section: Social media -->
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Conéctate a nuestras redes sociales:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="fw-bold mb-4">
                            <img src="{{ asset('favicon.png') }}" alt="" width="30" height="24"
                                class="d-inline-block align-text-top">{{ config('app.name', 'Laravel') }}
                        </h6>
                        <p class="text-justify">
                            En {{ config('app.name', 'Laravel') }} encontrarás los mejores cursos de programación web,
                            diseño web,
                            desarrollo de aplicaciones móviles, diseño gráfico, marketing digital, entre otros.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->

                        <h6 class="text-uppercase fw-bold mb-4">
                            Cursos
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Escritos</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Visuales</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Auditivos</a>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Useful links
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Settings</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Orders</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Help</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">{{ __('Contacto') }}</h6>
                        <p><i class="fas fa-home me-3 text-secondary"></i>
                            Universidad LaSalle, Av. Benjamín Franklin 100, Condesa, 06140 Ciudad de México, CDMX
                        </p>
                        <p>
                            <i class="fas fa-envelope me-3 text-secondary"></i>
                            cyberacademy@lasalle.com
                        </p>
                        <p><i class="fas fa-phone me3 text-secondary"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-print me-3 text-secondary"></i> + 01 234 567 89</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
            © {{ date('Y') }} <a class="text-reset fw-bold">{{ config('app.name', 'Laravel') }}</a>
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
</body>

</html>
