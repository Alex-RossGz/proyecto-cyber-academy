<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grado_Escolar extends Model
{
    use HasFactory;

    protected $table = 'grado_escolar';

    protected $primaryKey = 'cve_grado_escolar';

    public function alumnos()
    {
        return $this->hasMany(Alumno::class, 'cve_grado_escolar');
    }
}
