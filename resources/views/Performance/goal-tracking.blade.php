@extends('layout.app')
@section('heading')
Goal Tracking 
@endsection

@section('heading')
Goal Tracking 
@endsection

@section('page-label')
Goal Tracking 
@endsection

@section('page-body')
 
	<div class="border p-3 border bg-white mb-3">
		 
			<div class="d-flex justify-content-between">
				<h5>Add New Goal</h5>  
				<button class="btn btn-info btn-sm rounded-0 add-new-button">Add New</button>
			</div> 
	 	<div class="add-new-form">
	 		<div class="row">
	 			<div class="col">
	 				<div class="form-group">
                      <label for="company_name">Company</label>
                      <select class="form-control" name="company" placeholder="Company">
                        <option value="">Select One</option>
                        <option value="1"> SANTE WELLNESS PTE. LTD.</option>
                      </select>
                    </div>

                    <div class="form-group">
                      <label for="tracking_type">Goal Type</label>
                      <select class="form-control" name="tracking_type" data-plugin="select_hrm" data-placeholder="Goal Type">
                        <option value=""></option>
                        <option value="1">Invoice Goal</option>
                        <option value="4">Event Goal</option>
                      </select>
                    </div>
	 			</div>
	 			<div class="col">
	 				 <div class="form-group">
                      <label for="description">Description</label>
                      <textarea class="form-control" placeholder="Description" name="description" rows="5" id="description"></textarea>
                    </div>
	 			</div>
	 		</div> 
	 		<div class="row">
	 			<div class="col">
	 				<p>
	 					<label>Subject</label>
	 					<input type="text" name="" class="form-control" placeholder="Subject">
	 				</p>
	 			</div>
	 			<div class="col">
	 				<p>
	 					<label>Target Achievement</label>
	 					<input type="text" name="" class="form-control" placeholder="Target Achievement">
	 				</p>
	 			</div>
	 			<div class="col">
	 				<p>
	 					<label>Start Date</label>
	 					<input type="date" name="" class="form-control" placeholder=""> 
	 				</p>
	 			</div>
	 			<div class="col">
	 				<p>
	 					<label>End Date</label>
	 					<input type="date" name="" class="form-control" placeholder="Start Date">
	 				</p>
	 			</div>
	 		</div>
	 		<p class="text-right">
	 			<button class="btn btn-primary"> <i class="fa fa-check-square"></i> Save</button>
	 		</p>
	 	</div>
	</div>
 
 	<div class="border p-3 bg-white border">
 		<h4>List All Goal Tracking </h4>
 		<table class="table table-sm table-bordered" id="example3">
 			<thead>
 				<th>Action</th>
 				<th>Goal Type</th>
 				<th>Company</th>
 				<th>Target Achievement</th>
 				<th><i class="fa fa-calendar-alt mr-2"></i> Start Date</th>
 				<th><i class="fa fa-calendar-alt mr-2"></i> End Date</th>
 				<th>Progress</th>
 			</thead>
 			<tbody>
 				
 			</tbody>
 		</table>
 	</div>

 		<script type="text/javascript">
 		$(document).ready(function(){
 			 $('.add-new-form').hide();
 			$(document).on('click','.add-new-button', function(e){
 				 $('.add-new-form').slideToggle();
 			});
 		});
 	</script>

@endsection() 
