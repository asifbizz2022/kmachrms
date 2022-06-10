<?php

namespace App\Http\Controllers\Training;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class trainingTypeController extends Controller
{
     public function index()
    {
     $trainingType = DB::table('xin_training_types')->get();
     
     $company = DB::table('xin_companies')->get();

         return view('training.training-type')
         ->with([
          'trainingType'=>$trainingType,
          'company'=>$company,
          ]);
    }

    public function store(Request $request)
    {
          $store = DB::table('xin_training_types')->insert([
               'type'=>$request->input('training-type'),
               'company_id'=>$request->input('company-id'),
          ]);

          if($store){
               return back()->with(['message'=>'Training Type Added','status'=> 1]);
          }

    }
    public function delete($id)
    {
     $delete = DB::table('xin_training_types')->where('training_type_id','=', $id)->delete();
     if($delete){
          return back()->with(['message'=>'Training Type Deleted','status'=> 2]);
     }
    }

    public function edit($id)
    {
     $edit = DB::table('xin_training_types')->where('training_type_id','=',$id)->get();
     echo json_encode($edit);
    }

    public function update(Request $request)
    {
     print "<pre>";
     print_r($request->input());
     $id = $request->input('id');

     $data = [
          'type'=>$request->input('training-type'),
          'company_id'=>$request->input('company-id'),
     ];

     $update = DB::table('xin_training_types')->where('training_type_id','=',$id)->update($data);
     if($update){
          return back()->with(['message'=>'Training Type Update','status'=> 3]);
     }
    }
}
