<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    /**
     * Handle the login request.
     */
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
    
        $credentials = $request->only('email', 'password');

    
        if (Auth::attempt($credentials )) {
            $request->session()->regenerate(); 
            return redirect()->route('frontend.index')->with('success', 'Welcome back!');
        }
    
        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ])->onlyInput('email');
    }
    
    
    /**
     * Handle the logout request.
     */
    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken(); 
        //old session madhil token reuse zala nahi pahije tyasathi hi line token regenrate karte 

        return redirect('/signin')->with('success', 'You have been logged out.');
    }


}
