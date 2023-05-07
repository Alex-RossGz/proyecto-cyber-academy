<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Alumno extends Model
{
    use HasFactory;

    // Define the table name (optional, if it follows the naming convention)
    protected $table = 'alumno';

    // Define the primary key (if it's not 'id')
    protected $primaryKey = 'cve_alumno';

    // Define the fillable attributes
    protected $fillable = [
        'cve_usuario',
        'cve_grado_escolar',
    ];

    // Define the relationship with the Usuario model (assuming one Alumno belongs to one Usuario)
    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'id', 'cve_usuario');
    }

    // Define the relationship with the Grado_Escolar model (assuming one Alumno belongs to one Grado_Escolar)
    public function grado_escolar()
    {
        return $this->belongsTo(Grado_Escolar::class, 'cve_grado_escolar');
    }
}
