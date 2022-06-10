<?php

namespace App\Http\Controllers\corehr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class awardsController extends Controller
{
    public function index(){
       $result =  DB::table('xin_awards')
        ->get();

        $emp = DB::table('xin_employees')->get();
          $company = DB::table('xin_companies')->get();
          $awards = DB::table('xin_awards')
          ->join('xin_award_type','xin_award_type.award_type_id','xin_awards.award_type_id')
          ->get();
          $award_type = DB::table('xin_award_type')->get();

            return view('corehr.awards')
            ->with([
                'result'=>$result,
                'employee'=>$emp,
                'companies'=>$company,
                'awards'=> $awards,
                'award_type'=>$award_type,
            ]);
    }

    public function store(Request $request){ 

        $request->validate([
            'company'=>'required',
            'employee'=>'required',
            'award_type'=>'required',
            'gift'=>'required',
            'cash'=>'required',
            'photo'=>'required',
            'months-year'=>'required',
            'award-information'=>'required',
            'description'=>'required',
        ]);

        $data = [  
            'company_id' => $request->input('company'),
            'employee_id' => $request->input('employee'),
            'award_type_id' => $request->input('award-type'),
            'gift_item' =>  $request->input('gift'),
            'cash_price' => $request->input('cash'),
            'award_photo' => $request->input('photo'),
            'award_month_year' => $request->input('months-year'),
            'award_information' =>$request->input('award-information'),
            'description'=> $request->input('description'), 
        ]; 

        $store = DB::table('xin_awards')->insert($data);
        if($store){
            return response()->json(['message'=>'Award Saved', 'status'=>1]);
        }
 
       
    }
    public function delete($id)
    {
        $delete = DB::table('xin_awards')->where('award_id', '=', $id)->delete();
        if($delete){
            return response()->json([
                'message'=>'Deleted Successfully',
                'status'=>2
            ]);
        } else {
            return response()->json([
                'status'=>false,
            ]);
        }
    }
    public function edit($id)
    {
       $edit = DB::table('xin_awards')->where('award_id', '=', $id)->get(); 
        echo json_encode($edit); 
    }
    public function update(Request $request)
    {
        $id = $request->input('id');
         
        $data = [  
            'company_id' => $request->input('company'),
            'employee_id' => $request->input('employee'),
            'award_type_id' => $request->input('award-type'),
            'gift_item' =>  $request->input('gift'),
            'cash_price' => $request->input('cash'),
            'award_photo' => $request->input('photo'),
            'award_month_year' => $request->input('months-year'),
            'award_information' =>$request->input('award-information'),
            'description'=> $request->input('description'), 
        ]; 

        $update = DB::table('xin_awards')->where('award_id','=',$id)->update($data);

        if($update){
            return back()->with([
                'message'=>'Updated Successfully',
                'status'=>3
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
        
    }

    public function dependent($id){
        $emp = DB::table('xin_employees')->where('company_id','=',$id)->get();
        if($emp){
            echo json_encode($emp);
        } else {
            echo json_encode($emp);
        }
       
    }

    public function show($id)
    {
       $show = DB::table('xin_awards')->where('award_id', '=', $id)->get(); 
        echo json_encode($show); 
    }
}
