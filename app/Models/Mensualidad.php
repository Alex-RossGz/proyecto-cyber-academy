<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mensualidad extends Model
{
    use HasFactory;

    protected $table = 'mensualidad';

    protected $primaryKey = 'cve_mensualidad';

    public $timestamps = false;

    # fillable fields
    protected $fillable = [
        'cve_pago',
        'mensualidades',
    ];

    public function pago()
    {
        return $this->belongsTo(Pago::class, 'cve_pago');
    }
}
