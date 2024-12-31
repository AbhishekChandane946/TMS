<?php

namespace App\Listeners;

use App\Events\TaskUpdated;
use App\Models\TaskActivity;
use Illuminate\Support\Facades\Auth;

class LogTaskActivity
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(TaskUpdated $event)
    {
        TaskActivity::create([
            'task_id' => $event->taskId,
            'user_id' => Auth::id(),
            'activity_type' => $event->activityType,
            'activity_description' => $event->activityDescription,
        ]);
    }
}
