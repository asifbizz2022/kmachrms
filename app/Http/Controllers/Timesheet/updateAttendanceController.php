<?php

namespace App\Http\Controllers\Timesheet;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class updateAttendanceController extends Controller
{
     public function index()
    {
         return view('Timesheet.update-attendance');
    }
}
