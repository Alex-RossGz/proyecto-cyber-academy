<?php

namespace App\Http\Controllers;

use App\Models\CourseMongo;
use Illuminate\Http\Request;
use \App\Models\Curso;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Blade;

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

        $course = $request->input('course');
        $user = auth()->user()->id;

        #dd($course, $user);

        CourseMongo::where('_id', $course)->push('subscribers', $user);
        $crs = CourseMongo::where('_id', $course)->first();

        # dd($crs->title);


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

        return  view('content.suscritos', compact('courses'));
    }

    public function proponer()
    {
        return view('content.upload');
    }

    public function post_course(Request $request)
    {
        $temas = [];
        # split by comma
        foreach (explode(',', $request->input('temario')) as $tema)
            $temas[] = $tema;
        $should_id = CourseMongo::orderBy('id', 'desc')->first()->id + 1;


        $course = new CourseMongo();
        $course->id = $should_id;
        $course->title = $request->input('title');
        $course->description = $request->input('description');
        $course->temario = $temas;
        $course->author = auth()->user()->id;
        $course->version = 2;
        $course->subscribers = [];
        $course->available = false;
        $course->save();
        #compress image


        # get the id of the max course
        $request->image->move(public_path('curso'), "curso$should_id.jpg");

        return redirect()->route('home');
    }
}
