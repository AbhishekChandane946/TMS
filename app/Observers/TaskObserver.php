<?php
namespace App\Observers;

use App\Models\Task;
use App\Models\TaskActivity;
use Illuminate\Support\Facades\Auth;

class TaskObserver
{
    /**
     * Handle the Task "created" event.
     *
     * @param  \App\Models\Task  $task
     * @return void
     */
    public function created(Task $task)
    {
        $this->logActivity($task, 'created', 'Task created');
    }

    /**
     * Handle the Task "updated" event.
     *
     * @param  \App\Models\Task  $task
     * @return void
     */
    public function updated(Task $task)
    {
        $this->logActivity($task, 'updated', 'Task updated');
    }

    /**
     * Handle the Task "deleted" event.
     *
     * @param  \App\Models\Task  $task
     * @return void
     */
    public function deleted(Task $task)
    {
        $this->logActivity($task, 'deleted', 'Task deleted');
    }

    /**
     * Log the activity.
     *
     * @param  \App\Models\Task  $task
     * @param  string  $activityType
     * @param  string  $activityDescription
     * @return void
     */
    protected function logActivity(Task $task, $activityType, $activityDescription)
    {
        TaskActivity::create([
            'task_id' => $task->id,
            'user_id' => Auth::id(),
            'activity_type' => $activityType,
            'activity_description' => $activityDescription,
        ]);
    }
}
