@php
    $user = Auth::user();
@endphp
@extends('layouts.app')

@section('content')
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="text-center mb-4">Seleccione su forma de pago</h2>
                <img src="{{ $payment['logo'] }}" alt="{{ $payment['method'] }}" class="img-fluid mx-auto d-block mb-4">

                <div class="card mb-4">
                    <div class="card-header">
                        <h3 class="my-0 font-weight-normal text-center">Detalles de la membresía</h3>
                    </div>
                    <div class="card-body">
                        <p>Usted ha seleccionado la <strong>membresía {{ $membership === 'basica' ? 'básica' : 'premium' }}</strong>:</p>
                        <ul>
                            @if($membership === 'basica')
                                <li>Acceso ilimitado a todos los cursos básicos</li>
                                <li>Opción de actualizar a membresía premium</li>
                            @else
                                <li>Acceso ilimitado a todos los cursos</li>
                                <li>Plan de aprendizaje personalizado</li>
                                <li>Acceso exclusivo a contenido premium</li>
                            @endif
                        </ul>
                        <p>El costo es de <strong>${{ $membership === 'basica' ? '9' : '19' }} / mes</strong>.</p>
                    </div>
                </div>
                <div id="address">
                    {{-- pass a function that receives the form inputs and goes to the  --}}
                    <payment-options membership="{{ $membership }}" payment-method="{{ $payment['method'] }}"></payment-options>
                </div>
            </div>
        </div>
    </div>
@endsection
