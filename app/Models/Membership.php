<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Membership extends Model
{
    use HasFactory;

    protected $table = 'membresia';
    protected $primaryKey = 'cve_membresia';
    public $timestamps = false;

    protected $fillable = [
        'fecha',
        'cve_alumno',
        'cve_tipo_membresia',
    ];

    public function tipoMembresia()
    {
        return $this->belongsTo(TipoMembresia::class, 'cve_tipo_membresia', 'cve_tipo_membresia');
    }

    public function alumno()
    {
        return $this->belongsTo(Alumno::class, 'cve_alumno', 'cve_alumno');
    }
}
