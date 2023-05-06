@extends('layout')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Texto escrito</h1>
                <p>Escrito</p>
            </div>
        </div>

        <embed src="{{ asset('curso/pdf.pdf') }}" type="application/pdf" width="100%" height="600px" />
    </div>
@endsection
