<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Experiencia extends Model
{
    use HasFactory;

    protected $table = 'experiencia';
    protected $primaryKey = 'cve_experiencia';
    public $timestamps = false;

    protected $fillable = [
        'fecha_inicio',
        'fecha_fin',
        'especialidad',
        'descripcion',
        'cve_profesor'
    ];

    public function profesor()
    {
        return $this->belongsTo(Profesor::class, 'cve_profesor', 'cve_profesor');
    }
}
