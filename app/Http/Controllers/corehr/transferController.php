<?php

namespace App\Http\Controllers\corehr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class transferController extends Controller
{
    public function index()
    {
        $dept =  DB::table('xin_departments')->get();
        $location = DB::table('xin_office_location')->get();
        $transfer = DB::table('xin_employee_transfer')->get();
        $emp = DB::table('xin_employees')->get();
        $company = DB::table('xin_companies')->get();

        $table = DB::table('xin_employee_transfer')
        ->join('xin_employees','xin_employees.employee_id','xin_employee_transfer.employee_id')
        ->join('xin_companies','xin_companies.company_id','xin_employee_transfer.company_id')  
        ->get();

        return view('corehr.transfers')->with([
            'employee'=>$emp, 
            'company'=>$company, 
            'department'=>$dept,
            'location'=>$location,
            'transfer'=>$transfer,
            'table'=>$table,
        ]);
    }
    public function store(Request $request){
        $request->validate([
            'company'=>'required',
            'employee-to-transfer'=>'required',
            'transfer-to-department'=>'required',
            'transfer-to-location'=>'required',
            'transfer-date'=>'required',
            'description'=>'required',
        ]);
        $store = DB::table('xin_employee_transfer')->insert([
            'company_id'=>$request->input('company'),
            'employee_id'=>$request->input('employee-to-transfer'),
            'transfer_department'=>$request->input('transfer-to-department'),
            'transfer_location'=>$request->input('transfer-to-location'),
            'transfer_date'=>$request->input('transfer-date'),
            'description'=>$request->input('description'),
            'status'=>1,
            'added_by'=>'Admin',
        ]);
         
        if($store){
             return response()->json([
                'message'=>'Transfer Stored' , 
                'status'=>1,
            ]);
        } else {
            return response()->json([
                'status'=>false,
            ]);
        }

        print "<pre>";
        print_r($request->all());
    }

    public function delete($id){
        $delete = DB::table('xin_employee_transfer')->where('transfer_id',$id)->delete(); 
        //return response()->json(['message'=>$table]); 
         if($delete){
             return response()->json([
                'message'=>'Transfer Deleted' , 
                'status'=> 2,
            ]);
        } else {
            return response()->json([
                'status'=>false,
            ]);
        }
    }

    public function edit($id){
          
        $table = DB::table('xin_employee_transfer')->where('transfer_id','=',$id)->get();
        return response()->json($table);
    }

    public function update(Request $request){ 

         
        $id = $request->input('id');

        $data = [
            'company_id'=>$request->input('company'),
            'employee_id'=>$request->input('employee-to-transfer'),
            'transfer_department'=>$request->input('transfer-to-department'),
            'transfer_location'=>$request->input('transfer-to-location'),
            'transfer_date'=>$request->input('transfer-date'),
            'description'=>$request->input('description'),
            'status'=>1,
            'added_by'=>'Admin',
        ];

        $update = DB::table('xin_employee_transfer')->where('transfer_id','=',$id)->update($data);
         
         if($update){
             return back()->with([
                'message'=>'Transfer Updated' , 
                'status'=>3,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
    }

     
}
