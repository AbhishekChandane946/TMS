<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\Frontend\HomeController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Frontend\DashboardController;
use App\Http\Controllers\Frontend\ProfileController;
use App\Http\Controllers\Frontend\TaskCommentController;
use App\Http\Controllers\Frontend\TaskController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/profile',[ProfileController::class,'index']);



Route::get('/dashboard', [DashboardController::class,'index'])->name('frontend.index');
Route::get('/login', function () {
    return view('auth.login');  
})->name('login')->middleware('guest');

Route::post('/login', [AuthController::class, 'login'])->name('login');

Route::post('/logout', [AuthController::class, 'logout'])->name('logout')->middleware('auth');

Route::get('/signin', function(){
    return view('frontend.sign-in');
});


Route::get('/task',[TaskController::class,'index']); 
Route::post('/tasks', [TaskController::class, 'store'])->name('task.store');
Route::get('/tasks/get-users', [TaskController::class, 'getUsers'])->name('tasks.getUsers');

Route::post('/task-list', [TaskController::class, 'getTasksList'])->name('getTasksList');
Route::get('/display', [TaskController::class, 'display'])->name('display'); 


Route::get('/tasks/{id}', [TaskController::class, 'getTaskById']);
Route::post('/tasks/update', [TaskController::class, 'updateTask']);
Route::post('/tasks/{id}/delete', [TaskController::class, 'deleteTask'])->name('deleteTask');

Route::post('/tasks/{id}/restore', [TaskController::class, 'restoreTask']);







Route::get('/tasks/{task}', [TaskController::class, 'show'])->name('tasks.show');
Route::post('/tasks/comments', [TaskCommentController::class, 'store'])->name('tasks.comments');



// Route::get('/tasks/{task}/comments', [TaskController::class, 'getComments'])->name('tasks.getComments');
 
Route::get('/tasks/{task}/comments', [TaskCommentController::class, 'getComments'])->name('tasks.getComments');


 










 

