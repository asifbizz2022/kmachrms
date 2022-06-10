<?php

namespace App\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class clientUsersController extends Controller
{
    
    public function index()
    {
        return view('customers.client-users');
    }
 
    public function create()
    {
        //
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
