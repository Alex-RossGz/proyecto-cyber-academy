<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Correo extends Model
{
    use HasFactory;

    protected $table = 'correo';

    protected $primaryKey = 'cve_correo';

    public $timestamps = false;

    # fillable fields
    protected $fillable = [
        'cve_persona',
        'correo',
        'dominio',
    ];

    public function persona()
    {
        return $this->belongsTo(Persona::class, 'cve_persona');
    }
}
