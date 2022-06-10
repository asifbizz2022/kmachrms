<?php

namespace App\Http\Controllers\Training;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class trainingController extends Controller
{
    public function index()
    { 
        $company = DB::table('xin_companies')->get();
        $employees = DB::table('xin_employees')->get();
        $trainingType = DB::table('xin_training_types')->get();
        $trainer = DB::table('xin_trainers')->get();
        $table = DB::table('xin_training')
        ->join('xin_employees','xin_employees.employee_id','xin_training.employee_id')
        ->join('xin_companies','xin_companies.company_id','xin_training.company_id')
        ->join('xin_trainers','xin_trainers.trainer_id','xin_training.trainer_id')->get();
        return view('training.training-list')->with([
            'employees'=>$employees,
            'company'=>$company,
            'trainingType'=>$trainingType,
            'trainer'=>$trainer,
            'table'=>$table,
        ]);
        
    }
    public function store(Request $request){
        
       

        $data = [
            'company_id'=>$request->input('company'),
            'employee_id'=>$request->input('employee-id'),
            'trainer_option'=>$request->input('trainer-option'),
            'training_type_id'=>$request->input('training-type'),
            'trainer_id'=> $request->input('trainer'),
            'start_date'=>$request->input('start-date')  ,
            'finish_date'=>$request->input('end-date')  ,
            'training_cost'=>$request->input('training-cost')  ,
            'description'=>$request->input('description')  ,
            'performance'=>'Performance'  ,
            'remarks'=>'remarks' ,
        ];
        $store = DB::table('xin_training')->insert($data);
        if($store){
            return back()->with(['message'=>'Training Added', 'status'=> 1]);
        }
        //print "<pre>";print_r($request->input());
    }
    public function delete($id)
    {
        $delete = DB::table('xin_training')->where('training_id','=',$id)->delete();
        if($delete){
            return back()->with(['message'=>'Training Deleted', 'status'=> 2]);
        }
    }
    public function edit($id)
    {
        $get = DB::table('xin_training')->where('training_id','=',$id)->get();
        echo json_encode($get);
    }
    public function update(Request $request)
    {
         
        $id = $request->input('id');
        $data = [
            'company_id'=>$request->input('company'),
            'employee_id'=>$request->input('employee-id'),
            'trainer_option'=>$request->input('trainer-option'),
            'training_type_id'=>$request->input('training-type'),
            'trainer_id'=> $request->input('trainer'),
            'start_date'=>$request->input('start-date')  ,
            'finish_date'=>$request->input('end-date')  ,
            'training_cost'=>$request->input('training-cost')  ,
            'description'=>$request->input('description')  ,
            'performance'=>'Performance'  ,
            'remarks'=>'remarks' ,
        ];
        $update = DB::table('xin_training')->where('training_id','=',$id)->update($data);
        if($update){
            return back()->with(['message'=>'Training Updated', 'status'=> 3]);
        }

    }

}
