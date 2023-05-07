<?php

if (!function_exists('get_course_image_path')) {
    function get_course_image_path($id)
    {
        $jpgPath = "curso/curso{$id}.jpg";
        $pngPath = "curso/curso{$id}.png";

        if (file_exists(public_path($jpgPath))) {
            return asset($jpgPath);
        } elseif (file_exists(public_path($pngPath))) {
            return asset($pngPath);
        } else {
            // Return a default image if neither file exists
            return asset('images/default_course_image.png');
        }
    }
}
