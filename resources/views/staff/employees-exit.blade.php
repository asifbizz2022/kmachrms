@extends('layout.app')
@section('heading')
Employee Exit
@endsection

@section('page-label')
Employee Exit
@endsection

@section('page-title')
Employee Exit
@endsection
@section('page-body')
 
<!-- add new form card --> 
<div class="card">
    <div class="card-header" id="emp-exit-form">
      <div class="d-flex justify-content-between">
          <h5 class="  ">Add New Employee</h5> 
        <button class="btn btn-primary btn-sm add-new-btn"> Add new</button>
      </div>
    </div>
<div class="card-body p-3" id="exit-add-form"> 
    @foreach($result as $rows) 
    {{ $rows->type }}
    @endforeach
    <!-- add new form -->  
    <div  class="justify-content-between mt-3" > 
        <form method="post" action="{{ route('emp-exit-add') }}">
            @csrf 
            <div class="row">
                <div class="col-md-6">
                    <p>
                    <label>Company</label>
                    <select class='form-control' name="company">
                        @foreach($result as $rows)
                         <option value="{{ $rows->company_id }}">{{ $rows->name }}</option>
                        @endforeach
                    </select>
                    </p> 
                    <p>
                    <label>Employee To Exit</label>
                   <select class='form-control' name="employee">
                        @foreach($employee as $employee)
                         <option value="{{ $employee->user_id }}">{{ $employee->first_name }}{{ $employee->last_name}}</option>
                        @endforeach
                    </select>
                    </p>
                </div>
                <div class="col-md-6">
                    <label>Description</label>
                    <textarea rows="5" col="30" name="description" class="form form-control" placeholder='Description'></textarea>
                </div>
            </div> 
            <div class="row"> 
                <div class="col-md-3">
                    <label>Exit Date</label>
                    <input type="date" name="exit-date" class="form form-control form-sm">
                </div>
                <div class="col-md-3">
                    <label>Type of Exit</label>
                    <select name="type-of-exit" class="form form-control">
                        @foreach($result as $rows)
                         <option value="{{ $rows->exit_type_id }}">{{ $rows->type }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-3">
                    <label>Exit Interview</label>
                    <select name="exit-interview" class="form form-control">
                        <option value="1">
                        Yes
                        </option>
                        <option value="0">
                        No
                        </option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label>Disable Account</label>
                    <select name="disable-account" class="form form-control">
                        <option value="1">
                        Yes
                        </option>
                        <option value="0">
                        No
                        </option>
                    </select>
                </div>
            </div> 
            <div class='mt-3'>
                <button type='submit' class="btn btn-primary float-right"><i class="fa fa-check-square mr-3"></i>Save</button>
            </div>
        </form>
    </div>
</div>
</div> 
 
<section class="filter-form">
   <div class="border p-3 bg-white">
    <div class="d-flex justify-content-between">
        <h5>Filter</h5>
        <button class="btn btn-sm btn-info hide"><i class="fa fa-minus mr-1"></i>
            Hide
        </button>
    </div>
        <div class="row">
            <div class="col">
                <p>
                    <label>Company</label>
                    <select class="form-control">
                        <option></option>
                    </select>
                </p>
            </div>
            <div class="col">
                <p>
                    <label>Employee</label>
                    <select class="form-control">
                        <option></option>
                    </select>
                </p>
            </div>
            <div class="col">
                <p>
                    <label>Exit Interview</label>
                    <select class="form-control">
                        <option></option>
                    </select>
                </p>
            </div>

        </div>
        <div class="d-flex flex-row-reverse">
                <button class="btn btn-primary btn-sm"><i class="fa fa-check-square"></i>
                    Get
                </button>
        </div>
   </div>
</section>
<!-- Button trigger modal -->
 

<!-- Modal -->
 
<div class="card mb-4">
    <div class="card-header py-3">
        <span>
             <strong class="m-0 font-weight-bold text-primary" >List Of All Employee Exit</strong>
        </span> 
        <button class='btn btn-primary btn-sm float-right filter-btn' id="employee-exit-filter">
            <i class="fa fa-filter"></i>
            Filter
        </button>
    </div>
    <div class="card-body">
<div class="table-responsive">
<table class="table table-bordered table-sm" id="example1" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>Action</th>
            <th>Employee</th>
            <th>Company</th>
            <th>Exit Type</th>
            <th>Exit Date</th>
            <th>Exit Interview</th> 
        </tr>
    </thead> 
    @foreach($result as $rows)
     
    <tbody> 
        <tr>
            <td class=" ">
                <a href="{{ route('emp-exit-edit', $rows->exit_id) }}" class="btn btn-sm btn-primary" >
                    <i class="fa fa-edit"></i>
                </a>
               
                <a href="{{ route('emp-exit-delete', $rows->exit_id) }}" class="btn btn-sm btn-danger">
                    <i class="fa fa-trash"></i>
                </a>
            </td>
            <td>{{ $rows->employee_id }}</td>
            <td>{{ $rows->company_id }}</td>
            <td>{{ $rows->exit_type_id }}</td>
            <td>{{ $rows->exit_date }}</td>
            <td>
                @if( $rows->exit_interview == 0)
                  <span>No</span>
                @endif

                @if( $rows->exit_interview == 1)
                  <span>Yes</span>
                @endif
            </td> 
        </tr>
         
    </tbody> 
    @endforeach
</table>
</div>
</div>
</div>
<script>
$(document).ready(function(){
    $('#exit-add-form').hide();
        $('.filter-form').hide();

    $(document).on('click','.add-new-btn', function(){
        $('#exit-add-form').slideToggle();
    });
    $(document).on('click','.hide',function(){
        $('.filter-form').slideUp();
    });
    $(document).on('click','.filter-btn', function(){
       $('.filter-form').slideToggle();
    });
}); 
 
</script>
@endsection