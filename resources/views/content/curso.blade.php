@extends('layout')

@section('content')
    <div class="{{ $course->premium ? 'bg-info' : 'bg-primary' }} text-white mb-5 pb-1 pt-3 px-3">
        {{-- Breadcrum --}}
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a class="link-light" href="{{ route('home') }}">Home</a></li>
                <li class="breadcrumb-item"><a class="link-light" href="{{ route('course') }}">Curso</a></li>
                <li class="breadcrumb-item">{{ $course->title }}</li>
            </ol>
        </nav>
        <h2 class="fst-italic">
            {{ $course->title }}
        </h2>
    </div>
    <div id="curso" class="row">

        <div class="col-6">
            <p class="text-justify">
                {{ html_entity_decode(str_replace('&nbsp;', ' ', htmlentities($course->description, null, 'utf-8'))) }}
            </p>
            {{-- if not subscribed --}}
            @unless ($subscribed)
                <p class="mt-5">
                <form action="{{ route('subscribe') }}" method="POST">
                    @csrf
                    <input type="hidden" name="course" value="{{ $course->_id }}">

                    <button type="submit" class="btn btn-secondary px-5">
                        <i class="fa fa-unlock" aria-hidden="true"></i>
                        Suscribirse
                    </button>
                </form>
                </p>
            @endunless
            <table class="table table-hover mt-5">
                <thead class="{{ $course->premium ? 'bg-info' : 'bg-primary' }} text-white">
                    <tr>
                        <th class="text-center">#</th>
                        <th>Temario</th>
                        <th class="text-center">Auditivo</th>
                        <th class="text-center">Escrito</th>
                        <th class="text-center">Visual</th>
                    </tr>

                </thead>
                <tbody class="table-group-divider">
                    @forelse ($course->temario ?? [] as $tema)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>
                                {{ $tema }}
                            </td>
                            <td class="text-center text-secondary">
                                <form action="{{ route('course.ver') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="course" value="{{ $course->_id }}">
                                    <input type="hidden" name="tema" value="{{ $loop->iteration }}">
                                    <input type="hidden" name="aprendizaje" value="auditivo">
                                    <button type="submit"
                                        class="btn btn-link p-0 @unless ($subscribed) disabled @endunless {{ $course->premium ? 'text-info' : '' }}">
                                        <i class="fa
                                        fa-volume-up"
                                            aria-hidden="true"></i>
                                    </button>
                                </form>
                            </td>
                            <td class="text-center text-secondary">
                                {{-- Send course and tema by post --}}
                                <form action="{{ route('course.ver') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="course" value="{{ $course->_id }}">
                                    <input type="hidden" name="tema" value="{{ $loop->iteration }}">
                                    <input type="hidden" name="aprendizaje" value="escrito">
                                    <button type="submit"
                                        class="btn btn-link p-0 @unless ($subscribed) disabled @endunless {{ $course->premium ? 'text-info' : '' }}">
                                        <i class="fa
                                        fa-file-pdf"
                                            aria-hidden="true"></i>
                                    </button>
                                </form>
                            </td>
                            <td class="text-center text-secondary">
                                {{-- Send course and tema by post --}}
                                <form action="{{ route('course.ver') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="course" value="{{ $course->_id }}">
                                    <input type="hidden" name="tema" value="{{ $loop->iteration }}">
                                    <input type="hidden" name="aprendizaje" value="visual">
                                    <button type="submit"
                                        class="btn btn-link p-0 @unless ($subscribed) disabled @endunless {{ $course->premium ? 'text-info' : '' }}">
                                        <i class="fa
                                        fa-video-camera"
                                            aria-hidden="true"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr class="text-center">
                            <td colspan="5" class="text-center">No hay temas</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <aside class="col-6 pl-3">
            <div
                style="background-image: url({{ get_course_image_path($course->id) }});
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                height: 300px; width: 100%;">
            </div>
        </aside>
    </div>
@endsection('content')
