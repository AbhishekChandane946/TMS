<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Task;
use Illuminate\Http\Request;

class TaskCommentController extends Controller
{
    //



    public function show(Task $task)
{
    return response()->json([
        'task' => $task,
        'comments' => $task->comments()->with('user')->get(),
    ]);
}


public function store(Request $request, Task $task)
{
    
}



}
