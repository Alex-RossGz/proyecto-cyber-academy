<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pago extends Model
{
    use HasFactory;

    protected $table = 'pago';
    protected $primaryKey = 'cve_pago';

    # fillable fields
    protected $fillable = [
        'cve_forma_pago',
        'cve_membresia',
        'total_pago',
    ];

    public function forma_pago()
    {
        return $this->belongsTo(FormaPago::class, 'cve_forma_pago');
    }

    public function membresia()
    {
        return $this->belongsTo(Membresia::class, 'cve_membresia');
    }
}
