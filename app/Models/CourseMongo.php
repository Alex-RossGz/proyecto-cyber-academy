<?php

namespace App\Models;

use Jenssegers\Mongodb\Eloquent\Model;

class CourseMongo extends Model
{

    protected $connection = 'mongodb';
    protected $collection = 'media';
    protected $fillable = [
        'id',
        'cve_curso',
        'title',
        'description',
        'temario',
        'author',
        'version',
        'subscribers',
        'available',
        'premium'
    ];

    # index
    public function show($id)
    {
        $id = str_replace('_', ' ', $id);
        $course = CourseMongo::where('title', $id)->first();
        $user = auth()->user()->id ?? 0;

        $subscribed = in_array($user, $course->subscribers ?? []);

        $data = compact('course', 'subscribed');
        return view('content.curso', $data);
    }

    // Add this method to your Course model
    protected $appends = ['author_full_name'];

    public function getAuthorFullNameAttribute()
    {
        $user = User::where('id', $this->author)->first();
        $persona = Persona::where('cve_persona', $user->cve_persona)->first();

        return "{$persona->nombre} {$persona->apellido_paterno} {$persona->apellido_materno}";
    }

    public function cursoOracle()
    {
        return $this->belongsTo(Curso::class, 'cve_curso', 'cve_curso');
    }

}
