@extends('layout.app')
@section('heading')
Manage Leaves
@endsection

@section('title')
Manage Leaves
@endsection

@section('page-label')
Manage Leaves
@endsection
@section('page-body')
<section> 
    <div class="card">
    <div class="card-header" id="emp-exit-form">
      
      <div class="d-flex justify-content-between">
        <h5 >Add Leave</h5> 
        <button type="button" class="btn btn-info btn-sm add-new-button">
          
          Add New
        </button>
      </div>
    </div> 
        <div class="card-body add-form">
            <form>
            <div class=" ">
                <div class="row">
                <div class="col-md-6">
                    <div class="row">
                    <div class="col-md-6"> 
                        <div class="form-group">
                        <label for="first_name">Company</label>
                        <select class="form-control" name="company_id" id="aj_company" data-plugin="select_hrm" data-placeholder="Company">
                            <option value=""></option>
                                                    <option value="1">Shinko Crane</option>
                                                </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" id="employee_ajax">
                        <label for="employees" class="control-label">Employee</label>
                        <select   class="form-control" name="employee_id"  data-plugin="select_hrm" data-placeholder="Choose an Employee">
                            <option value=""></option>
                        </select>
                        </div>
                    </div>
                    </div>
                                    <div class="form-group" id="get_leave_types">
                    <label for="leave_type" class="control-label">Leave Type</label>
                    <select class="form-control" id="leave_type" name="leave_type" data-plugin="select_hrm" data-placeholder="Leave Type">
                        <option value=""></option>
                                        </select>
                    </div>
                    <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                        <label for="start_date">Start Date</label>
                        <input type="date" class="form-control  " placeholder="Start Date"   name="start_date" type="text" value="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                        <label for="end_date">End Date</label>
                        <input type="date" class="form-control  " placeholder="End Date"   name="end_date" type="text" value="">
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    <label for="description">Remarks</label>
                    <textarea class="form-control " placeholder="Remarks" name="remarks" rows="5"></textarea>
                    </div>
                    <div class="form-group">
                    <label>
                    <input type="checkbox" class="minimal" value="1" id="leave_half_day" name="leave_half_day">
                    Half Day</span> </label>
                    </div>
                </div>
                </div>
                <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                    <fieldset class="form-group">
                        <label for="attachment">Attachment</label>
                        <input type="file" class="form-control" id="attachment" name="attachment">
                        <small>Upload files only: pdf,gif,png,jpg,jpeg</small>
                    </fieldset>
                    </div>
                </div>
                </div>
                <div class="form-group">
                <label for="summary">Leave Reason</label>
                <textarea class="form-control" placeholder="Leave Reason" name="reason" cols="30" rows="3" id="reason"></textarea>
                </div>
                <div class="form-actions box-footer text-right">
                <button type="submit" class="btn btn-primary"> <i class="fa fa-check-square mr-1"></i> Save 
                </button>
                </div>
            </div>
            </div>
        </div>
    
    <div class="card">
        <div class="card-body"> 
             <h5 class="mb-3">List All Leaves</h5>
        <table class="table table-sm" id="example3">
          
            <thead>
                <th>Action</th>
                <th>Leave Type</th>
                <th>Department</th>
                <th>Employee</th>
                <th><i class="fa fa-calendar-alt mr-3"></i> Request Duration</th>
                <th> <i class="fa fa-calendar-alt mr-3"></i> Applied On</th>
            </thead>
        </table>
        </div> 
    </div>
</section>
<script type="text/javascript">
    $(document).ready(function(){
        $('.add-form').hide();
        $(document).on('click','.add-new-button', function(){
           $('.add-form').slideToggle();
        });
});
</script>
@endsection
