<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Role;
use App\Models\Permission;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        // Define roles with name, slug, and description
        $roles = [
            ['name' => 'Admin', 'slug' => 'admin', 'description' => 'Administrator'],
            ['name' => 'Manager', 'slug' => 'manager', 'description' => 'Task Manager'],
            ['name' => 'Team Member', 'slug' => 'team_member', 'description' => 'Regular User'],
            ['name' => 'IT', 'slug' => 'it', 'description' => 'Role for IT/Developers'],
            ['name' => 'Sales', 'slug' => 'sales', 'description' => 'Role for Sales team'],
            ['name' => 'Legal', 'slug' => 'legal', 'description' => 'Role for Legal team'],
            ['name' => 'Finance', 'slug' => 'finance', 'description' => 'Role for Finance team'],
            ['name' => 'Support', 'slug' => 'support', 'description' => 'Role for Support team'],
            ['name' => 'RM', 'slug' => 'rm', 'description' => 'Role for Relationship Managers'],
            ['name' => 'Accounts & Recon', 'slug' => 'accounts_recon', 'description' => 'Role for Accounts and Reconciliation'],
            ['name' => 'Management', 'slug' => 'management', 'description' => 'Role for Management'],
            ['name' => 'API Partner', 'slug' => 'api_partner', 'description' => 'Role for API Partners'],
            ['name' => 'Enterprise Partner', 'slug' => 'enterprise_partner', 'description' => 'Role for Enterprise Partners'],
            ['name' => 'Whitelabel', 'slug' => 'whitelabel', 'description' => 'Role for Whitelabel Partners'],
            ['name' => 'Master Distributor', 'slug' => 'master_distributor', 'description' => 'Role for Master Distributors'],
            ['name' => 'Distributor', 'slug' => 'distributor', 'description' => 'Role for Distributors'],
            ['name' => 'Retailer', 'slug' => 'retailer', 'description' => 'Role for Retailers'],
            ['name' => 'Whitelabel Admin', 'slug' => 'whitelabel_admin', 'description' => 'Role for Whitelabel Admins'],
            ['name' => 'WI Admin EMP', 'slug' => 'wi_admin_emp', 'description' => 'Role for WI Admin Employees'],
            ['name' => 'ENT Employee', 'slug' => 'ent_employee', 'description' => 'Role for Enterprise Employees'],
            ['name' => 'WI Employee', 'slug' => 'wi_employee', 'description' => 'Role for WI Employees'],
        ];

        // Create roles and store them in an associative array
        $roleModels = [];
        foreach ($roles as $roleData) {
            $roleModels[$roleData['slug']] = Role::firstOrCreate(
                ['name' => $roleData['name']], // Check if role with this name exists
                [
                    'slug' => $roleData['slug'], // Ensure the slug is included
                    'description' => $roleData['description']
                ]
            );
        }

        // Define permissions
        $permissions = [
            'create_task',
            'edit_task',
            'delete_task',
            'view_task',
        ];

        // Create and assign permissions
        foreach ($permissions as $permission) {
            // Create permission
            $perm = Permission::firstOrCreate(
                ['name' => $permission], // Check if permission exists
                ['description' => ucfirst(str_replace('_', ' ', $permission))]
            );

            // Assign all permissions to Admin
            $roleModels['admin']->permissions()->attach($perm);

            // Assign limited permissions to Manager
            if (in_array($permission, ['create_task', 'edit_task', 'view_task'])) {
                $roleModels['manager']->permissions()->attach($perm);
            }

            // Assign 'view_task' permission to all other roles
            if ($permission === 'view_task') {
                foreach ($roleModels as $slug => $role) {
                    if (!in_array($slug, ['admin', 'manager'])) {
                        $role->permissions()->attach($perm);
                    }
                }
            }
        }
    }
}
