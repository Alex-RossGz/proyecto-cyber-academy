@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="card bg-secondary text-white mb-5">
            <div class="card-header">
                <h4 class="mb-0">Cursos</h4>
            </div>
            <div class="card-body">
                @if (empty($courses))
                    <div class="alert alert-danger" role="alert">
                        <i class="fa fa-warning" aria-hidden="true"></i> No hay cursos
                    </div>
                @else
                    <ul class="list-group list-group-flush">
                        @foreach ($courses as $course)
                            <li class="list-group-item bg-secondary d-flex align-items-center text-white">
                                <span class="mr-3">{{ $course }}</span>
                                <a href="{{ route('ver-curso', $course) }}" class="btn btn-sm btn-primary">
                                    Ver curso
                                </a>
                            </li>
                        @endforeach
                    </ul>
                @endif
            </div>
        </div>
    </div>
@endsection
