<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Task extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $dates = ['deleted_at'];  

    
    protected $fillable = [
        'title',
        'task_description',
        'assign_to',
        'task_created_by',
        'start_date',
        'end_date',
        'flag',
        'priority',
        'user_id'
    ];


    public function user()
    {
        return $this->belongsTo(User::class, 'assign_to');  // Assuming 'assign_to' is the foreign key
    }

    public function comments()
    {
        return $this->hasMany(TaskComment::class);
    }


}
