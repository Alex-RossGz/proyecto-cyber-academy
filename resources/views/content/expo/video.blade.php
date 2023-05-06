@extends('layout')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Curso video</h1>
                <p>Visual</p>
            </div>
        </div>

        <iframe src="{{ asset('curso/video.mp4') }}" width="100%" height="600px" frameborder="0" allowfullscreen autoplay="false"></iframe>
    </div>
@endsection
