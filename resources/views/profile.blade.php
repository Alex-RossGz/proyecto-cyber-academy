{{-- See the profile of the $user, containing: nombre, apellido_paterno, apellido_materno, fecha_nacimiento, direccion
    in a form that can be edited. --}}

@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="card col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading display-4 text-center">
                        <i class="fa fa-edit" aria-hidden="true"></i>
                        Editar perfil
                    </div>
                    <div class="panel-body text-center justify-content-center">
                        <form id="form" class="form-horizontal" role="form" method="POST"
                            action="{{ url('profile') }}">
                            {{ csrf_field() }}

                            <div class="row mb-3 {{ $errors->has('nombre') ? ' has-error' : '' }}">
                                <label for="nombre" class="col-md-4 form-label">Nombre</label>

                                <div class="col-md-6">
                                    <input id="nombre" type="text" class="form-control" name="nombre"
                                        value="{{ $user->nombre }}"  autofocus>

                                    @if ($errors->has('nombre'))
                                        <span class="help-block text-left">
                                            <strong>{{ $errors->first('nombre') }}</strong>
                                        </span>
                                    @endif
                                    <div class="form-text">
                                        <span id="nombreHelp" class="form-text text-muted">Anterior:
                                            {{ $user->nombre }}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 {{ $errors->has('apellido_paterno') ? ' has-error' : '' }}">
                                <label for="apellido_paterno" class="col-md-4 form-label">Apellido paterno</label>

                                <div class="col-md-6">
                                    <input id="apellido_paterno" type="text" class="form-control" name="apellido_paterno"
                                        value="{{ $user->apellido_paterno }}"  autofocus>

                                    @if ($errors->has('apellido_paterno'))
                                        <span class="help-block text-left">
                                            <strong>{{ $errors->first('apellido_paterno') }}</strong>
                                        </span>
                                    @endif

                                    <div class="form-text">
                                        <span id="apellido_paternoHelp" class="form-text text-muted">Anterior:
                                            {{ $user->apellido_paterno }}</span>

                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 {{ $errors->has('apellido_materno') ? ' has-error' : '' }}">
                                <label for="apellido_materno" class="col-md-4 form-label">Apellido materno</label>

                                <div class="col-md-6">
                                    <input id="apellido_materno" type="text" class="form-control" name="apellido_materno"
                                        value="{{ $user->apellido_materno }}"  autofocus>

                                    @if ($errors->has('apellido_materno'))
                                        <span class="help-block text-left">
                                            <strong>{{ $errors->first('apellido_materno') }}</strong>
                                        </span>
                                    @endif

                                    <div class="form-text">
                                        <span id="apellido_maternoHelp" class="form-text text-muted">Anterior:
                                            {{ $user->apellido_materno ?? 'N/A' }}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 {{ $errors->has('fecha_nacimiento') ? ' has-error' : '' }}">
                                <label for="fecha_nacimiento" class="col-md-4 form-label">Fecha de nacimiento</label>

                                <div class="col-md-6">
                                    <input id="fecha_nacimiento" type="date" class="form-control" name="fecha_nacimiento"
                                        value="{!! date('Y-m-d', strtotime($user->fecha_nacimiento)) !!}"  autofocus>

                                    @if ($errors->has('fecha_nacimiento'))
                                        <span class="help-block text-left">
                                            <strong>{{ $errors->first('fecha_nacimiento') }}</strong>
                                        </span>
                                    @endif

                                    <div class="form-text">
                                        <span id="fecha_nacimientoHelp" class="form-text text-muted">Anterior:
                                            {{ date('d/m/Y', strtotime($user->fecha_nacimiento)) }}</span>
                                    </div>
                                </div>
                            </div>

                            {{-- genero --}}
                            <div class="row mb-3 {{ $errors->has('genero') ? ' has-error' : '' }}">
                                <label for="genero" class="col-md-4 form-label">Género</label>

                                <div class="col-md-6">
                                    <div class="m-4">
                                        <div class="btn-group">
                                            <input type="radio" class="btn-check" name="options" id="radio1"
                                                autocomplete="off">
                                            <label class="btn btn-outline-primary" for="radio1">
                                                <i class="fa fa-mars" aria-hidden="true"></i>
                                            </label>

                                            <input type="radio" class="btn-check" name="options" id="radio2"
                                                autocomplete="off">
                                            <label class="btn btn-outline-primary" for="radio2">
                                                <i class="fa fa-venus" aria-hidden="true"></i>
                                            </label>

                                            <input type="radio" class="btn-check" name="options" id="radio3"
                                                autocomplete="off">
                                            <label class="btn btn-outline-primary" for="radio3">
                                                <i class="fa fa-times" aria-hidden="true"></i>
                                            </label>
                                        </div>

                                        <div class="form-text">
                                            <span id="generoHelp" class="form-text text-muted">Anterior:
                                                {{ $user->genero ?? 'Prefiero no decirlo' }}</span>

                                        </div>
                                    </div>
                                </div>

                                <div class="inalterables">
                                    <p>
                                        <strong>Nota:</strong> Los siguientes campos no se pueden modificar.
                                    </p>
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <strong>Correo electrónico:</strong> {{ $core_user->email }}
                                        </li>
                                        <li class="list-group-item">
                                            <strong>Username:</strong> {{ $core_user->name }}
                                        </li>
                                        <li class="list-group-item">
                                            <a href="{{ route('password.request') }}" class="btn btn-link">
                                                Cambiar contraseña
                                            </a>
                                        </li>

                                    </ul>
                                    {{-- go to /password/reset no route defined --}}


                                </div>



                                </div>
                                {{-- if cve_direccion == 1 then the user hasn't registered a direction yet --}}
                                @if ($user->cve_direccion == 1)
                                    <vaddress title="Registrar una"></vaddress>
                                @else
                                    <vaddress title="Editar tu" old_address='{!! json_encode($address) !!}'></vaddress>
                                @endif

                                <div class="row mb-3">
                                    <div class="col-md-6 col-md-offset-4">
                                        <button type="submit" class="btn btn-primary disabled">
                                            Guardar cambios
                                        </button>
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
