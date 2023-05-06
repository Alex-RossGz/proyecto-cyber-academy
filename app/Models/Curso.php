<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Curso extends Model
{   
    use HasFactory, Searchable;

    protected $table = 'curso';
    protected $primaryKey = 'cve_curso';

    public function toSearchableArray()
    {
        $array = [
            'nombre' => $this->nombre,
        ];

        return $array;
    }
}
