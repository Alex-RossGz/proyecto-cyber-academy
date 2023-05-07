<?php

use App\Http\Controllers\CursoController;

use App\Http\Controllers\PageController;
use App\Models\CourseMongo;
use App\Models\Curso;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [PageController::class, 'index'])->name('home');

Route::get('/login', [App\Http\Controllers\HomeController::class, 'index'])->name('login');

Route::get('/buscar', [CursoController::class, 'course'])->name('course');

Route::get('/curso/{curso}', [CourseMongo::class, 'show'])->name('ver-curso');


Route::get('api/countries', [App\Http\Controllers\HomeController::class, 'getCountries']);
Route::get('api/cities/{id}', [App\Http\Controllers\HomeController::class, 'getCities']);

Auth::routes();

Route::post('/ver_curso/', [CursoController::class, 'ver'])->name('course.ver');

Route::get('/ver_curso/', function () {
    return redirect()->route('home');
});

Route::post('/suscribirse/', [CursoController::class, 'subscribe'])->name('subscribe');

Route::get('/subscritos', [CursoController::class, 'subscribed'])->name('subscribed');

Route::get('/proponer', [CursoController::class, 'proponer'])->name('proponer');

Route::post('/proponer', [CursoController::class, 'post_course'])->name('proponer');

Route::get('/perfil', [PageController::class, 'profile'])->name('profile');

Route::post('/perfil', [PageController::class, 'update_profile'])->name('profile');

Route::get('/membresía', [PageController::class, 'membership'])->name('membership');
