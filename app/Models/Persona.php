<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    use HasFactory;

    protected $table = 'persona';
    protected $primaryKey = 'cve_persona';
    protected $fillable = [
        'nombre',
        'apellido_paterno',
        'apellido_materno',
        'genero',
        'fecha_nacimiento',
        'cve_direccion',
    ];

    public function user()
    {
        return $this->hasOne(User::class, 'cve_persona');
    }

    public function direccion()
    {
        return $this->belongsTo(Direccion::class, 'cve_direccion');
    }
    public function telefono()
    {
        return $this->hasMany(Telefono::class, 'cve_persona');
    }

    public function correo()
    {
        return $this->hasMany(Correo::class, 'cve_persona');
    }
}
