<?php

namespace App\Http\Controllers\organization;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class officialController extends Controller
{
    public function index()
    {
        $company = DB::table('xin_companies')->get();

        $table = DB::table('xin_company_documents')->
        join('xin_companies','xin_companies.company_id','xin_company_documents.company_id')
        ->join('xin_document_type','xin_document_type.document_type_id','xin_company_documents.document_type_id')->get();
         return view('organization.official-documents')
         ->with([
            'company'=>$company,
            'table'=>$table,
         ]); 
    }
    public function store(Request $request)
    {
         $path = $request->file('document');
         $image = 'Document_'.time().'_'.$path->getClientOriginalName();

         $data = [
            'document_type_id'=>$request->input('document-type'),
            'license_name'=>$request->input('license-name'),
            'company_id'=>$request->input('company'),
            'expiry_date'=>$request->input('expiry-date'),
            'license_number'=>$request->input('license-number'),
            'license_notification'=>$request->input('license-notification'),
            'added_by'=>1,
            'document'=>$image,
         ];

         $store = DB::table('xin_company_documents')->insert($data);
         if($store){
             return back()->with([
                'message'=>'Document Sotred' , 
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
        $delete = DB::table('xin_company_documents')->where('document_id','=',$id)->delete();
        if($delete){
             return back()->with([
                'message'=>'Document Deleted' , 
                'status'=>2,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
    }
    public function edit($id) 
    {
        $get = DB::table('xin_company_documents')->where('document_id','=',$id)->get();
        print "<pre>";
        print_r($get);
    }
    public function update(Request $request)
    {
        print "<pre>";
        print_r($request->input());
         if($update){
             return back()->with([
                'message'=>'Company Updated' , 
                'status'=>3,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
    }


}
