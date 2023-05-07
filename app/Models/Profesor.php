<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profesor extends Model
{
    use HasFactory;

    // Define the table name (optional, if it follows the naming convention)
    protected $table = 'profesor';

    // Define the primary key (if it's not 'id')
    protected $primaryKey = 'cve_profesor';

    // Define the fillable attributes
    protected $fillable = [
        'cve_usuario',
    ];

    // Define the relationship with the Usuario model (assuming one Profesor belongs to one Usuario)
    public function usuario()
    {
        # Usuario::class is 'id', Profesor::class is 'cve_usuario'
        return $this->belongsTo(Usuario::class, 'id', 'cve_usuario');
    }
}
