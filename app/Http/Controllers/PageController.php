<?php

namespace App\Http\Controllers;

use App\Models\CourseMongo;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Termwind\Components\Dd;

class PageController extends Controller
{

    public function index()
    {

        //dd(asset('curso/curso1.jpg'));
        $id = Auth::check() ? Auth::user()->id : 0;
        # pick 3 random numbers in courses range
        $courses = CourseMongo::all()->shuffle()->random(3);

        foreach ($courses as $course) {
            # check if course is version 2, if so, fetch the nombre from table persona where cve_persona = author
            if (($course->version ?? 1) == 2) {
                $author = DB::table('persona')->where('cve_persona',User::where('id', $course->author)->first()->cve_persona)->first();

                $author = $author->nombre . ' ' . $author->apellido_paterno . ' ' . $author->apellido_materno;
                $course->author = $author;
            }
        }

        $user = DB::table('persona')->where('cve_persona', User::find($id)->cve_persona ?? 0)->first();
        $data = compact('courses', 'id', 'user');

        return view('home.index', $data);
    }

    public function profile()
    {
        $user = Auth::user();
        # get the person who owns the user (cve_persona = $user->id) no need to join
        $user = DB::table('persona')
            ->join('users', 'users.cve_persona', '=', 'persona.cve_persona')
            ->where('users.id', $user->id)
            ->get()->first();

        $address = [];
        $get_address = DB::table('direccion')
            ->where('cve_direccion', $user->cve_direccion)
            ->get()->first();

        // fill with codigo_postal, numero, direccion
        $address['codigo_postal'] = $get_address->codigo_postal;
        $address['numero'] = $get_address->numero;
        $address['direccion'] = $get_address->direccion;


        $get_city = DB::table('ciudad')
        ->where('cve_ciudad', $get_address->cve_ciudad)
        ->get()->first();

        $address['ciudad'] = $get_city->ciudad;

        $get_country = DB::table('pais')
            ->where('cve_pais', $get_city->cve_pais)
            ->get()->first();

        $address['pais'] = $get_country->pais;

        $data = compact('user', 'address');


        return view('profile', $data);
    }

    public function update_profile(Request $request)
    {
        # in request if an input is empty, don't update it
        /* Request:

         */

         dd($request->all());

         return "test";
    }
}
