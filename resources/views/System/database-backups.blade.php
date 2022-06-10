@extends('layout.app')
@section('heading')
Database Backups 
@endsection

@section('heading')
Database Backups
@endsection

@section('page-label')
Database Backups 
@endsection

@section('page-body')
<div class=" mb-3">
	<a href="#" class="btn btn-info btn-lg rounded-0">Delete Old Backups</a>
	<a href="#" class="btn btn-info btn-lg rounded-0">Create Backups</a>
</div>
<div class="border p-3 bg-white"> 
	<h5> Add New Backup Log</h5> 
	<table class="border table table-sm " id="example3">
		<thead>
			<th>Action</th> 
			<th>Database Name</th>
			<th>Date</th>
		</thead>
		<tbody>
			<?php for($a=0; $a<=50; $a++) {?>
				<tr>
					<td><?= date('Y-m-d') ?></td>
					<td><?= date('Y-m-d') ?></td> 
					<td><?= date('Y-m-d') ?></td>
				</tr>
			<?php }?>
		</tbody>
	</table>
</div>
@endsection() 
