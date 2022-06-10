<?php

namespace App\Http\Controllers\staff;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class EmpExitController extends Controller
{
    
    public function index()
    {
         $result = DB::table('xin_employee_exit')->
         join('xin_employee_exit_type','xin_employee_exit_type.exit_type_id','xin_employee_exit.exit_type_id')->
         join('xin_companies','xin_companies.company_id','xin_employee_exit.company_id')->
         join('xin_employees','xin_employees.employee_id','xin_employee_exit.employee_id')->
         get();

         $employee = DB::table('xin_employees')->get();
         return view('staff.employees-exit')->with(['result'=>$result, 'employee'=>$employee]);
    }

    
    public function store(Request $request)
    {
        

        DB::table('xin_employee_exit')->insert([
            'company_id'=>$request->input('company'),
            'employee_id'=>$request->input('employee'),
            'reason'=>$request->input('description'),
            'exit_date'=>$request->input('exit-date'),
            'exit_type_id'=>$request->input('type-of-exit'),
            'exit_interview'=>$request->input('exit-interview'),
            'is_inactivate_account'=>$request->input('disable-account'),
        ]);
        return back();
        // print "<pre>";
        // print_r($request->input());
    }
  
    public function edit_employee_form($id)
    {

        $getRow = DB::table('xin_employee_exit')->
         join('xin_employee_exit_type','xin_employee_exit_type.exit_type_id','xin_employee_exit.exit_type_id')->
         join('xin_companies','xin_companies.company_id','xin_employee_exit.company_id')->
         join('xin_employees','xin_employees.employee_id','xin_employee_exit.employee_id')->where('exit_id','=',$id)->get();
        return view('edits.emp-exit-edit')->with(['result' => $getRow]);
      
    }

    
    public function update(Request $request)
    {
        // [first-name] => Goh
        // [last-name] => Liang Fen, Jessica
        // [company] => SG Motor Link Pte Ltd
        // [exit-type] => Goh
        // [exit-date] => Goh
        // [exit-interview] => Goh

        DB::table('xin_employee_exit')->insert([
            'company_id'=>$request->input('company'),
            'employee_id'=>$request->input('emp-id'),
            'reason'=>$request->input('description'),
            'exit_date'=>$request->input('exit-date'),
            'exit_type_id'=>$request->input('type-of-exit'),
            'exit_interview'=>$request->input('exit-interview'),
            'is_inactivate_account'=>$request->input('disable-account'),
        ]);

         print "<pre>";
         print_r($request->input());
    }

    
    public function delete($id)
    {
          echo $id; 
          DB::table('xin_employee_exit')->where('exit_id','=',$id)->delete();
          return back();
    }
}
