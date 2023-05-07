<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlumnoCurso extends Model
{
    use HasFactory;

    # primary key (cve_curso, cve_alumno)
    protected $primaryKey = null;
    public $incrementing = false;

    protected $table = 'alumcurso';
    public $timestamps = false;

    protected $fillable = [
        'cve_curso',
        'cve_alumno',
        'fecha_inscripcion',
        'calificacion',
    ];
}
