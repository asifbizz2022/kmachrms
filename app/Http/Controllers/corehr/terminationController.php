<?php

namespace App\Http\Controllers\corehr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class terminationController extends Controller
{
    public function index()
    { 
        
        $employee = DB::table('xin_employees')->get();
        $company = DB::table('xin_companies')->get();
        $termination_type = DB::table('xin_termination_type')->get();

        $table = DB::table('xin_employee_terminations') 
        ->join('xin_termination_type','xin_termination_type.termination_type_id','xin_employee_terminations.termination_type_id')
        ->join('xin_employees','xin_employees.employee_id','xin_employee_terminations.employee_id')
          ->join('xin_companies','xin_companies.company_id','xin_employee_terminations.company_id')
        ->get(); 

        return view('corehr.terminations')->with([
            'employee'=>$employee, 
            'company'=>$company,  
            'table'=> $table,
            'type'=>$termination_type,
        ]);
        // print "<pre>";
        // print_r($table);
    }

    public function store(Request $request){

    print "<pre>"; 

    $store = DB::table('xin_employee_terminations')->insert([
        'company_id'=>$request->input('company'),
        'employee_id'=>$request->input('employee-terminated'),
        'terminated_by'=>$request->input('terminated-by'),
        'termination_type_id'=>$request->input('termination-type'),
        'termination_date'=>$request->input('termination-date'),
        'description'=>$request->input('description'), 
        'attachment'=>$request->input('attachment'),
        'notice_date'=>$request->input('notice-date'),
    ]);

    if($store){
        return back()->with(['message'=>'Added Successfully' , 'status'=>1]);
    }

    }
   public function delete($id)
    {
        $delete = DB::table('xin_employee_terminations')->where('termination_id', '=', $id)->delete();
        if($delete){
            return back()->with(['message'=>'Deleted Successfully' , 'status'=>2]);
        }
    }
    public function edit($id)
    {
       $edit = DB::table('xin_employee_terminations')->where('termination_id', '=', $id)->get(); 
        echo json_encode($edit); 
    }
    public function update(Request $request){
          
        $id = $request->input('id');
        $data = [
        'company_id'=>$request->input('company'),
        'employee_id'=>$request->input('employee-terminated'),
        'terminated_by'=>$request->input('terminated-by'),
        'termination_type_id'=>$request->input('termination-type'),
        'termination_date'=>$request->input('termination-date'),
        'description'=>$request->input('description'), 
        'attachment'=>$request->input('attachment'),
        'notice_date'=>$request->input('notice-date'),
    ];

        $update = DB::table('xin_employee_terminations')->where('termination_id', '=', $id)->update($data);
        if($update){
            return back()->with(['message'=>'Updated Successfully' , 'status'=>3]);
        }
    }

    public function show($id){
        $show = DB::table('xin_employee_terminations')->where('termination_id', '=', $id)->get(); 
       echo json_encode($show);
    }
    
}
