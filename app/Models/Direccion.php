<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Direccion extends Model
{
    use HasFactory;

    protected $table = 'direccion';
    protected $primaryKey = 'cve_direccion';

    public function persona()
    {
        return $this->hasOne(Persona::class, 'cve_direccion');
    }

    public function ciudad()
    {
        return $this->belongsTo(Ciudad::class, 'cve_ciudad');
    }
}
