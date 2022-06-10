@extends('layout.app') 
@section('page-body')
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">
    Edit Roles and privilages
    </h1>
</div>
<div class="card">
    <div class="card-body">
        @foreach($result as $rows)
        <form action="#" method="post" id="edit-role-form" >@csrf
        <p> 
            <label>Role Name</label>
            <input type="text" class="form form-control form-sm" name="role-name" value="{{ $role->role_name }}" placeholder="Role Name"/>
        </p>
        <p>
            <label>Select Access</label>
            <select class="form form-control form-sm" name="role-access">
                <option name="all-menu-access">{{ $rows->role_access }}</option>
               
            </select>
        </p>
        <p>
            <button type="submit" class="btn btn-primary btn-sm">Save</button>
        </p>
        </form>
        @endforeach
    </div>
</div>
@endsection