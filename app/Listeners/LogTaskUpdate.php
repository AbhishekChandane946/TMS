<?php

namespace App\Listeners;

use App\Events\TaskUpdated;
use App\Models\TaskActivity; // Import TaskActivity model
use Illuminate\Support\Facades\Auth; 

class LogTaskUpdate
{
    /**
     * Handle the event.
     *
     * @param  \App\Events\TaskUpdated  $event
     * @return void
     */
    public function handle(TaskUpdated $event)
    {
        // Log the activity when a task is updated
        TaskActivity::create([
            'task_id' => $event->taskId,  // Use taskId from the event
            'user_id' => Auth::id(),
            'activity_type' => $event->activityType,  // Use activityType from the event
            'activity_description' => $event->activityDescription,  // Use activityDescription from the event
        ]);
    }
}
