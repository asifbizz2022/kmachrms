<?php

namespace App\Http\Controllers\staff;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class StaffController extends Controller
{
   public function staff_dashboard()
    {
        $counts = DB::table('xin_employees')->count();
        $tickets = DB::table('tickets')->count();
        
        $awards = DB::table('xin_awards')->count();
        $leaveRequest = DB::table('xin_leave_applications')->count();
         $training = DB::table('xin_training')->count();
        $assets = DB::table('xin_assets')->count();
        $travelRequest = DB::table('xin_employee_travels')->count();
        return view('staff.staff-dashboard')
                ->with('counts', $counts)
                ->with('tickets', $tickets)
                ->with('assets', $assets)
                ->with('awards',$awards)
                ->with('training',$training)
                ->with('travelRequest', $travelRequest)
                ->with('leaveRequests', $leaveRequest);
        
        
    } 
    
    public function staff_directory()
    {
        $results = DB::table('xin_employees') 
               ->join('xin_user_roles','xin_user_roles.role_access','=','xin_employees.user_role_id')
                ->join('xin_departments','xin_departments.department_id', '=', 'xin_employees.department_id') 
                ->join('xin_designations','xin_designations.designation_id', '=', 'xin_employees.designation_id')  
                ->get();
       
       return view('staff.staff-directory')->with('results',$results);
         
    }
    
}
