/*
Collect all the students in each course

{
// given:
    "course_id": 1,
    "data": {...},
    "students": [ 1, 2, 3, 4, ..., n ]

// result:
    "student": 1,
    "courses": [ 1, 2, 3, 4, ..., n ]

    "student": 2,
    "courses": [ 1, 2, 3, 4, ..., n ]

    ...
}
*/

db.media.aggregate([
    {
        $lookup: {
            from: "cursos",


