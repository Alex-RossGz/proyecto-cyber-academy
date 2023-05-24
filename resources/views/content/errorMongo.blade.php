<!-- resources/views/error.blade.php -->

@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card mt-5">
                    <div class="card-header text-white bg-secondary">
                        {{-- Error: app name --}}
                        <h4 class="mb-0">Error: <strong>{{ config('app.name') }}</strong> tiene problemas en su servicio
                        </h4>
                    </div>
                    <div class="card-body">
                        <small id="status" class="form-text text-muted">Error 500</small>
                        <h5 class="card-title">No se puede acceder a la base de datos MongoDB</h5>
                        <p class="card-text">Lo sentimos, estamos experimentando problemas técnicos. Por favor, inténtelo de
                            nuevo más tarde.</p>
                        <a href="{{ url('/login') }}" class="btn btn-secondary text-white">Reintentar inicio de sesión</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
