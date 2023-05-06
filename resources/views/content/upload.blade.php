{{-- A form to upload a course, requires: title, description, a list of topics and the image of the course --}}

@extends('layouts.app')

@section('content')
    <div class="container" id="form">
        <div class="row align-items-center justify-content-center">
            <div class="card col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading display-4">Proponer un curso</div>
                    {{-- Subheading --}}
                    <small class="fst-italic">
                        Recuerda que tendrá que ser revisado por los moderadores.
                    </small>
                    <div class="panel-body text-center justify-content-center">
                        <form class="form-horizontal" role="form" method="POST" action="{{ url('proponer') }}"
                            enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <div class="row mb-3 {{ $errors->has('title') ? ' has-error' : '' }}">
                                <label for="title" class="col-md-4 form-label">Título</label>

                                <div class="col-md-6">
                                    <input id="title" type="text" class="form-control" name="title"
                                        value="{{ old('title') }}" required autofocus>

                                    @if ($errors->has('title'))
                                        <span class="help-block text-left">
                                            <strong>{{ $errors->first('title') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="row mb-3 {{ $errors->has('description') ? ' has-error' : '' }}">
                                <label for="description" class="col-md-4 form-label">Descripción</label>

                                <div class="col-md-6">
                                    <textarea id="description" type="text" class="form-control" name="description" required>{{ old('description') }}</textarea>

                                    @if ($errors->has('description'))
                                        <span class="help-block text-left">
                                            <strong>{{ $errors->first('description') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            {{-- Temario será insertado en mongo como un arreglo de strings, entonces debes de ser capaz de poner una cantidad variables de strings --}}
                            <temario>Proponer temario</temario>

                            <div class="row mb-3 {{ $errors->has('image') ? ' has-error' : '' }}">
                                <label for="image" class="col-md-4 form-label">Imagen</label>

                                <div class="col-md-6">
                                    <input id="image" type="file" class="form-control" name="image" required
                                        accept="image/png, image/jpeg">

                                    @if ($errors->has('image'))
                                        <span class="help-block text-left">
                                            <strong>{{ $errors->first('image') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="row mb-3 text-center">
                                <div class="col-md-6 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary" v-on:click="if(checkItems()) { $event.preventDefault(); }">
                                        <i class="fa fa-upload" aria-hidden="true"></i>
                                        Proponer curso
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
