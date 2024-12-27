<?php



// app/Http/Middleware/PermissionMiddleware.php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\User;

class PermissionMiddleware
{
    public function handle(Request $request, Closure $next, $permission)
    {
        $user = User::find(session('user_id'));

        if ($user && $user->hasPermission($permission)) {
            return $next($request);
        }

        return redirect()->route('home')->with('error', 'Access Denied');
    }
}
