{{-- Esta plantilla es para buscar cursos --}}

@extends('layout')

@section('content')
    <div class="container">
        <div class="bg-primary text-white mb-5 pb-1 pt-3 px-3">
            {{-- Breadcrum --}}
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="link-light" href="{{ route('home') }}">Home</a></li>
                    <li class="breadcrumb-item">Curso</li>
                </ol>
            </nav>
            <h2 class="fst-italic">
                Resultados de la búsqueda
            </h2>
        </div>

        {{-- Form to search --}}
        <div class="row">
            <div class="col-12">
                <form action="{{ route('course') }}" method="GET">
                    <div class="input-group mb-3">
                        <input type="text" name="course" class="form-control mx-3" placeholder="Buscar..."
                            value="{{ request('course') }}">
                        <div class="input-group-append">
                            <button class="btn btn-outline-success" type="submit" id="button-addon2">Buscar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        @if ($courses->count() == 0)
                            <p class="text-center bg-danger text-white p-2">No se encontraron resultados</p>
                        @else
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Temas</th>
                                        <th scope="col">Suscrito</th>
                                        <th scope="col">Profesor</th>
                                        <th scope="col">Premium</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($courses as $course)
                                        <tr>
                                            <td>{{ $course->title }}</td>
                                            <td>{{ $course->temas }}</td>
                                            @if ($course->subscribed)
                                                <td>
                                                    <i class="fas fa-check text-success"></i>
                                                </td>
                                            @else
                                                <td>
                                                    <i class="fas fa-times text-danger"></i>
                                                </td>
                                            @endif
                                            <td class="text-capitalize">
                                                <a href="#" class="link-dark">
                                                    {{ '@' . $course->author_full_name }}
                                                </a>
                                            </td>
                                            <td>
                                                @if ($course->premium)
                                                    <i class="fas fa-bolt text-info"></i>
                                                @else
                                                    <i class="fas fa-star text-warning"></i>
                                                @endif
                                            </td>
                                            <td>
                                                <a href=" {{ route('ver-curso', [$course->id => str_replace(' ', '_', $course->title)]) }} "
                                                    class="btn btn-outline-success">Ver más</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
