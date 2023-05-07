@php
    $user = Auth::user();
@endphp
@extends('layouts.app')

@section('content')
    <div class="container my-5 text-center">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card-deck">
                    <div
                        class="card mb-4 box-shadow {{ $user->membership === null ? 'p-3 bg-primary bg-opacity-10 border border-primary border-start-0 rounded-end' : '' }}">
                        {{-- membership --}}
                        <div class="card-header">
                            <h4 class="my-0 font-weight-normal text-center">
                                <i class="fas fa-times-circle"></i>
                                Sin membresía @if ($user->membership === null)
                                    <span class="badge badge-primary bg-primary">Actual</span>
                                @endif
                            </h4>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title text-center">$0 <small class="text-muted">/ mes</small>
                            </h1>
                            <ul class="list-unstyled mt-3 mb-4">
                                <li>Acceso al catálogo de cursos</li>
                                <li>Opción de comprar cursos individualmente</li>
                            </ul>
                        </div>
                    </div>
                    <div
                        class="card mb-4 box-shadow {{ $user->membership === 'basica' ? 'p-3 bg-primary bg-opacity-10 border border-primary border-start-0 rounded-end' : '' }}">
                        <div class="card-header">
                            <h4 class="my-0 font-weight-normal text-center">
                                {{-- star --}}
                                <i class="fas fa-star"></i>
                                Membresía básica @if ($user->membership === 'basica')
                                    <span class="badge badge-primary bg-primary">Actual</span>
                                @endif
                            </h4>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title text-center">$9 <small class="text-muted">/ mes</small>
                            </h1>
                            <ul class="list-unstyled mt-3 mb-4">
                                <li>Acceso ilimitado a todos los cursos básicos</li>
                                <li>Opción de actualizar a membresía premium</li>
                            </ul>
                            @if ($user->membership == null)
                                <button type="button" class="btn btn-lg btn-block btn-primary rounded-pill text-white">Regístrate</button>
                            @endif
                        </div>
                    </div>
                    <div
                        class="card mb-4 box-shadow {{ $user->membership === 'premium' ? 'p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end' : '' }}">
                        <div class="card-header bg-dark">
                            <h4 class="my-0 font-weight-normal text-center text-white">
                                {{-- lightning bolt --}}
                                <i class="fas fa-bolt"></i>
                                Membresía <em><strong>premium</strong></em>
                                @if ($user->membership === 'premium')
                                    <span class="badge badge-info bg-info">Actual</span>
                                @endif
                            </h4>
                        </div>
                        <div class="card-body bg-dark">
                            <h1 class="card-title pricing-card-title text-center text-white">$19 <small class="text-muted">/
                                    mes</small></h1>
                            <ul class="list-unstyled mt-3 mb-4 text-white">
                                <li>Acceso ilimitado a todos los cursos</li>
                                <li>Plan de aprendizaje personalizado</li>
                                <li>Acceso exclusivo a contenido premium</li>
                            </ul>
                            @if ($user->membership == null || $user->membership == 'basica')
                                    <button type="button" class="btn btn-lg btn-block btn-info rounded-pill">Regístrate</button>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
