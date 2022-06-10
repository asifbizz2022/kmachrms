<?php

namespace App\Http\Controllers\HrReports;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class hrImportsController extends Controller
{
    public function index()
    {
        return view('HrReports.hr-imports');
    }
}
