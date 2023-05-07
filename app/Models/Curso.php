<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Curso extends Model
{
    use HasFactory, Searchable;

    protected $table = 'curso';
    protected $primaryKey = 'cve_curso';

    protected $fillable = [
        'cve_curso',
        'nombre',
        'cant_materia',
        'duracion',
        'cve_profesor',
    ];

    // Add the relationship with the Profesor model
    public function profesor()
    {
        return $this->belongsTo(Profesor::class, 'cve_profesor');
    }

    public function cursoMongo()
    {
        return $this->hasOne(CourseMongo::class, 'cve_curso');
    }
}
