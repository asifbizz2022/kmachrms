@extends('layout.app')
@section('heading')
Goal Type 
@endsection

@section('heading')
Goal Type 
@endsection

@section('page-label')
Goal Type 
@endsection

@section('page-body')
<div class="row">
	<div class="col-md-4 col-sm-12 col-lg-4">
		
		<div class="border p-3 bg-white">
			<h5>Add New Type</h5><br>
			<form>
				<p>
					<label>Goal Type</label>
					<input type="text" name="goal-type" placeholder="Goal Type"  class="form-control">
				</p>
				<p class="text-right">
					<button class="btn btn-primary"> <i class="fa fa-check mr-3"></i> Save</button>
				</p>
			</form>
		</div>
	</div>
	<div class="col-md-8 col-sm-12 col-lg-8">
		<div class="border p-3 bg-white">
			<h5>List All Goal Types</h5><br>
			<table class="table table-sm table-bordered " id="example3">
				<thead>
					<th>Action</th><th>Type</th>
				</thead>
				<tbody>
					<?php for($a=0 ; $a<=50; $a++) {?>
					<tr>
						<td><?= date('m-d-Y') ?></td>
						<td><?= date('m-d-Y') ?></td>
					</tr>
					<?php }?>
				</tbody>
			</table>
		</div>
	</div>
</div>

	 
@endsection() 
