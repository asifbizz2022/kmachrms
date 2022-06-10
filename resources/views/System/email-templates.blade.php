@extends('layout.app')
@section('heading')
Email Templates 
@endsection

@section('heading')
Email Templates
@endsection

@section('page-label')
Email Templates 
@endsection

@section('page-body')
<div class="border p-3 bg-white">
	<h5> List All Email Templates 	</h5>
	<table class="border table table-sm " id="example3">
		<thead>
			<th>Action</th>
			<th>Status</th>
			<th>Template Name</th>
			<th>Subject</th>
		</thead>
		<tbody>
			<?php for($a=0; $a<=50; $a++) {?>
				<tr>
					<td><?= date('Y-m-d') ?></td>
					<td><?= date('Y-m-d') ?></td>
					<td><?= date('Y-m-d') ?></td>
					<td><?= date('Y-m-d') ?></td>
				</tr>
			<?php }?>
		</tbody>
	</table>
</div>
@endsection() 
