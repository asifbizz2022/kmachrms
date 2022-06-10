<?php

namespace App\Http\Controllers\HrReports;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class dashboardController extends Controller
{
   public function index(){
       return view('HrReports.hr-dashboard');
   }
}
