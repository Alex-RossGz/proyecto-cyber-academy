<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoMembresia extends Model
{
    protected $table = 'tipo_membresia';
    protected $primarykey = 'cve_tipo_membresia';
    public $timestamps = false;

    protected $fillable = [
        'tipo_membresia'
    ];

    public function membresias()
    {
        return $this->hasmany(membresia::class, 'cve_tipo_membresia');
    }
}
