<?php

namespace App\Http\Controllers\Timesheet;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class manageHolidaysController extends Controller
{
    public function index()
    {
         return view('Timesheet.manage-holidays');
    }
}
