<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Schema;


class ORMController extends Controller
{
    public function show($model)
    {
        $modelClass = 'App\\Models\\' . ucfirst($model);

        if (class_exists($modelClass) && $model == 'user') {
            $records = $modelClass::with(['persona', 'profesor', 'alumno'])->get();
            $columns = array_merge(Schema::getColumnListing($model), ['membership', 'membership_id', 'persona']);

            return view('orm.show', ['records' => $records, 'columns' => $columns]);
        } else if (class_exists($modelClass)) {
            // Convertir el nombre del modelo a CamelCase para que Laravel pueda encontrar el modelo correspondiente
            $modelClass = 'App\\Models\\' . ucfirst($model);

            // Si la clase del modelo existe, obtén todos los registros
            if (class_exists($modelClass)) {
                $records = $modelClass::all();
                $columns = Schema::getColumnListing($model);

                return view('orm.show', ['records' => $records, 'columns' => $columns]);
            } else {
                abort(404, 'Modelo no encontrado');
            }
        } else {
            abort(404, 'Modelo no encontrado');
        }
    }
}
