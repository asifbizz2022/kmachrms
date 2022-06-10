@extends('layout.app')
@section('heading')
Indicator 
@endsection

@section('heading')
Indicator 
@endsection

@section('page-label')
Indicator
@endsection

@section('page-body')
<div class="border p-3 bg-white mb-3"> 
	<div class="d-flex justify-content-between">
		<h5>Set New Indicator</h5><br>
		<button class="btn btn-info btn-sm rounded-0 add-new-button">Add New</button>
	</div> 
	<div class="add-new-form">  
	<div class=" p-5 text-center">
	<div class="row">
		<div class="col-md-3 col-sm-3 col-md-lg-3 text-right">
			<label>
			Company
			</label> 
		 
		</div>
		<div class="col-md-5 col-sm-5 col-md-lg-5 text-left">
			<select class="form-control form-sm">
				<option>Company</option>
			</select>
		</div> 
	</div> <br>
	<div class="row">
		<div class="col-md-3 col-sm-3 col-md-lg-3 text-right">
			<label>
				Desination
			</label>
		</div>
		<div class="col-md-5 col-sm-5 col-md-lg-5 text-le">
			<select class="form-control form-sm">
				<option>Designation</option>
			</select>
		</div>
	</div>
	</div>
	<div class="row">
		<div class="col">
			<h5><u>Technical Competencies</u></h5><br>
			<div class="row">
				<div class="col">
					<p>
						<label>Customer Experience</label>
						<select class="form-control">
							<option>None</option>
							<option>Beginner</option>
							<option>Intermediate</option>
							<option>Advanced</option>
							<option>Expert / Later</option>
						</select>
					</p>
					<p>
						<label>Marketting</label>
						<select class="form-control">
							<option>None</option>
							<option>Beginner</option>
							<option>Intermediate</option>
							<option>Advanced</option>
							<option>Expert / Later</option>
						</select>
					</p>
					<p>
						<label>Administration</label>
						<select class="form-control">
							<option>None</option>
							<option>Beginner</option>
							<option>Intermediate</option>
							<option>Advanced</option>
							<option>Expert / Later</option>
						</select>
					</p>
				</div>
			</div>
		</div>
		<div class="col">
			<h5><u>Organizational Competencies</u></h5><br>
				<div class="row">
				<div class="col">
					<p>
						<label>Professionalism</label>
						<select class="form-control">
							<option>None</option>
							<option>Beginner</option>
							<option>Intermediate</option>
							<option>Advanced</option>
							<option>Expert / Later</option>
						</select>
					</p>
					<p>
						<label>Integrity</label>
						<select class="form-control">
							<option>None</option>
							<option>Beginner</option>
							<option>Intermediate</option>
							<option>Advanced</option>
							<option>Expert / Later</option>
						</select>
					</p>
					<p>
						<label>Attendance</label>
						<select class="form-control">
							<option>None</option>
							<option>Beginner</option>
							<option>Intermediate</option>
							<option>Advanced</option>
							<option>Expert / Later</option>
						</select>
					</p>
				</div>
			</div>
		</div>
	</div>
	<p class="text-right">
		<button class="btn btn-outline-primary"> <i class="fa fa-check-square"></i> Save </button>
	</p>
	</div> 

</div>
 
<div class="border p-3 bg-white  ">
	<h4>List All Performance Indicators   </h4><br>
	<table class="table table-sm table-bordered" id="example3">
		<thead>
			<th>Action</th>	
			<th>Designation</th>
			<th>Company</th>
			<th>Department</th>
			<th><i class="fa fa-user"></i>Added By</th> 
			<th><i class="fa fa-calendar-alt mr-2"></i> Created At</th> 
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
