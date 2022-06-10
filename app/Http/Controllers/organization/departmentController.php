<?php

namespace App\Http\Controllers\organization;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class departmentController extends Controller
{
    public function index()
   {
       return view('organization.department');
   }
}
