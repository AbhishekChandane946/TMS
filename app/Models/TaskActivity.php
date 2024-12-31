<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaskActivity extends Model
{
    use HasFactory;

    protected $fillable = [
        'task_id',
        'user_id',
        'activity_type',
        'activity_description',
    ];

    /**
     * Get the task associated with the activity.
     */
    public function task()
    {
        return $this->belongsTo(Task::class);
    }

    /**
     * Get the user who performed the activity.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
