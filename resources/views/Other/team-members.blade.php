@extends('layout.app')
@section('heading')
Team Members
@endsection 
@section('heading')
Team Members
@endsection 
@section('page-label')
Team Members
@endsection 
@section('page-body')

<style type="text/css">
	.card{
			border-top: 5px solid blue;
	}
</style>

<div class="d-flex flex-row-reverse bd-highlight my-3">
  <div class="">
  	<button class="btn btn-danger btn-lg" data-toggle="modal" data-target="#exampleModal">
  		<i class="fa fa-plus-circle"></i>
  	 </button>
  </div> 
</div> 
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
  <form id="form">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-primary " id="exampleModalLabel">Create A New User</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body"> 
       	<p>
       		<label>First Name</label>
       		<input type="text" name="first-name" placeholder="First Name" class="form-control">
       	</p>
       	<p>
       		<label>Last Name</label>
       		<input type="text" name="last-name" placeholder="Last Name" class="form-control">
       	</p>
       	<p>
       		<label>Email Address</label>
       		<input type="text" name="email-address" placeholder="Email Address" class="form-control">
       	</p>
       	<p>
       		<label>Role</label>
       		<select class="form-control" name='roles'>
       			@foreach($roles as $r)
       			<option value="{{$r->role_name}}">{{ $r->role_name }}</option>
       			@endforeach
       		</select>
       	</p> 
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-danger">Submit</button>
      </div>
    </div> 
	</form>
  </div>
</div>
<!--modal ends-->
<div class="card">
	<div class="card-body">
		<table class="table table-sm" id="example3">
			<thead class="text-primary">
				<th>First Name</th>
				<th>Position</th>
				<th>Role</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Last Seen</th>
				<th>Action</th>
			</thead>
			<tbody>
				<?php for($a = 0 ; $a<=50 ; $a++) {?>
					<tr>
						<td><?= date('m-d-y'); ?></td>
						<td><?= date('m-d-y'); ?></td>
						<td><?= date('m-d-y'); ?></td>
						<td><?= date('m-d-y'); ?></td>
						<td><?= date('m-d-y'); ?></td>
						<td><?= date('m-d-y'); ?></td>
						<td><?= date('m-d-y'); ?></td>
					</tr>
				<?php }?>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$.ajaxSetup({
	   		headers: {
	     		'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	   		}
		});

		$('#form').on('submit', function(){
			alert($(this).serialize());
		});
	});
	
</script>
@endsection() 
