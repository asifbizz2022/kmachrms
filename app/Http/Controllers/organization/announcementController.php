<?php

namespace App\Http\Controllers\organization;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class announcementController extends Controller
{
    public function index()
    {
        $employee = DB::table('xin_employees')->get();
        $company = DB::table('xin_companies')->get();
        $department = DB::table('xin_departments')->get();
        $location = DB::table('xin_office_location')->get();

        $result = DB::table('xin_announcements')
        ->join('xin_office_location','xin_office_location.location_id','xin_announcements.location_id')
        ->join('xin_departments','xin_departments.department_id','xin_announcements.department_id')
        ->join('xin_companies','xin_companies.company_id','xin_announcements.company_id')
        ->get();
        return view('organization.announcements')
        ->with(['result'=>$result,
            'company'=>$company, 
            'department'=>$department,
            'location'=>$location
        ]);

     
    }
    public function store(Request $request){
        
        $store = DB::table('xin_announcements')->insert([
            'title'=>$request->input('title'),
            'description'=>$request->input('description'),
            'start_date'=>$request->input('start-date'),
            'end_date'=>$request->input('end-date'),
            'company_id'=>$request->input('company-id'),
            'location_id'=>$request->input('location-id'),
            'department_id'=>$request->input('department-id'),
            'summary'=>$request->input('summary'),
        ]); 

        if($store){
             return back()->with([
                'message'=>'Announcement Added' , 
                'status'=>1,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
    }

    public function edit($id)
    {
        $edit = DB::table('xin_announcements')->where('announcement_id','=',$id)->get(); 
        echo json_encode($edit);     

    }
    public function update(Request $request)
    {
        $id = $request->input('id');
        
        $data = [
            'title'=>$request->input('title'),
            'description'=>$request->input('description'),
            'start_date'=>$request->input('start-date'),
            'end_date'=>$request->input('end-date'),
            'company_id'=>$request->input('company-id'),
            'location_id'=>$request->input('location-id'),
            'department_id'=>$request->input('department-id'),
            'summary'=>$request->input('summary'),
        ];

        $update = DB::table('xin_announcements')->where('announcement_id','=',$id)->update($data);

        if($store){
             return back()->with([
                'message'=>'Announcement Updated' , 
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
       $delete = DB::table('xin_announcements')->where('announcement_id','=',$id)->delete();
       
        if($store){
             return back()->with([
                'message'=>'Announcement Deleted' , 
                'status'=>2,
            ]);
        } else {
            return back()->with([
                'status'=>false,
            ]);
        }
         
    }
}
