<?php

namespace App\Http\Controllers\staff;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class roleController extends Controller
{
    public function roles_and_privilages()
    {
       $result = DB::table('roles')->
       join('xin_user_roles','xin_user_roles.role_id','=','roles.role_id')->get();
    return view('staff.role-privilages')->with('result', $result);


    }
    public function add_role(Request $request)
    {
        // DB::table('xin_user_roles')->insert([
        //     'role_name'=> $request->post('role-name'),
        //     'role_access'=>$request->post('role-access'),
        //     'created_at'=>date('m-d-Y'),
            
        //     'company_id'=>2,
        //     'role_resources'=> 3,
            
        // ]);
        //return back();
       return response()->json(['role' => 'Data Submitted' ]);
    }
    public function destroy($id)
    {
        DB::table('xin_user_roles')->where('role_id','=', $id)->delete();
        return back();
    }
    public function edit($id)
    {
        
        $result = DB::table('xin_user_roles')->where('role_id','=', $id)->get();
        return view('staff.role-edit-form')->with('result', $result);
    }
    public function update(Request $request)
    {
        DB::table('xin_user_roles')->insert([
            'role_name'=> $request->post('role-name'),
            'role_access'=>$request->post('role-access'),
            'created_at'=>date('m-d-Y'),
        ]);
        return back();
    }
}
