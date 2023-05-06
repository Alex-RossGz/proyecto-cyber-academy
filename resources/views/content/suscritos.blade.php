{{-- List the crouses in $courses --}}

@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="bg-secondary text-white mb-5 pb-1 pt-3 px-3">

            <ol>
                {{-- foreach / empty --}}
                @forelse ($courses as $course)
                    <li>
                        {{ $course }}
                    </li>
                @empty
                    <i class="fa fa-warning" aria-hidden="true"></i>
                    No hay cursos
                @endforelse

            </ol>
        </div>
    </div>
@endsection
