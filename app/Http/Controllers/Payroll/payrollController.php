<?php

namespace App\Http\Controllers\Payroll;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class payrollController extends Controller
{
    public function index() 
    {
        return view('payroll.payroll');
         
    }
}
