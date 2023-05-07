<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Termwind\Components\Dd;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'lastname' => ['required', 'string', 'max:255'],
            'lastname2' => ['nullable', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255', 'unique:users,name'],
            'birthdate' => ['required', 'date'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'genero' => ['nullable', 'string', 'max:255'],
            'cve_grado_escolar' => ['required', 'integer'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     * @return \App\Models\User
     */
    protected function create(array $data): User
    {
        return DB::transaction(function () use ($data) {
            // Create a new 'persona' record and return the instance
            $persona = new \App\Models\Persona([
                'nombre' => $data['name'],
                'apellido_paterno' => $data['lastname'],
                'apellido_materno' => $data['lastname2'],
                'genero' => $data['genero'],
                'fecha_nacimiento' => $data['birthdate'],
                'cve_direccion' => 1,
            ]);

            $persona->save();

            // Create a new user record and return the instance
            $user = new User([
                'name' => $data['username'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'cve_persona' => $persona->cve_persona,
            ]);

            $user->save();

            $profesor = new \App\Models\Profesor([
                'cve_usuario' => $user->id,
            ]);

            $profesor->save();

            $alumno = new \App\Models\Alumno([
                'cve_usuario' => $user->id,
                'cve_grado_escolar' => $data['cve_grado_escolar'], // Assuming you have 'cve_grado_escolar' field in the form
            ]);
            $alumno->save();

            $correo = new \App\Models\Correo([
                'cve_persona' => $persona->cve_persona,
                'correo' => $data['email'],
                'dominio' => preg_replace('/.*@/', '', $data['email']),
            ]);
            $correo->save();


            return $user;
        });
    }

}
