<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Models\TaskActivity;
use App\Models\Task;
use Illuminate\Support\Facades\Auth;

class TaskActivityController extends Controller
{
    /**
     * Log a new activity for a task.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function logActivity(Request $request)
    {
        $request->validate([
            'task_id' => 'required|exists:tasks,id',
            'activity_type' => 'required|string|max:50',
            'activity_description' => 'required|string',
        ]);

        $activity = TaskActivity::create([
            'task_id' => $request->task_id,
            'user_id' => Auth::id(),
            'activity_type' => $request->activity_type,
            'activity_description' => $request->activity_description,
        ]);

        return response()->json([
            'message' => 'Activity logged successfully.',
            'activity' => $activity,
        ]);
    }

    /**
     * Retrieve all activities for a specific task.
     *
     * @param int $taskId
     * @return \Illuminate\Http\JsonResponse
     */
    public function getTaskActivities($taskId)
    {
        $task = Task::findOrFail($taskId);

        $activities = TaskActivity::where('task_id', $taskId)
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json([
            'task' => $task,
            'activities' => $activities,
        ]);
    }

    
}
