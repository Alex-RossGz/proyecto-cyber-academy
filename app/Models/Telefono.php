<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Telefono extends Model
{
    use HasFactory;

    protected $table = 'telefono';

    protected $primaryKey = 'cve_telefono';

    # fillable fields
    protected $fillable = [
        'cve_persona',
        'telefono',
        'lada',
    ];

    public function persona()
    {
        return $this->belongsTo(Persona::class, 'cve_persona');
    }
}
