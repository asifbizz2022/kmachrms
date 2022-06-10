<?php

namespace App\Http\Controllers\corehr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class promotionsController extends Controller
{
    public function index()
    {
        $employee = DB::table('xin_employees')->get();
        $company = DB::table('xin_companies')->get();
        $designation = DB::table('xin_designations')->get();

         $table = DB::table('xin_employee_promotions')
         ->join('xin_companies','xin_companies.company_id','xin_employee_promotions.company_id')
         ->join('xin_employees','xin_employees.employee_id', 'xin_employee_promotions.employee_id')
         ->get();
        return view('corehr.promotions')->with([
            'employee'=>$employee,
            'company'=>$company,
            'designation'=>$designation,
            'table'=>$table,
        ]);
    }

    public function store(Request $request){
        print "<pre>"; 

       $result =  DB::table('xin_employee_promotions')->insert([
            'company_id'=>$request->input('company'),
            'employee_id'=>$request->input('promotion-for'),
            'title'=>$request->input('promotion-title'),
            'promotion_date'=>$request->input('promotion-date'),
            'description'=>$request->input('description'),
            'added_by'=>'Admin',
        ]);

       if($result){
            return back()->with([
                'message'=>'Promotion Added', 'status'=> 1
            ]);
       }  
      
    }
    public function delete($id){
        echo $id;
        $delete = DB::table('xin_employee_promotions')->where('promotion_id','=',$id)->delete();
        if($delete){
            return back()->with([
                'message'=>'Promotion Deleted', 'status'=> 2
            ]);
        }
    }
    public function edit($id){
        $edit = DB::table('xin_employee_promotions')->where('promotion_id','=',$id)->get();
        echo json_encode($edit);
    }
    public function update(Request $request){
        print "<pre>";
        print_r($request->input());
        $id = $request->input('id');
        $data = [
            'company_id'=>$request->input('company'),
            'employee_id'=>$request->input('promotion-for'),
            'title'=>$request->input('promotion-title'),
            'promotion_date'=>$request->input('promotion-date'),
            'description'=>$request->input('description'),
            'added_by'=>'Admin',
        ];

        $update = DB::table('xin_employee_promotions')->where('promotion_id','=',$id)->update($data);
        if($update){
            return back()->with(['message'=>'Promotion Updated', 'status'=> 3]);
        }
    }

    public function show($id){
        $show = DB::table('xin_employee_promotions')->where('promotion_id','=',$id)->get();
       echo json_encode($show);
    }
}
