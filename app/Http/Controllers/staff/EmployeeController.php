<?php

namespace App\Http\Controllers\staff;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class EmployeeController extends Controller
{ 
    public function index(){
        $result = DB::table('xin_employees')->get();
        $counts = DB::table('xin_employees')->count();
        $male = DB::table('xin_employees')->where('gender','=','Male')->count();
        $female = DB::table('xin_employees')->where('gender','=','Female')->count();
       
        $data = DB::table('xin_employees') 
               ->join('xin_user_roles','xin_user_roles.role_access','=','xin_employees.user_role_id')
                ->join('xin_departments','xin_departments.department_id', '=', 'xin_employees.department_id') 
                ->join('xin_designations','xin_designations.designation_id', '=', 'xin_employees.designation_id')  
                ->get();
       
        return view('staff.employees')
               ->with('result', $data)
               ->with('counts', $counts)
               ->with('male', $male)
               ->with('female',$female);
    }
    public function edit($id){
        echo $id;
    }
    public function delete($id){
        echo $id;
    }
     
    public function employee_exit()
    {
         $result = DB::table('xin_employees')
                 ->join('xin_companies','xin_companies.company_id','=','xin_employees.company_id')
                 ->join('xin_employee_exit_type','xin_employee_exit_type.company_id','=','xin_employees.company_id')
                 ->join('xin_employee_exit','xin_employee_exit.company_id','=','xin_employees.company_id')
                 ->get();
        return view('staff.employees-exit')->with('result',$result);
        
    }
    public function employee(){
        
      
    }
    public function employee_last_login()
    {
        //$result = DB::table('table')->get();
         return view('staff.employees-last-login');
    }
    
    public function profile()
    {
        return view('staff/profile');
    }
    public function add_employee(Request $request)
    { 
        print "<pre>";
        print_r($request->post());
        //return response()->json(['msg'=> 'Data Submitted' ]);
    }
    public function edit_employee_form($id){ 
        $result = DB::table('xin_employees')->where('user_id','=', $id)->get();
        return view('staff.employee-edit-form')->with('result', $result); 
        
    }
    public function update_employee($id){
        echo "update ".$id;
    }
    public function delete_employee($id){
        echo "delete ".$id;
    }
    public function expired_documents()
    { 
       return view('staff.expired-documents');
    }
    public function emp_exit_add(Request $request){
        echo "<pre>";
        print_r($request->post());
    }

    public function employee_benifits()
    {
        return view('staff.employee-benifits');
    }
}
