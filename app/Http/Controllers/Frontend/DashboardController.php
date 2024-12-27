<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;   

class DashboardController extends Controller
{
    
    public function index()
    {
        $user = Auth::user();  
        view()->share('user', $user);   
        return view('frontend.index'); 
 
    }
}
