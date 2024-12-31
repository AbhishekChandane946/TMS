<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Event;
use App\Events\TaskUpdated; // Import the TaskUpdated event
use App\Listeners\LogTaskUpdate; // Import the LogTaskUpdate listener

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        TaskUpdated::class => [
            LogTaskUpdate::class,
        ],
    ];

    /**
     * Register services.
     */
    public function register(): void
    {
        // You can register bindings or services here if needed.
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        // The event listener mappings are automatically loaded by Laravel.
    }
}
