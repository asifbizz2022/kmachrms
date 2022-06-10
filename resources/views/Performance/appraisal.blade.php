@extends('layout.app')
@section('heading')
Appraisal 
@endsection

@section('heading')
Appraisal
@endsection

@section('page-label')
Appraisal
@endsection

@section('page-body')

	<div class="border p-3 bg-white mb-3">
		 
		<div class="d-flex justify-content-between">
				<h5>Give Performance Appraisal</h5><br>
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
						Employee
					</label>
				</div>
				<div class="col-md-5 col-sm-5 col-md-lg-5 text-le">
					<select class="form-control form-sm">
						<option>Employee</option>
					</select>
				</div>
			</div><br>
			<div class="row">
				<div class="col-md-3 col-sm-3 col-md-lg-3 text-right">
					<label>
						Select Month
					</label>
				</div>
				<div class="col-md-5 col-sm-5 col-md-lg-5 text-le">
					<input type="date" name="" class="form-control form-sm">
				</div>
			</div>
			</div>

			<table class="table table-sm border">
				<thead>
					<th>Indicator</th>
					<th>Set Value</th>
					<th>Indicator</th>
					<th>Set Value</th>
				</thead>
				<tbody>
					<tr>
						<td>
							Customer Experience
						</td>
						<td>
 
							<select class="form-control">
								<option>None</option>
								<option>Beginner</option>
								<option>Intermediate</option>
								<option>Advanced</option>
								<option>Expert / Later</option>
							</select>
						</td>
						<td>
							Marketting
						</td>
						<td>
							 
							<select class="form-control">
								<option>None</option>
								<option>Beginner</option>
								<option>Intermediate</option>
								<option>Advanced</option>
								<option>Expert / Later</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							Administration
						</td>
						<td>
 
							<select class="form-control">
								<option>None</option>
								<option>Beginner</option>
								<option>Intermediate</option>
								<option>Advanced</option>
								<option>Expert / Later</option>
							</select>
						</td>
						<td>
							Professionalism
						</td>
						<td>
 
							<select class="form-control">
								<option>None</option>
								<option>Beginner</option>
								<option>Intermediate</option>
								<option>Advanced</option>
								<option>Expert / Later</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							Integrity
						</td>
						<td>
							 
							<select class="form-control">
								<option>None</option>
								<option>Beginner</option>
								<option>Intermediate</option>
								<option>Advanced</option>
								<option>Expert / Later</option>
							</select>
						</td>
						<td>
							Attendance
						</td>
						<td>
							 
							<select class="form-control">
								<option>None</option>
								<option>Beginner</option>
								<option>Intermediate</option>
								<option>Advanced</option>
								<option>Expert / Later</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>

			  <div class=" pad">
              <div class="mb-3">
                <textarea class="textarea" placeholder="Place some text here"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
              </div>
               
            </div>
	 	</div>
	</div>
 
 	<div class="border p-3 bg-white  ">
 		<h4>List All Performance Appraisals  </h4><br>
 		<table class="table table-sm table-bordered" id="example3">
 			<thead>
 				<th>Action</th>
 				<th>Company</th>
 				<th><i class="fa fa-user"></i>Employee</th>
 				<th>Department</th>
 				<th>Designation</th>
 				<th><i class="fa fa-calendar-alt mr-2"></i> Appraisal Date</th> 
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
