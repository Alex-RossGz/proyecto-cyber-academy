<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\Membresia;


class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'cve_persona',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function persona()
    {
        return $this->belongsTo(Persona::class, 'cve_persona', 'cve_persona');
    }

    public function profesor()
    {
        return $this->hasOne(Profesor::class, 'cve_usuario', 'id');
    }

    public function alumno()
    {
        return $this->hasOne(Alumno::class, 'cve_usuario', 'id');
    }

    protected $appends = ['membership', 'membership_id'];

    public function getMembershipAttribute()
    {
        $membresia = Membership::where('cve_alumno', $this->alumno->cve_alumno)->first();
        if (!$membresia) {
            return null;
        }
        $tipoMembresia = TipoMembresia::where('cve_tipo_membresia', $membresia->cve_tipo_membresia)->first();

        return $tipoMembresia->tipo_membresia;
    }

    public function getMembershipIdAttribute()
    {
        $membresia = Membership::where('cve_alumno', $this->alumno->cve_alumno)->first();
        if (!$membresia) {
            return null;
        }
        return $membresia->cve_membresia;
    }
}
