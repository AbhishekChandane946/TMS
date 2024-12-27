<?php  
// app/Http/Middleware/RoleMiddleware.php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\User;

class RoleMiddleware
{
    public function handle(Request $request, Closure $next, $role)
    {
        $user = User::find(session('user_id'));

        if ($user && $user->hasRole($role)) {
            return $next($request);
        }

        return redirect()->route('home')->with('error', 'Access Denied');
    }
}
