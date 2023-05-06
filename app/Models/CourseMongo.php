<?php

namespace App\Models;

use Jenssegers\Mongodb\Eloquent\Model;

class CourseMongo extends Model
{

    protected $connection = 'mongodb';
    protected $collection = 'media';

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

}
