<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormaPago extends Model
{
    use HasFactory;

    protected $table = 'forma_de_pago';

    protected $primaryKey = 'cve_forma_pago';

    public $timestamps = false;
}
