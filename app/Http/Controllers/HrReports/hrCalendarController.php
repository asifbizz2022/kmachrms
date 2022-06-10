<?php

namespace App\Http\Controllers\HrReports;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class hrCalendarController extends Controller
{
    public function index()
    {
       return view('HrReports.hr-calendar');
    }
}
