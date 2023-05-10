<?php

namespace App\Http\Controllers;

use App\Models\Correo;
use App\Models\Direccion;
use App\Models\Experiencia;
use App\Models\Interes;
use App\Models\Telefono;
use DB;
use Illuminate\Http\Request;
use App\Models\Persona;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    public function update(Request $request)
    {
        // Validate the request data
        $validated = $request->validate([
            'nombre' => 'required|string|max:255',
            'apellido_paterno' => 'required|string|max:255',
            'apellido_materno' => 'required|string|max:255',
            'fecha_nacimiento' => 'required|date',
            'genero' => ['nullable', Rule::in(['M', 'F'])],
            'grado_escolar' => 'required|exists:grado_escolar,cve_grado_escolar',
        ]);

        // Find the user and their persona record
        $user = Auth::user();
        $persona = $user->persona;

        // Update the persona record with the new data
        $persona->update([
            'nombre' => $validated['nombre'],
            'apellido_paterno' => $validated['apellido_paterno'],
            'apellido_materno' => $validated['apellido_materno'],
            'fecha_nacimiento' => $validated['fecha_nacimiento'],
            'genero' => $validated['genero'],
            'cve_grado_escolar' => $validated['grado_escolar'],
        ]);

        // Redirect back to the profile page with a success message
        return redirect()->back()->with('success', 'Se ha actualizado tu perfil.');
    }

    public function updateAddress(Request $request)
    {
        try {

            $request->validate([
                'cve_pais' => 'required|exists:pais,cve_pais',
                'cve_ciudad' => 'required|exists:ciudad,cve_ciudad',
                'direccion' => 'required|max:100',
                'numero' => 'required|max:5',
                'codigo_postal' => 'required|max:5',
            ]);

            $user = Auth::user();
            $persona = $user->persona;

            if ($persona->cve_direccion) {
                $direccion = Direccion::find($persona->cve_direccion);
            } else {
                $direccion = new Direccion();
            }

            $direccion->cve_ciudad = $request->cve_ciudad;
            $direccion->direccion = $request->direccion;
            $direccion->numero = $request->numero;
            $direccion->codigo_postal = $request->codigo_postal;

            $direccion->save();

            if (!$persona->cve_direccion) {
                $persona->cve_direccion = $direccion->cve_direccion;
                $persona->save();
            }

            return response()->json([
                'message' => 'Su dirección se ha actualizado correctamente.',
                'direccion' => $direccion,
                'success' => true,
                'error' => false,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Hubo un error al actualizar su dirección.',
                'success' => false,
                'error' => true,
                'th' => $th->getMessage(),
            ]);
        }
    }

    public function getIntereses()
    {
        $alumno = Auth::user()->alumno;

        $intereses = $alumno->intereses;

        return response()->json([
            'intereses' => $intereses,
            'success' => true,
            'error' => false,
        ]);
    }

    public function getExperiencia()
    {
        $profesor = Auth::user()->profesor;

        $experiencia = $profesor->experiencia;

        $experiencia = $experiencia->map(function ($exp) {
            $fecha_inicio = new \DateTime($exp->fecha_inicio);
            $fecha_fin = new \DateTime($exp->fecha_fin);

            $exp->fecha_inicio = $fecha_inicio->format('Y-m-d');
            $exp->fecha_fin = $fecha_fin->format('Y-m-d');
            return $exp;
        });


        return response()->json([
            'experiencia' => $experiencia,
            'success' => true,
            'error' => false,
        ]);
    }

    public function updateIntereses(Request $request)
    {
        try {
            // validate non-empty array ['', '', ''] is invalid
            $validate = $request->validate([
                'intereses' => 'required|array|min:1|max:4',
            ]);

            $alumno = Auth::user()->alumno;

            $alumno->intereses()->delete();


            foreach ($validate['intereses'] as $interes) {
                DB::transaction(function () use ($interes, $alumno) {
                    Interes::create([
                        'interes' => $interes['interes'],
                        'cve_alumno' => $alumno->cve_alumno,
                    ]);
                });
            }

            return response()->json([
                'message' => 'Sus intereses se han actualizado correctamente.',
                'success' => true,
                'error' => false,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Hubo un error al actualizar sus intereses.',
                'success' => false,
                'error' => true,
                'th' => $th->getMessage(),
            ]);
        }
    }

    public function updateExperiencia(Request $request)
    {
        try {

            $profesor = Auth::user()->profesor;

            $profesor->experiencia()->delete();


            foreach ($request->all() as $experiencia) {
                DB::transaction(function () use ($experiencia, $profesor) {
                    Experiencia::create([
                        'especialidad' => $experiencia['especialidad'],
                        'descripcion' => $experiencia['descripcion'],
                        'fecha_inicio' => $experiencia['fecha_inicio'],
                        'fecha_fin' => $experiencia['fecha_fin'],
                        'cve_profesor' => $profesor->cve_profesor,
                    ]);
                });
            }

            return response()->json([
                'message' => 'Su experiencia se ha actualizado correctamente.',
                'success' => true,
                'error' => false,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Hubo un error al actualizar su experiencia.',
                'success' => false,
                'error' => true,
                'th' => $th->getMessage(),
            ]);
        }
    }

    public function getTelefono()
    {
        $persona = Auth::user()->persona;

        $telefono = $persona->telefono;

        return response()->json([
            'telefono' => $telefono,
            'success' => true,
            'error' => false,
        ]);
    }

    public function getCorreo()
    {
        $persona = Auth::user()->persona;

        $correo = $persona->correo;

        return response()->json([
            'correo' => $correo,
            'success' => true,
            'error' => false,
        ]);
    }

    public function updateTelefono()
    {
        try {
            $persona = Auth::user()->persona;
            $persona->telefono()->delete();

            foreach (request()->all()['phones'] as $telefono) {
                DB::transaction(function () use ($telefono, $persona) {
                    Telefono::create([
                        'telefono' => $telefono,
                        'lada' => 55,
                        'cve_persona' => $persona->cve_persona,
                    ]);
                });
            }

            return response()->json([
                'message' => 'Su teléfono se ha actualizado correctamente.',
                'success' => true,
                'error' => false,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Hubo un error al actualizar su teléfono.',
                'success' => false,
                'error' => true,
                'th' => $th->getMessage(),
            ]);
        }
    }

    public function updateCorreo()
    {
        try {
            $persona = Auth::user()->persona;
            $persona->correo()->delete();

            foreach (request()->all()['emails'] as $correo) {
                DB::transaction(function () use ($correo, $persona) {
                    Correo::create([
                        'correo' => $correo,
                        'dominio' => preg_replace('/.*@/', '', $correo),
                        'cve_persona' => $persona->cve_persona,
                    ]);
                });
            }

            return response()->json([
                'message' => 'Su correo se ha actualizado correctamente.',
                'success' => true,
                'error' => false,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Hubo un error al actualizar su correo.',
                'success' => false,
                'error' => true,
                'th' => $th->getMessage(),
            ]);
        }
    }

}
