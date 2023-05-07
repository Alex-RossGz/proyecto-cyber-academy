<?php

namespace App\Http\Controllers;

use App\Models\AlumnoCurso;
use App\Models\CourseMongo;
use App\Models\Materia;
use Illuminate\Http\Request;
use \App\Models\Curso;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\DB;
use \App\Models\Persona;
use \App\Models\User;

class CursoController extends Controller
{
    public function course(Request $request)
    {
        $course = $request->input('course') ?? '';

        # Curso tiene cve_profesor, profesor tiene cve_usuario y users tiene users.id (FK_PERSONA), persona tiene nombre
        $courses = CourseMongo::where('title', 'regexp', "/$course/i")->get();

        foreach ($courses as $course) {
            $course->subscribed = in_array(Auth::id(), $course->subscribers ?? []);
            $course->temas = count($course->temario ?? []);
        }

        return view('content.searchable', compact('course', 'courses'));
    }

    public function ver(Request $request)
    {
        $course = $request->input('course');
        $tema = $request->input('tema');
        $aprendizaje = $request->input('aprendizaje');

        switch ($aprendizaje) {
            case 'visual':
                return view('content.expo.video', compact('course', 'tema'));
            case 'auditivo':
                return view('content.expo.audio', compact('course', 'tema'));
            case 'escrito':
                return view('content.expo.texto', compact('course', 'tema'));
            default:
                return abort(404);
        }
    }

    # función para suscribirse a un curso
    public function subscribe(Request $request)
    {
        if (Auth::guest()) {
            return redirect()->route('login');
        }
        # else if user has membership basic or premium

        $course = $request->input('course');
        $user = auth()->user()->id;

        $crs = CourseMongo::where('_id', $course)->first();

        DB::transaction(function () use ($course, $user) {
            $course = CourseMongo::where('_id', $course)->first();
            $course->push('subscribers', $user);

            AlumnoCurso::create([
                'cve_alumno' => auth()->user()->alumno->cve_alumno,
                'cve_curso' => $course->cve_curso,
                'fecha_inscripcion' => date('Y-m-d'),
                'calificacion' => 0,
            ]);
        });

        return redirect()->route('ver-curso', [$crs->id => str_replace(' ', '_', $crs->title)]);
    }


    #función para ver los cursos a los que está suscrito el usuario
    public function subscribed()
    {
        if (Auth::guest()) {
            return redirect()->route('login');
        }

        $user = auth()->user()->id;

        $courses = [];

        foreach (CourseMongo::all() as $course) {
            if (in_array($user, $course->subscribers ?? [])) {
                $courses[] = $course->title;
            }
        }

        # dd($courses);

        return view('content.suscritos', compact('courses'));
    }

    public function proponer()
    {
        return view('content.upload');
    }

    public function post_course(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'temario' => 'required|string',
            'image' => 'required|image',
        ]);

        $temas = explode(',', $request->input('temario'));

        if (CourseMongo::all()->count() == 0)
            $should_id = 1;
        else
            $should_id = CourseMongo::all()->last()->id + 1;


        DB::transaction(function () use ($request, $temas, $should_id) {
            $course = new CourseMongo([
                'id' => $should_id,
                'cve_curso' => 0,
                'title' => $request->input('title'),
                'description' => $request->input('description'),
                'temario' => $temas,
                'author' => auth()->user()->id,
                'version' => 2,
                'subscribers' => [],
                'available' => false,
                'premium' => false,
            ]);

            $course->save();

            $curso = Curso::create([
                'nombre' => $request->input('title'),
                'cant_materia' => count($temas),
                'duracion' => count($temas) * 30,
                'cve_profesor' => auth()->user()->profesor->cve_profesor,
            ]);

            // update the course with the correct cve_curso
            $course->cve_curso = $curso->cve_curso;
            $course->save();

            // dd($curso);

            foreach ($temas as $tema) {
                Materia::create([
                    'nombre' => $tema,
                    'cant_bloques' => 30,
                    'dificultad' => 'Básico',
                    'cve_curso' => $curso->cve_curso,
                ]);
            }

            // Save the image in the public/curso folder with a unique file name
            $imageName = "curso{$should_id}." . $request->image->extension();
            $request->image->move(public_path('curso'), $imageName);
        });

        return redirect()->route('home');
    }

}
