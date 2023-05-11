<?php

namespace App\Http\Controllers;

use App\Models\CourseMongo;
use App\Models\Grado_Escolar;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Termwind\Components\Dd;
use App\Models\Direccion;
use App\Models\Ciudad;
use App\Models\Pais;
use App\Models\Persona;

class PageController extends Controller
{
    # const max_courses = 3;
    private int $max_courses = 3;

    public function index()
    {
        //dd(asset('curso/curso1.jpg'));
        $id = Auth::check() ? Auth::user()->id : 0;

        # pick 3 random numbers in courses range
        $many_courses = CourseMongo::all()->count() > $this->max_courses;
        $courses = $many_courses
            ? CourseMongo::all()
            ->shuffle()
            ->random(3)
            : CourseMongo::all();

        foreach ($courses as $course) {
            # check if course is version 2, if so, fetch the nombre from table persona where cve_persona = author
            if (($course->version ?? 1) == 2) {
                $author = DB::table('persona')
                    ->where('cve_persona', User::where('id', $course->author)->first()->cve_persona)
                    ->first();

                $author = $author->nombre . ' ' . $author->apellido_paterno . ' ' . $author->apellido_materno;
                $course->author = $author;
            }
        }

        $user = DB::table('persona')
            ->where('cve_persona', User::find($id)->cve_persona ?? 0)
            ->first();
        $data = compact('courses', 'id', 'user');

        return view('home.index', $data);
    }

    public function profile()
    {
        $user = Auth::user();

        // Get the person who owns the user (cve_persona = $user->id) no need to join
        $persona = Persona::where('cve_persona', $user->cve_persona)->first();

        // Get address, city, and country using Eloquent relationships
        $direccion = Direccion::find($persona->cve_direccion);
        if ($direccion) {
            $ciudad = Ciudad::find($direccion->cve_ciudad);
            $pais = Pais::find($ciudad->cve_pais);

            // Fill address with the required details
            $address = [
                'codigo_postal' => $direccion->codigo_postal,
                'numero' => $direccion->numero,
                'direccion' => $direccion->direccion,
                'ciudad' => $ciudad->ciudad,
                'pais' => $pais->pais,
                'cve_pais' => $pais->cve_pais,
                'cve_ciudad' => $ciudad->cve_ciudad,
            ];
        }
        $address = $address ?? null;

        $grados_escolares = Grado_Escolar::all();

        # merge user and person data
        $core_user = $user;
        $user = $persona;

        $data = compact('user', 'address', 'core_user', 'grados_escolares');

        return view('profile', $data);
    }

    public function update_profile(Request $request)
    {
        # in request if an input is empty, don't update it
        /* Request:
         */

        dd($request->all());

        return 'test';
    }

    public function membership()
    {
        if (Auth::guest()) {
            return redirect()->route('login');
        }
        return view('content.membresía');
    }

    public function payment(Request $request)
    {
        $membership = $request->membership;
        if (Auth::guest()) {
            return redirect()->route('login');
        } else if (!in_array($membership, ['basica', 'premium'])) {
            return redirect()->route('membership');
        }

        return view('content.payment', compact('membership'));
    }

    public function proceed_payment(Request $request)
    {
        $membership = $request->membership;
        if (Auth::guest()) {
            return redirect()->route('login');
        } else if (!in_array($membership, ['basica', 'premium'])) {
            return redirect()->route('membership');
        }

        $paymentMethods = [
            'paypal' => ['logo' => asset('logos/paypal.png'), 'method' => 'paypal'],
            'stripe' => ['logo' => asset('logos/stripe.png'), 'method' => 'stripe'],
            'cash'   => ['logo' => asset('logos/cash.webp'), 'method' => 'cash'],
        ];

        $payment = $paymentMethods[$request->payment_method] ?? null;


        return view('content.proceed_payment', compact('membership', 'payment'));
    }
}
