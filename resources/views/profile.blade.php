@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header display-4 text-center my-5">
                        <i class="fa fa-edit" aria-hidden="true"></i>
                        Editar perfil
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ url('perfil') }}">
                            {{ csrf_field() }}

                            <div class="mb-3 {{ $errors->has('nombre') ? 'has-error' : '' }}">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input id="nombre" type="text" class="form-control" name="nombre"
                                    value="{{ $user->nombre }}" autofocus>
                                @if ($errors->has('nombre'))
                                    <span class="help-block text-danger">
                                        <strong>{{ $errors->first('nombre') }}</strong>
                                    </span>
                                @endif
                                <div class="form-text">
                                    <span id="nombreHelp" class="form-text text-muted">Anterior: {{ $user->nombre }}</span>
                                </div>
                            </div>

                            <div class="mb-3 {{ $errors->has('apellido_paterno') ? 'has-error' : '' }}">
                                <label for="apellido_paterno" class="form-label">Apellido paterno</label>
                                <input id="apellido_paterno" type="text" class="form-control" name="apellido_paterno"
                                    value="{{ $user->apellido_paterno }}" autofocus>
                                @if ($errors->has('apellido_paterno'))
                                    <span class="help-block text-danger">
                                        <strong>{{ $errors->first('apellido_paterno') }}</strong>
                                    </span>
                                @endif
                                <div class="form-text">
                                    <span id="apellido_paternoHelp" class="form-text text-muted">Anterior:
                                        {{ $user->apellido_paterno }}</span>
                                </div>
                            </div>

                            <div class="mb-3 {{ $errors->has('apellido_materno') ? 'has-error' : '' }}">
                                <label for="apellido_materno" class="form-label">Apellido materno</label>
                                <input id="apellido_materno" type="text" class="form-control" name="apellido_materno"
                                    value="{{ $user->apellido_materno }}" autofocus>
                                @if ($errors->has('apellido_materno'))
                                    <span class="help-block text-danger">
                                        <strong>{{ $errors->first('apellido_materno') }}</strong>
                                    </span>
                                @endif
                                <div class="form-text">
                                    <span id="apellido_maternoHelp" class="form-text text-muted">Anterior:
                                        {{ $user->apellido_materno ?? 'N/A' }}</span>
                                </div>
                            </div>

                            <div class="mb-3 {{ $errors->has('fecha_nacimiento') ? 'has-error' : '' }}">
                                <label for="fecha_nacimiento" class="form-label">Fecha de nacimiento</label>
                                <input id="fecha_nacimiento" type="date" class="form-control" name="fecha_nacimiento"
                                    value="{!! date('Y-m-d', strtotime($user->fecha_nacimiento)) !!}" autofocus>
                                @if ($errors->has('fecha_nacimiento'))
                                    <span class="help-block text-danger">
                                        <strong>{{ $errors->first('fecha_nacimiento') }}</strong>
                                    </span>
                                @endif
                                <div class="form-text">
                                    <span id="fecha_nacimientoHelp" class="form-text text-muted">Anterior:
                                        {{ date('d/m/Y', strtotime($user->fecha_nacimiento)) }}</span>
                                </div>
                            </div>
                            <div class="mb-3 {{ $errors->has('genero') ? 'has-error' : '' }}">
                                <label for="genero" class="form-label">Género</label>
                                <div class="d-flex justify-content-center">
                                    <div class="btn-group">
                                        <input type="radio" class="btn-check" name="genero" {{ $user->genero == 'M' ? 'checked' : '' }} value="M" id="male">
                                        <label class="btn btn-outline-primary" for="male">
                                            <i class="fa fa-mars" aria-hidden="true"></i>
                                        </label>

                                        <input type="radio" class="btn-check" name="genero" {{ $user->genero == 'F' ? 'checked' : '' }} value="F" id="female">
                                        <label class="btn btn-outline-primary" for="female">
                                            <i class="fa fa-venus" aria-hidden="true"></i>
                                        </label>

                                        <input type="radio" class="btn-check" name="genero" {{ $user->genero != 'M' && $user->genero != 'F' ? 'checked' : '' }} value="" id="null">
                                        <label class="btn btn-outline-primary" for="null">
                                            <i class="fa fa-times" aria-hidden="true"></i>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-text">
                                    <span id="generoHelp" class="form-text text-muted">Anterior:
                                        {{ $user->genero ?? 'Prefiero no decirlo' }}</span>
                                </div>
                            </div>

                            <div class="mb-3">
                                <p><strong>Nota:</strong> Los siguientes campos no se pueden modificar.</p>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <strong>Correo electrónico:</strong> {{ $core_user->email }}
                                    </li>
                                    <li class="list-group-item">
                                        <strong>Username:</strong> {{ $core_user->name }}
                                    </li>
                                    <li class="list-group-item text-center">
                                        <a href="{{ route('password.request') }}" class="btn btn-danger text-white">
                                            Cambiar contraseña <i class="fa fa-key" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="mb-3" id="address" >
                                @if ($user->cve_direccion == 1)
                                    <vaddress title="Registrar una"></vaddress>
                                @else
                                    <vaddress title="Editar tu" old_address='{!! json_encode($address) !!}'></vaddress>
                                @endif
                            </div>

                            <div class="mb-3 d-flex justify-content-center">
                                <button type="submit" class="btn btn-primary text-white">
                                    Guardar cambios <i class="fa fa-floppy-o" aria-hidden="true"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
