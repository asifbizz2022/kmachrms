@extends('layout.app')
@section('heading')
CPF Submittion 
@endsection

@section('heading')
CPF Submittion 
@endsection

@section('page-label')
CPF Submittion 
@endsection

@section('page-body')
<div class="border-top border-primary bg-white"  >
	<div class="p-3">
		<div class="d-flex justify-content-between">
			<h5>Generate CPF Submission File</h5> 
			<button class="btn btn-primary btn-sm add-new-btn">Add New</button>
		</div><br>
		<form class="add-new-form">
			<div class="row">
				<div class="col">
					<label>CPF Submission Number</label>
					<input type="text" class="form-control form-sm"></input>
				</div>
				<div class="col">
					<label>Select Month</label>
					<input type="date" class="form-control form-sm"></input>
				</div>
			</div>
			<br>
			<div class="justify-content-end">
				<button class="btn btn-primary"> <i class="fa fa-check-square"></i> Generate</button>
			</div>
		</form>
	</div>
</div>
<!-- table section -->
<br>
<div class="border bg-white ">
	<div class="p-3">
		<h5>List All CPF Submissions </h5>
		<br>
		<table class="table table-sm table-bordered" id="example3">
			<thead>
				<th>Action</th>
				<th>Month Year</th>
				<th>CSN</th>
				<th>No. of Employees</th>
				<th>No. of Records</th>
				<th>Total Number</th>
				<th>Date Created</th>
			</thead>
			<tbody>
				<?php for($a=0 ; $a<=50; $a++) {?>
					<tr>
						<td><?= date('Y-d-m') ?></td>
						<td><?= date('Y-d-m') ?></td>
						<td><?= date('Y-d-m') ?></td>
						<td><?= date('Y-d-m') ?></td>
						<td><?= date('Y-d-m') ?></td>
						<td><?= date('Y-d-m') ?></td>
						<td><?= date('Y-d-m') ?></td>
					</tr>
				<?php }?>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.add-new-form').hide();
		$(document).on('click', '.add-new-btn', function(){
			$('.add-new-form').slideToggle();
		});
	});
</script>
@endsection() 
