<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Materia extends Model
{
    use HasFactory;

    protected $table = 'materia';
    protected $primaryKey = 'cve_materia';
    public $timestamps = false;

    protected $fillable = [
        'nombre',
        'cant_bloques',
        'dificultad',
        'cve_curso',
    ];

    public function curso()
    {
        return $this->belongsTo(Curso::class, 'cve_curso');
    }
}
