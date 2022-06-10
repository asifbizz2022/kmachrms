<?php

namespace App\Http\Controllers\organization;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class designationController extends Controller
{
    public function index()
    {
        return view('organization.designation');
    }
}
