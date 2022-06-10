<?php

namespace App\Http\Controllers\Timesheet;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class leaveStatusController extends Controller
{
     public function index()
    {
        return view('Timesheet.leave-status');
    }
}
