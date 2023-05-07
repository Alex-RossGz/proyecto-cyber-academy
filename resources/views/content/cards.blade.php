<div class="col z-1">
    <div class="card h-100 z-1 {{ $course->premium ? 'bg-dark text-white shadow-lg border-info' : 'bg-light' }}">
        {{-- Curso can be .jpg or .png how can i detec which one is --}}
        {{-- place a bolt icon from the top right corner --}}
        <img src="{{ get_course_image_path($course->id) }}" class="card-img-top z-0" alt="...">
        @if ($course->premium)
            <span class="position-absolute top-0 end-0 translate-middle badge rounded-pill bg-info z-1">
                <i class="fas fa-bolt"></i>
                <span class="visually-hidden">Premium</span>
            </span>
        @endif


        <div class="card-body">

            <h5 class="card-title">{{ $course->title ?? 'Card title' }}</h5>
            <p class="card-text text-truncate"
                onclick="/* remove text-truncate to show all text */ this.classList.toggle('text-truncate')">
                {{ $course->description ?? 'Descripción del curso' }}
            </p>
        </div>
        {{-- botón para continuar --}}
        <div class="card-footer justify-content-center">

            {{-- ver más --}}
            @if (!Auth::guest() && in_array(auth()->user()->id, $course->subscribers ?? []))
                <a class="d-block btn text-white mb-1 {{ $course->premium ? 'btn-info' : 'btn-secondary' }}"
                    href="{{ route('ver-curso', [$id => str_replace(' ', '_', $course->title)]) }}">
                    <i class="fa fa-check" aria-hidden="true"></i>
                    Ir al curso
                </a>
            @else
                <a class="d-block btn btn-outline-secondary"
                    href="{{ route('ver-curso', [$id => str_replace(' ', '_', $course->title)]) }}">
                    <i class="fa fa-plus-circle" aria-hidden="true"></i>
                    Inscribirme al curso
                </a>
            @endif
        </div>


        <div class="card-footer">
            <small class="text-muted">
                Autor: <a href="" class="{{ $course->premium ? 'text-light' : 'text-primary' }}">
                    {{ '@' . $course->author ?? 'Anónimo' }}
                </a>
            </small>
        </div>
    </div>
</div>
