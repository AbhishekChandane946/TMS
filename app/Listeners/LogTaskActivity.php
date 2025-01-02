<?php

namespace TMS\Listeners;  // Corrected namespace

use App\Models\TaskActivity as ModelsTaskActivity;
use TMS\Events\TaskUpdated;  // Corrected namespace for TaskUpdated event
use TMS\Models\TaskActivity; // Corrected namespace for TaskActivity model
use Illuminate\Support\Facades\Auth;

class LogTaskUpdate
{
    /**
     * Handle the event.
     *
     * @param  \TMS\Events\TaskUpdated  $event  // Corrected namespace
     * @return void
     */
    public function handle(TaskUpdated $event)
    {
        // Log the activity when a task is updated
        ModelsTaskActivity::create([
            'task_id' => $event->taskId,  // Use taskId from the event
            'user_id' => Auth::id(),
            'activity_type' => $event->activityType,  // Use activityType from the event
            'activity_description' => $event->activityDescription,  // Use activityDescription from the event
        ]);
    }
}
