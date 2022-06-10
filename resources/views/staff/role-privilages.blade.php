@extends('layout.app') 
@section("heading")
Roles and Privilages
@endsection
@section('page-body') 
<div class="card">
    <div class="card-header">
        <div class="d-flex justify-content-between">
             <h5>Add New Employee</h5> 
             <button class="btn btn-sm btn-info add-new-btn">Add New</button>
        </div>
              
    </div>
<div class="card-body p-3 add-role-form"  >  
    <form action="{{ route('add-role') }}" method="post"  >@csrf
    <div class=""> 
        <div class="row">
            <div class="col-md-4">
               
                    <p> 
                        <label>Role Name</label>
                        <input type="text" class="form form-control form-sm" name="role-name" placeholder="Role Name"/>
                    </p>
                    <p>
                        <label>Select Access</label>
                        <select class="form form-control" id="select-access" >
                            <option value="all-menu-access">All menu Access</option>
                            <option value="custom-menu-access">Custom Menu Access</option>
                        </select> 

                    </p> 
            </div>
        </div> 
    </div> 
     <p class="text-right">
                        <button type="submit" class="btn btn-primary ">
                            <i class="fa fa-check-square mr-1"></i>
                        Save</button>
                    </p> 
    </form>
</div> 
</div>
 
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h5 class="card-title">List All Role</h5>
    </div>
    <div class="card-body">
<div class="table-responsive">
<table class="table table-bordered table-sm" id="example3" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th>Role Id</th>
        <th>Role Name</th>
        <th>Menu Permission</th>
        <th>Add Delete</th> 
    </thead>
    @foreach($result as $rows)
    <tbody>
        <tr>
              <td> 
                <a href="{{ route('role-edit-form', $rows->role_id ) }}" class="btn btn-primary btn-xs  "  >
                    <i class="fa fa-edit"></i>
                </a> 
                <a href="{{ route('role-delete', $rows->role_id ) }}" class="btn btn-danger btn-xs ">
                 <i class="fa fa-trash"></i>
                </a>  
                <a href="{{ route('role-delete', $rows->role_id ) }}" class="btn btn-info btn-xs  ">
                 <i class="fa fa-eye"></i>
                </a>  
            </td>
            <td>{{ $rows->role_id }}</td>
            <td>{{ $rows->role_name }}</td>
            <td>{{ $rows->role_type }}</td>
            <td>{{ $rows->created_at }}</td>
        </tr>
    </tbody>
     
@endforeach
</table>
</div>
</div>
</div>
<script>
    $(document).ready(function(){ 
     $('.add-role-form').hide();
     $(document).on('click','.add-new-btn', function(){
        $('.add-role-form').slideToggle();
     });

        $('#add-role').on('submit', function(e){ 

            e.preventDefault();

            var type = $(this).attr('method');
            var url = $(this).attr('action');
            var data = $(this).serialize();

            $.ajax({
                type: type,
                url : url,
                data: new FormData(this),
                dataType: 'JSON',
                contentType: false,
                cache: false,
                processData: false,

                success: function(response){
                    console.log(response.role);
                }
            });

        });

        $('#select-access').select2({ 

         placeholder: "Select a state",
    allowClear: true
        });
    });
</script>
@endsection