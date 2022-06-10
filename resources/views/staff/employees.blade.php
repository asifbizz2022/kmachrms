@extends('layout.app')
@section('title')
Employees
@endsection 

@section('heading')
Employees
@endsection 

@section('page-label')
Employees
@endsection 

@section('page-body')
<div class="row">
  <div class="col-12 col-sm-6 col-md-3">
    <div class="info-box">
      <span class="info-box-icon bg-info  "><i class="fas fa-users"></i></span> 
      <div class="info-box-content">
        <span class="info-box-text">Active</span>
        <span class="info-box-number">
          {{$counts}} 
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
  <div class="col-12 col-sm-6 col-md-3">
    <div class="info-box mb-3">
      <span class="info-box-icon bg-danger "><i class="fas fa-users"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Inactive</span>
        <span class="info-box-number">{{ $counts }}</span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->

  <!-- fix for small devices only -->
  <div class="clearfix hidden-md-up"></div>

  <div class="col-12 col-sm-6 col-md-3">
    <div class="info-box mb-3">
      <span class="info-box-icon bg-success  "><i class="fas fa-users"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Male</span>
        <span class="info-box-number">{{$male}}</span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
  <div class="col-12 col-sm-6 col-md-3">
    <div class="info-box mb-3">
      <span class="info-box-icon bg-warning  "><i class="fas fa-users"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Female</span>
        <span class="info-box-number">{{$female}}</span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
          <!-- /.col -->
</div>
<div class="text-right my-3">
    <button class="btn btn-md btn-info add-new-btn">
        <i class="fa fa-plus mr-1"></i>
    Add New</button>
</div>
<div class="card add-emp-form">
    <div class="card-header">
       <div class="d-flex  d-flex justify-content-between">
        <h5>Add New Employee</h5>
       <!--  <button class="btn btn-sm btn-info add-new-btn">Add New</button> -->
        </div>
    </div>
    <div class="card-body ">
         <form action="{{ route('employee-add') }}" method="post" id="add-emp-form">
                @csrf
                <div class="row mt-3">
                    <div class="col-md-3">
                        <label>First Name</label>
                        <input type="text" name="first-name" class="form form-control form-sm" placeholder="First Name"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Last Name</label>
                        <input type="text" name="last-name" class="form form-control form-sm" placeholder="Last Name"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Employee Id</label>
                        <input type="text" name="employee-id" class="form form-control form-sm" placeholder="Employee Id"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Date of Joining</label>
                        <input type="date" name="date-of-joining" class="form form-control form-sm" placeholder="Date of Joining"></input>   
                    </div>
                </div>
                
                 <div class="row mt-3">
                    <div class="col-md-3">
                        <label>Company</label>
                        <input type="text" name="company" class="form form-control form-sm" placeholder="Company"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Location</label>
                        <input type="text" name="location" class="form form-control form-sm" placeholder="Location"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Main Department</label>
                        <input type="text" name="department" class="form form-control form-sm" placeholder="Department"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Designation</label>
                        <input type="text" name="designation" class="form form-control form-sm" placeholder="Designation"></input>   
                    </div>
                </div>
                
                <div class="row mt-3">
                    <div class="col-md-3">
                        <label>Username</label>
                        <input type="text" name="username" class="form form-control form-sm" placeholder="User Name"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Email</label>
                        <input type="text" name="email" class="form form-control form-sm" placeholder="Email"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Gender</label>
                        <input type="text" name="gender" class="form form-control form-sm" placeholder="Gnder"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Office Shift</label>
                        <input type="text" name="office-shift" class="form form-control form-sm" placeholder="Office Shift"></input>   
                    </div>
                </div>
                
                 <div class="row mt-3">
                    <div class="col-md-3">
                        <label>Date of Birth</label>
                        <input type="text" name="date-of-birth" class="form form-control form-sm" placeholder="Date of Birth"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Contact Number</label>
                        <input type="text" name="contact-number" class="form form-control form-sm" placeholder="Contact Number"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Password</label>
                        <input type="text" name="password" class="form form-control form-sm" placeholder="Password"></input>   
                    </div>
                     <div class="col-md-3">
                         <label>Confirm Password</label>
                        <input type="text" name="confirm-password" class="form form-control form-sm" placeholder="Confirm Password"></input>   
                    </div>
                </div>
                
                 <div class="row mt-3">
                    <div class="col-md-3">
                        <label>Role</label>
                        <input type="text" name="role" class="form form-control form-sm" placeholder="Role"></input>   
                    </div>
                     <div class="col-md-3">
                        <label>Reports To</label>
                          
                        <select name="reports-to" class="form form-control">
                            @foreach($result as $row)
                            <option value="{{ $row->first_name.' '.$row->last_name }}">
                                {{ $row->first_name.' '.$row->last_name }}
                            </option>
                            @endforeach
                        </select>
                    </div>
                     <div class="col-md-6">
                         <label>Leave Categorey</label>
                        <input type="text" name="leave-categorey" class="form form-control form-sm" placeholder="leave-categorey"></input>   
                    </div>
                      
                </div>
                
                <div class="row mt-3">
                    <div class="col-md-12">
                        <label>Address</label>
                        <input type="text" name="address" class="form form-control form-sm" placeholder="Address"></input>   
                    </div>
                    
                </div>
                <div class="mt-3 text-right">
                    <button type="submit" class="btn btn-primary" value="Add">
                        <i class="fa fa-check-square mr-1"></i>Add Employee</button>
                </div>
                </form>
    </div>
