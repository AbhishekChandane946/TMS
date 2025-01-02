<?php 
namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TaskActivity;
use App\Models\Task;

class TaskActivityController extends Controller
{
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
