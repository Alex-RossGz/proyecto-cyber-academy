<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ciudad extends Model
{
    use HasFactory;

    protected $table = 'ciudad';
    protected $primaryKey = 'cve_ciudad';

    public function direcciones()
    {
        return $this->hasMany(Direccion::class, 'cve_ciudad');
    }

    public function pais()
    {
        return $this->belongsTo(Pais::class, 'cve_pais');
    }
}
