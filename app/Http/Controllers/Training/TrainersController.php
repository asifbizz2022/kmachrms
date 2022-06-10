<?php

namespace App\Http\Controllers\Training;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class TrainersController extends Controller
{
    
    public function index()
    {
        $table = DB::table('xin_trainers as t')
        ->join('xin_companies as c','c.company_id','=','t.company_id')
        ->get();
        $company = DB::table('xin_companies')->get();
         $designation = DB::table('xin_designations')->get();
        
        return view('training.trainner-list')->with([
            'company'=>$company,
            'table'=>$table,
            'designation'=>$designation,
        ]);
    }

     
    public function store(Request $request)
    {
        print "<pre>";
        

        $data = [
            'company_id'=>$request->input('company'),
            'first_name'=>$request->input('first-name'),
            'last_name'=>$request->input('last-name'),
            'contact_number'=>$request->input('contact-number'),
            'email'=>$request->input('email'),
            'address'=>$request->input('address'),
            'expertise'=>$request->input('expertise'), 
            'designation_id'=>$request->input('designation'),
        ];
        $store = DB::table('xin_trainers')->insert($data);
        if($store){
            return back()->with(['message'=>'Trainners Delete', 'status'=>1]);
        }
    }

    
    public function show($id)
    {
         
    }
 
    public function edit($id)
    {

        $edit = DB::table('xin_trainers')->where('trainer_id','=',$id)->get();
       echo json_encode($edit);
    }
 
    public function update(Request $request)
    {
         
        $id = $request->input('id');
        $data = [
            'company_id'=>$request->input('company'),
            'first_name'=>$request->input('first-name'),
            'last_name'=>$request->input('last-name'),
            'contact_number'=>$request->input('contact-number'),
            'email'=>$request->input('email'),
            'address'=>$request->input('address'),
            'expertise'=>$request->input('expertise'), 
            'designation_id'=>$request->input('designation'),
        ];

        $update = DB::table('xin_trainers')->where('trainer_id','=',$id)->update($data);
        if($update){
            return back()->with([
                'message'=>'Trainers Updated',
                'status'=>2,
            ]);
        }
    }
 
    public function delete($id)
    {
        $delete = DB::table('xin_trainers')->where('trainer_id','=',$id)->delete();
        if($delete){
            return back()->with(['message'=>'Trainers Deleted','status'=>3]);
        }
    }
}
