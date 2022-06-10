<?php

namespace App\Http\Controllers\corehr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class resignationController extends Controller
{
   public function index() 
   {  
        $employee = DB::table('xin_employees')->get();
        $company = DB::table('xin_companies')->get();
        $designation = DB::table('xin_designations')->get();

        $table = DB::table('xin_employee_resignations')
        ->join('xin_employees','xin_employees.employee_id','xin_employee_resignations.employee_id')
        ->join('xin_companies','xin_companies.company_id','xin_employee_resignations.company_id')  
        ->get();

        return view('corehr.resignations')->with([
            'employee'=>$employee, 
            'company'=>$company, 
            'designation'=>$designation, 
            'table'=>$table,
        ]); 
   }

   public function store(Request $request){
      

    $store = DB::table('xin_employee_resignations')->insert([
      'company_id'=>$request->input('company'),
      'designation_id'=>1,
      'employee_id'=>$request->input('resigning-employee'),
      'notice_date'=>$request->input('notice-date'),
      'resignation_date'=>$request->input('Resignation-date'),
      'reason'=>$request->input('resignation-reason'),
      'added_by'=>'admin-name',
    ]);
       
      if($store){
            return back()->with([
                'message'=>'Resignation Added', 'status'=> 1
            ]);
       }  
   }
   public function edit($id){
      print "<pre>";
      // $edit = DB::table('xin_employee_resignations')->where('resignation_id','=',$id)->get(); 
      //  echo json_encode($edit);
      echo $id; 
   }
   public function update(Request $request){
      print "<pre>";
      print_r($request->input());
   }
   public function delete($id){
      $delete = DB::table('xin_employee_resignations')->where('resignation_id',$id)->delete(); 
      if($delete){
            return back()->with([
                'message'=>'Resignation Deleted', 'status'=> 2
            ]);
       }
   }

   public function show($id){
        $show = DB::table('xin_employee_resignations')->where('resignation_id',$id)->get();
       echo json_encode($show);
    }

}
