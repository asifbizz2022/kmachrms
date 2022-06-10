<?php

namespace App\Http\Controllers\organization;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class companypolicyController extends Controller
{
    public function index() 
    {
        $policy = DB::table('xin_company_policy')->get();
        $company = DB::table('xin_companies')->get();
        $results = DB::table('xin_company_policy')
                ->join('xin_companies','xin_companies.company_id','=','xin_company_policy.company_id')
                ->get();
        return view('organization.company-policy')->with(
            [
            'results',$results, 
            'company'=>$company,
            'policy'=>$policy,
            ]
        );
    }
    public function store(Request $request) 
    {
        //print "<pre>"; print_r($request->input());
        $path = $request->file('attachements');
        $img_name =  'Atch-'.time().'-'.$path->getClientOriginalName(); 
        
        $data = [
            'company_id'=>$request->input('company'),
            'title'=>$request->input('title'),
            'description'=>$request->input('description'),
            'attachment'=>$img_name,
            'added_by'=>1,
        ];

        $store = DB::table('xin_company_policy')->insert($data);
    
        if($store){
             return back()->with([
                'message'=>'Policy Stored' , 
                'status'=>1,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
    }
    public function view($id) 
    {
        $view = DB::table('xin_company_policy')->where('policy_id','=',$id)->get();
        echo json_encode($view);
    }
    public function edit($id) 
    {
        $edit = DB::table('xin_company_policy')->where('policy_id','=',$id)->get();
        echo json_encode($edit);

    }
    public function update(Request $request) 
    {   
        $id = $request->input('id');
        $path = $request->file('attachements');
        $img_name =  'Atch-'.time().'-'.$path->getClientOriginalName(); 
        
        $data = [
            'company_id'=>$request->input('company'),
            'title'=>$request->input('title'),
            'description'=>$request->input('description'),
            'attachment'=>$img_name,
            'added_by'=>1,
        ];

        $update = DB::table('xin_company_policy')->where('policy_id','=',$id)->update($data);
    
        if($update){
             return back()->with([
                'message'=>'Policy Updated' , 
                'status'=>3,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
    }
    public function delete($id) 
    {
        $delete = DB::table('xin_company_policy')->where('policy_id','=',$id)->delete();
        
          if($delete){
             return back()->with([
                'message'=>'Policy Deleted' , 
                'status'=>2,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
        
    }
}