</div>
 
<div class="card">
    <div class="card-header "> 
        <div class="d-flex justify-content-between">
        <h5>List All Employee</h5>
        <div>
        <button class="btn btn-sm btn-info"><i class="fa fa-filter mr-1"></i>Filter</button>
          
          <button class="btn btn-sm btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-chart-bar mr-1"></i>
            Report
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="#">Employment</a>
            <a class="dropdown-item" href="#">Report</a> 
          </div>
       
        </div>
        </div>
    </div>
    <div class="card-body">
        <table id="example1" class="table table-sm table-bordered table-striped">
        <thead> 
            <th>Action</th>
            <th>Name</th>
            <th>Company</th>
            <th>Contact</th>
            <th>Reports To</th>
            <th>Role</th> 
        </thead> 
        <tbody>
        @foreach($result as $rows)  
        <tr>
            <td>  
                <a href="{{ route('employee-edit', $rows->user_id ) }}" class="btn btn-primary btn-xs  "  >
                    <i class="fa fa-edit"></i>
                </a> 
                <a href="{{  route('employee-delete', $rows->user_id ) }}" class="btn btn-danger btn-xs ">
                 <i class="fa fa-trash"></i>
                </a>  
                <a href="{{ route('role-delete', $rows->role_id ) }}" class="btn btn-info btn-xs  ">
                 <i class="fa fa-eye"></i>
                </a>  
            </td>
            <td>
                <p>
                {{ $rows->first_name.' '.$rows->last_name }}
                </p>
            </td>
            <td>
                
                Location: {{ $rows->company_id }} 
                <br>
                Department: {{ $rows->department_name }} 
                <br>
                Designation: {{ $rows->designation_name }} 
                
            </td>
            <td>
                {{ $rows->first_name }} 
                <br>
                {{ $rows->email }} 
                <br>
                {{ $rows->contact_no }} 

            </td>
            <td>
              {{ $rows->reports_to }}    
            </td>
            <td>
                 {{ $rows->role_name }} 
            </td>
        </tr> 
        @endforeach
        </tbody>
    </table>  
    </div>
</div>
<script>
   $(document).ready(function(){
      $('.add-emp-form').hide();
       $(document).on('click', '.add-new-btn', function(){
       $('.add-emp-form').slideToggle();
       });
   }); 
</script>
@endsection

