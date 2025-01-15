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

        $activities = TaskActivity::where('task_id', $taskId)
        // ->with('user:id,name') 
        ->orderBy('created_at', 'desc') // Order by newest first
        ->get();
        
        //  $activities = TaskActivity::where('task_id', $taskId)->get();
        $formattedActivities = $activities->map(function ($activity) {
            return [
                'id' => $activity->id,
                'type' => $activity->activity_type,
                'description' => $activity->activity_description,
                'created_at' => $activity->created_at->format('Y-m-d H:i:s'),
                'user_name' => $activity->user ? $activity->user->name : ' ',
            ];
        });

        return response()->json([
            'status' => 'success',
            'data' =>  $formattedActivities
        ]);


    }
}
