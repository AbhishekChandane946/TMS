<?php

// In App\Models\User.php
namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{ 
    use HasFactory, Notifiable;

 
    protected $fillable = [
        'name',
        'email',
        'password',
        'user_type',
    ];

 
    protected $hidden = [
        'password',
        'remember_token',
    ];

 
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

 
    // Define the relationship with the Role model
    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_user', 'user_id', 'role_id');
    }

    // Check if the user has a specific role
    public function hasRole($roleSlug)
    {
        return $this->roles()->where('slug', $roleSlug)->exists();
    }

    // Check if the user has a specific permission
    public function hasPermission($permissionSlug)
    {
        return $this->roles()->whereHas('permissions', function ($query) use ($permissionSlug) {
            $query->where('slug', $permissionSlug);
        })->exists();
    }
} 