<?php

namespace App\Http\Controllers\organization;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class organisationChartController extends Controller
{
    public function index(){
        return view('organization.org_chart');
    }
}
