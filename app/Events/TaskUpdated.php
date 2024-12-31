<?php

namespace App\Events;

use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class TaskUpdated
{
    use Dispatchable, SerializesModels;

    public $taskId;
    public $activityType;
    public $activityDescription;

    public function __construct($taskId, $activityType, $activityDescription)
    {
        $this->taskId = $taskId;
        $this->activityType = $activityType;
        $this->activityDescription = $activityDescription;
    }
}
