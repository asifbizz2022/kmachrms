<?php

namespace App\Http\Controllers\corehr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class complaintsController extends Controller
{
    public function index(){
         
        $employee = DB::table('xin_employees')->get();
        $admin = DB::table('xin_employees')->where('user_role_id','=', 1)->get();
        $company = DB::table('xin_companies')->get(); 

        $table = DB::table('xin_employee_complaints') 
        ->join('xin_companies','xin_companies.company_id','xin_employee_complaints.company_id') 
        ->join('xin_employees','xin_employees.employee_id','xin_employee_complaints.complaint_from','xin_employee_complaints.complaint_against') 

        ->get(); 

        return view('corehr.complaints')->with([
            'employee'=>$employee, 
            'company'=>$company,  
            'table'=>$table,
            'admin'=>$admin,
        ]); 

        return view('corehr.complaints');
     }

     public function store(Request $request){
         

        $request->validate([
            'company'=>'required',
            'complaint-from'=>'required',
            'title'=>'required',
            'complaint-date'=>'required',
            'complaint-against'=>'required',
            'description'=>'required',
            'attachment'=>'required',
        ]);

        $store =  DB::table('xin_employee_complaints')->insert([
            'company_id'=>$request->input('company'),
            'complaint_from'=>$request->input('complaint-from'),
            'title'=>$request->input('title'),
            'complaint_date'=>$request->input('complaint-date'),
            'complaint_against'=>$request->input('complaint-against'),
            'description'=>$request->input('description'),
            'attachment'=>$request->input('attachment'),
            'status'=>1,
        ]);

       if($store){
            return response()->json(['message'=>'Complaint Saved', 'status'=>1]);
        }
      
    }
    public function delete($id){
        echo $id;
        $delete = DB::table('xin_employee_complaints')->where('complaint_id','=',$id)->delete();
        if($delete){
            return back()->with([
                'message'=>'Complaint Deleted', 
                'status'=> 2
            ]);
        } else {

            return back()->with([
                'status'=>0,
            ]);
        }
    }
    public function edit($id){
        $edit = DB::table('xin_employee_complaints')->where('complaint_id','=',$id)->get();
       echo json_encode($edit);
    }

    public function update(Request $request){
       
        
        $id = $request->input('id');
        $data = [ 
            'company_id'=>$request->input('company'),
            'complaint_from'=>$request->input('complaint-from'),
            'title'=>$request->input('title'),
            'complaint_date'=>$request->input('complaint-date'),
            'complaint_against'=>$request->input('complaint-against'),
            'description'=>$request->input('description'),
            'attachment'=>$request->input('attachment'),
            'status'=>1, 
        ];

        $update = DB::table('xin_employee_complaints')->where('complaint_id','=',$id)->update($data);
        if($update){
            return back()->with([
                'message'=>'Complaint Updated', 
                'status'=>3
            ]);
        } else {

            return back()->with([
                'status'=>0,
            ]);
        }


    }

    public function show($id){
        $show = DB::table('xin_employee_complaints')->where('complaint_id','=',$id)->get();
       echo json_encode($show);
    }


}
