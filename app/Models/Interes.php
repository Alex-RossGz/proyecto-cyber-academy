<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Interes extends Model
{
    use HasFactory;

    protected $table = 'interes';
    protected $primaryKey = 'cve_interes';
    public $timestamps = false;

    protected $fillable = [
        'interes',
        'cve_alumno'
    ];

    public function alumno()
    {
        return $this->belongsTo(Alumno::class, 'cve_alumno', 'cve_alumno');
    }
}
