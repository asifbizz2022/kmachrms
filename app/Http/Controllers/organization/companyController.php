<?php

namespace App\Http\Controllers\organization;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class companyController extends Controller
{
    public function index() 
    {
        $type = DB::table('xin_company_type')->get();
        $employee = DB::table('xin_employees')->get();
        

        $table = DB::table('xin_companies')
                ->join('xin_company_type','xin_company_type.type_id','xin_companies.type_id')
                ->get();
        return view('organization.company')->with(['table'=>$table, 'type'=>$type]);
    }
  
    public function store(Request $request)
    {
        
        $data = [
        'name'=>$request->input('company'),
        'type_id' => $request->input('company-type'),
        'trading_name' => $request->input('legal-trading-name'),
        'registration_no' => $request->input('registration-name'),
        'contact_number' => $request->input('contact_number'),
        'email' => $request->input('email'),
        'website_url' => $request->input('website-url'),
        'username' => $request->input('username'),
        'password' => $request->input('password'),
        'government_tax' => $request->input('tax-number'),
        'address_1' => $request->input('address-one'),
        'address_2' => $request->input('address-two'),
        'city' => $request->input('city'),
        'state' => $request->input('state-province'),
        'zipcode' => $request->input('zip-code'),
        'logo' => $request->input('company-logo'),
        'default_currency' => $request->input('currency'),
        'default_timezone' => $request->input('timezone'),
        'country' => $request->input('country'),
        ];
        $store = DB::table('xin_companies')->insert($data);
        
        if($store){
             return back()->with([
                'message'=>'Company Added' , 
                'status'=>1,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }


      
    }
    public function delete($id)
    { 
        $delete = DB::table('xin_companies')->where('company_id','=',$id)->delete();
        
        if($store){
             return back()->with([
                'message'=>'Company Deleted' , 
                'status'=>2,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
    }

    public function show($id)
    {
        $show = DB::table('xin_companies')->where('company_id','=',$id)->get();
        echo json_encode($show);
         
    }
    public function edit($id) 
    {
         
       $get = DB::table('xin_companies')->where('company_id','=',$id)->get();
       echo json_encode($get);
    }

    public function update(Request $request)
    { 
        
       $id = $request->input('id');
        
        $data = [
        'name'=>$request->input('company'),
        'type_id' => $request->input('company-type'),
        'trading_name' => $request->input('legal-trading-name'),
        'registration_no' => $request->input('registration-name'),
        'contact_number' => $request->input('contact-number'),
        'email' => $request->input('email'),
        'website_url' => $request->input('website-url'),
        'username' => $request->input('username'),
        'password' => $request->input('password'),
        'government_tax' => $request->input('tax-number'),
        'address_1' => $request->input('address-one'),
        'address_2' => $request->input('address-two'),
        'city' => $request->input('city'),
        'state' => $request->input('state-province'),
        'zipcode' => $request->input('zip-code'),
        'logo' => $request->input('company-logo'),
        'default_currency' => $request->input('currency'),
        'default_timezone' => $request->input('timezone'),
        'country' => $request->input('country'),
        ];

        $update  = DB::table('xin_companies')->where('company_id',$id)->update($data);
       
        if($store){
             return back()->with([
                'message'=>'Company Updated' , 
                'status'=>1,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }



    }
}
