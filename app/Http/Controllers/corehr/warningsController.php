<?php

namespace App\Http\Controllers\corehr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class warningsController extends Controller
{
    public function index()
    {
        $employee = DB::table('xin_employees')->get();
        $company = DB::table('xin_companies')->get();
        $warning = DB::table('xin_warning_type')->get();

        $table = DB::table('xin_employee_warnings')
        ->join('xin_companies','xin_companies.company_id','xin_employee_warnings.company_id') 
        ->get();

        return view('corehr.warnings')->with([
            'employee'=>$employee,
            'company'=>$company,
            'table'=>$table,
            'warning'=>$warning,
        ]);
        print "<pre>";
        print_r($table);
    }

    public function store(Request $request){
        
       
       
        $result =  DB::table('xin_employee_warnings')->insert([
            'company_id'=>$request->input('company'),
            'warning_to'=>$request->input('warning-to'),
            'warning_by'=>$request->input('warning-by'),
            'warning_date'=>$request->input('warning-date'),
            'warning_type_id'=>$request->input('warning-type'),
            'attachment'=>$request->input('attachment'),
            'subject'=>$request->input('subject'),
            'description'=>$request->input('description'),  
        ]);

        if($result){
            return back()->with([
                'message'=>'Warning Added', 'status'=>1
            ]);
        }  

      
      
    }
    public function delete($id){
        echo $id;
        $delete = DB::table('xin_employee_warnings')->where('warning_id','=',$id)->delete();
        if($delete){
            return back()->with([
                'message'=>'Warning Deleted', 'status'=>2
            ]);
        }
    }
    public function edit($id){
        $edit = DB::table('xin_employee_warnings')->where('warning_id','=',$id)->get();
        echo json_encode($edit);
    }
    public function update(Request $request){
        print "<pre>";
        print_r($request->input());

        $id = $request->input('id');
        $data = [
            'company_id'=>$request->input('company'),
            'warning_to'=>$request->input('warning-to'),
            'warning_by'=>$request->input('warning-by'),
            'warning_date'=>$request->input('warning-date'),
            'warning_type_id'=>$request->input('warning-type'),
            'attachment'=>$request->input('attachment'),
            'subject'=>$request->input('subject'),
            'description'=>$request->input('description'),  
        ];

        $update = DB::table('xin_employee_warnings')->where('warning_id','=',$id)->update($data);
        if($update){
            return back()->with([
                'message'=>'Warning Updated', 'status'=>3
            ]);
        }

    }

    public function show($id){
        $show = DB::table('xin_employee_warnings')->where('warning_id','=',$id)->get();
        echo json_encode($show);
    }
}
