<?php

// In App\Models\Permission.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    // Define the relationship with the Role model
    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_permission', 'permission_id', 'role_id');
    }
}
