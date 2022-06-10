<?php

namespace App\Http\Controllers\Efilling;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class EfillingController extends Controller
{
     
    public function index()
    {
        return view('efilling.details');
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
