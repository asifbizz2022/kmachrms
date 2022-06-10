<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Session;
use Hash;

class AdminAuthController extends Controller
{
    
    public function login_page()
    {
         return view('auth.login');
    }
 
    public function register_page()
    {
        return view('auth.register');
    }
 
    public function store(Request $request)
    {
        //
    }

   
    public function show($id)
    {
        //
    }

   
    public function edit($id)
    {
        //
    }

  
    public function update(Request $request, $id)
    {
        //
    }

    
    public function destroy($id)
    {
        //
    }
}
