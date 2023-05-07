<?php

namespace App\Http\Controllers;

use App\Models\FormaPago;
use App\Models\Membership;
use App\Models\Mensualidad;
use App\Models\Pago;
use App\Models\TipoMembresia;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class MembershipController extends Controller
{
    public function update_membership(Request $request)
    {
        $prices = [
            'basica' => 9,
            'premium' => 19,
        ];

        if ($request->input('codigoPromocional') !== 'cyber4c4d3my')
            return json_encode(['error' => 'Código promocional inválido']);

        $membership = Membership::find(Auth::user()->membership_id);
        if (is_null($membership))
            DB::transaction(function () use ($request, $prices) {
                $membership = new Membership();
                $membership->cve_alumno = Auth::user()->alumno->cve_alumno;
                $tipo_membresia = TipoMembresia::where('tipo_membresia', $request->membership)->first();
                $membership->cve_tipo_membresia = $tipo_membresia->cve_tipo_membresia;
                $membership->fecha = date('Y-m-d');
                $membership->save();

                $request->payment_method = strtolower($request->payment_method);
                if($request->payment_method == 'cash')
                    $request->payment_method = 'efectivo';
                $forma = FormaPago::whereRaw("lower(forma_pago) LIKE ?", [$request->payment_method])->first();

                $pago = new Pago();
                $pago->cve_membresia = $membership->cve_membresia;
                $pago->cve_forma_pago = $forma->cve_forma_pago;
                $pago->total_pago = $prices[$request->membership];
                $pago->save();

                if($request->input('paymentType') == 'months') {
                    #get a count of mensualidades
                    $num_mensualidad = Mensualidad::count() + 1;
                    $mensualidad = new Mensualidad();
                    $mensualidad->cve_mensualidad = $num_mensualidad;
                    $mensualidad->cve_pago = $pago->cve_pago;
                    $mensualidad->mensualidades = $request->input('installments');
                    $mensualidad->save();
                }
            });
        else
            DB::transaction(function () use ($membership, $request) {
                $tipoMembresia = TipoMembresia::where('tipo_membresia', $request->membership)->first();
                $membership->cve_tipo_membresia = $tipoMembresia->cve_tipo_membresia;
                $membership->save();
            });

        return json_encode(['success' => "¡Felicidades! Ahora eres miembro $request->membership"]);
    }

}
