<div class="col">
    <div class="card h-100">
        <img src="{{ asset("curso/curso$course->id.jpg") }}" class="card-img-top" alt="...">
        <div class="card-body">

            <h5 class="card-title">{{ $course->title ?? 'Card title' }}</h5>
            <p class="card-text text-truncate"
                onclick="/* remove text-truncate to show all text */ this.classList.toggle('text-truncate')">
                {{ $course->description ?? 'Descripción del curso'}}
            </p>
        </div>
        {{-- botón para continuar --}}
        <div class="card-footer justify-content-center">

            {{-- ver más --}}
            @if (!Auth::guest() && in_array(auth()->user()->id, $course->subscribers ?? []))
                <a class="d-block btn btn-secondary text-white mb-1" href="{{ route('ver-curso', [$id => str_replace(' ', '_', $course->title)]) }}">
                    <i class="fa fa-check" aria-hidden="true"></i>
                    Ir al curso
                </a>
            @else
                <a class="d-block btn btn-outline-secondary" href="{{ route('ver-curso', [$id => str_replace(' ', '_', $course->title)]) }}">
                    <i class="fa fa-plus-circle" aria-hidden="true"></i>
                    Inscribirme al curso
                </a>
            @endif
        </div>


        <div class="card-footer">
            <small class="text-muted">
                Autor: <a href="" class="link-success">
                    {{ '@' . $course->author ?? 'Anónimo' }}
                </a>
            </small>
        </div>
    </div>
</div>
