<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Task>
 */
class TaskFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => fake()->sentence(3),
            'task_description' => fake()->paragraph(),
            'assign_to' => fake()->numberBetween(1, 50),
            'start_date' => fake()->dateTimeBetween('-1 month', 'now'),
            'end_date' => fake()->dateTimeBetween('now', '+1 month'),
            'flag' => fake()->randomElement([0, 1, 2]),
            'priority' => fake()->randomElement(['Low', 'Medium', 'High']),
            'user_id' => fake()->numberBetween(1, 50), // Add this to assign a valid user_id
        ];
    }
}
