<?php

namespace App\Models;

use Jenssegers\Mongodb\Eloquent\Model;

class CourseMongo extends Model
{

    protected $connection = 'mongodb';
    protected $collection = 'media';
    protected $primaryKey = 'id';
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
        'premium',
        'recommended_courses', // Add this line
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
    public function getRecommendedCoursesAttribute()
    {
        $recommended_courses = [];
        if (!$this->recommended_courses) {
            return $recommended_courses;
        }

        // Loop through the recommended course IDs and get the details of each course
        foreach ($this->recommended_courses as $course_id) {
            $course = CourseMongo::find($course_id);
            if ($course) {
                $recommended_courses[] = $course;
            }
        }

        return $recommended_courses;
    }

}
