@extends('layouts.app')

@section('content')
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="text-center mb-4">Seleccione su método de pago</h2>
                <div class="card mb-4">
                    <div class="card-header text-white {{ $membership === 'basica' ? 'bg-primary' : 'bg-info' }}">
                        <h3 class="my-0 font-weight-normal text-center">Detalles de la membresía</h3>
                    </div>
                    <div class="card-body {{ $membership === 'basica' ? '' : 'bg-dark text-white' }}">
                        <p>Usted ha seleccionado la <strong>membresía
                                {{ $membership === 'basica' ? 'básica' : 'premium' }}</strong>
                            @if ($membership == 'premium')
                                -<i class="fas fa-bolt"></i>
                            @endif
                        </p>
                        <ul>
                            @if ($membership === 'basica')
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

                <div class="card-deck">
                    <div class="card mb-4 box-shadow">
                        <div class="card-header">
                            <img src="{{ asset('logos/paypal.png') }}" alt="PayPal Logo"
                                class="img-fluid img-thumbnail mx-auto" style="max-height: 200px; object-fit: cover;" />
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Pagar con PayPal</h4>
                            <p class="card-text">Pague con su cuenta de PayPal de manera segura y fácil. Con PayPal, su
                                información financiera está siempre protegida.</p>
                            <button type="button"
                                class="btn btn-lg btn-block {{ $membership !== 'premium' ? 'btn-primary' : 'btn-info' }} rounded-pill text-white">
                                <a href="{{ route('proceed', ['membership' => $membership, 'payment_method' => 'paypal']) }}"
                                    class="text-white">
                                    Seleccionar
                                </a>
                            </button>
                        </div>
                    </div>
                    <div class="card mb-4 box-shadow">
                        <div class="card-header">
                            <img src="{{ asset('logos/stripe.png') }}" alt="Stripe Logo"
                                class="img-fluid img-thumbnail mx-auto" style="max-height: 200px; object-fit: cover;" />
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Pagar con Stripe</h4>
                            <p class="card-text">Pague con su tarjeta de crédito o débito a través de la plataforma de pago
                                seguro de Stripe. Stripe garantiza la privacidad de sus datos.</p>
                            <button type="button"
                                class="btn btn-lg btn-block {{ $membership !== 'premium' ? 'btn-primary' : 'btn-info' }} rounded-pill text-white">
                                <a href="{{ route('proceed', ['membership' => $membership, 'payment_method' => 'stripe']) }}"
                                    class="text-white">
                                    Seleccionar
                                </a>
                            </button>
                        </div>
                    </div>
                    <div class="card mb-4 box-shadow">
                        <div class="card-header">
                            <img src="{{ asset('logos/cash.webp') }}" alt="Chash Logo"
                                class="img-fluid img-thumbnail mx-auto" style="max-height: 200px; object-fit: cover;" />
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Pagar en efectivo</h4>
                            <p class="card-text">Pague en efectivo en cualquier sucursal de nuestro establecimiento. No se
                                requiere cuenta bancaria ni tarjeta de crédito.</p>
                            <button type="button"
                                class="btn btn-lg btn-block {{ $membership !== 'premium' ? 'btn-primary' : 'btn-info' }} rounded-pill text-white">
                                <a href="{{ route('proceed', ['membership' => $membership, 'payment_method' => 'cash']) }}"
                                    class="text-white">
                                    Seleccionar
                                </a>
                            </button>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
@endsection
