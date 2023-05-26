<?php

use App\Http\Controllers\CursoController;

use App\Http\Controllers\MembershipController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\ProfileController;
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

Route::post('/perfil', [ProfileController::class, 'update'])->name('profile');

Route::patch('/update/address', [ProfileController::class, 'updateAddress'])->name('update.address');
Route::patch('/update/interes', [ProfileController::class, 'updateIntereses'])->name('update.interes');
Route::get('/get/interes', [ProfileController::class, 'getIntereses'])->name('get.interes');
Route::patch('/update/experiencia', [ProfileController::class, 'updateExperiencia'])->name('update.experiencia');
Route::get('/get/experiencia', [ProfileController::class, 'getExperiencia'])->name('get.experiencia');
Route::patch('/update/telefono', [ProfileController::class, 'updateTelefono'])->name('update.telefono');
Route::get('/get/telefono', [ProfileController::class, 'getTelefono'])->name('get.telefono');
Route::patch('/update/correo', [ProfileController::class, 'updateCorreo'])->name('update.correo');
Route::get('/get/correo', [ProfileController::class, 'getCorreo'])->name('get.correo');

Route::get('/membresía', [PageController::class, 'membership'])->name('membership');

Route::get('/pago/{membership}', [PageController::class, 'payment'])->name('payment');

Route::get('/pago/{membership}/{payment_method}', [PageController::class, 'proceed_payment'])->name('proceed');

Route::put('/pago/{membership}/{payment_method}', [MembershipController::class, 'update_membership'])->name('update_membership');

Route::get('orm/{model}', 'App\Http\Controllers\ORMController@show');

