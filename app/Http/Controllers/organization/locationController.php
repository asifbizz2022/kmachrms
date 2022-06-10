<?php

namespace App\Http\Controllers\organization;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class locationController extends Controller
{
    public function index(){
        $company = DB::table('xin_companies')->get();
        $employee = DB::table('xin_employees')->get();
        $table = DB::table('xin_office_location')
        ->join('xin_companies','xin_companies.company_id','xin_office_location.location_id')
        ->get();
        return view('organization.locations')->
        with([
            'company'=>$company,
            'employee'=>$employee,
            'table'=>$table,
        ]);
    }

    public function store(Request $request)
    {
        
        $date = date('m-d-Y');
        $data = [
            'company_id'=>$request->input('company-type'),
            'location_head'=>$request->input('location-head'),
            'location_manager'=>$request->input('location-head'),
            'location_name'=>$request->input('location-name'),
            'email'=>$request->input('email'),
            'phone'=>$request->input('phone'),
            'fax'=>$request->input('fax'),
            'address_1'=>$request->input('address-one'),
            'address_2'=>$request->input('address-two'),
            'city'=>$request->input('city'),
            'state'=>$request->input('state'),
            'zipcode'=>$request->input('zip'),
            'country'=>$request->input('country'),
            'added_by'=>'addedby',
            'created_at'=>$date,
            
        ];

        $store = DB::table('xin_office_location')->insert($data);
        if($store){
            return back()->with([
                'message'=>'Added Successfully',
            ]);
        }
          
    }
    public function delete($id)
    { 
        $delete = DB::table('xin_companies')->where('company_id','=',$id)->delete();
        if($delete){
            return back()->with([
                'message'=>'Row Deleted',
            ]);
        }
    }
    public function edit($id) 
    {
        $get = DB::table('xin_companies')->where('company_id','=',$id)->get();
        print "<pre>";
        print_r($get);
    }
    public function update(Request $request)
    {
          print "<pre>";
        print_r($request->input());
    }


}
