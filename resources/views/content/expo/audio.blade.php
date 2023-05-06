@extends('layout')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Audio</h1>
                <p>Auditivo</p>
            </div>
        </div>
        <vaudio :src="'{{ asset('curso/mp3.mp3') }}'"></vaudio>
    </div>
@endsection
