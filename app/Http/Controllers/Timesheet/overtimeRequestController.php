<?php

namespace App\Http\Controllers\Timesheet;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class overtimeRequestController extends Controller
{
     public function index()
    {
         return view('Timesheet.overtime-request');
    }
}
