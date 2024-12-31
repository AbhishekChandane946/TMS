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
            'task_id' => $event->task->id,
            'user_id' => Auth::id(),
            'activity_type' => 'update',
            'activity_description' => 'Task updated',
        ]);
    }
}
