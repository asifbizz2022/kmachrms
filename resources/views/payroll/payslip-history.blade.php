@extends('layout.app')
@section('heading')
Payslip History 
@endsection

@section('heading')
Payslip History 
@endsection

@section('page-label')
Payslip History
@endsection

@section('page-body')

<div class="card">
	<div class="card-body">
		<h5>
			List All Payroll
		</h5>
		<br>
		<table class="table table-sm border" id='example3'>
			<thead>
				<th>Action</th>
				<th><i class="fa fa-user"></i>Employee Name</th>
				<th>Company</th>
				<th>Net Payable</th>
				<th>Salary Month</th>
				<th><i class="fa fa-calendar-alt"></i>Payroll Date</th>
			</thead>
			<tbody>
				
				<?php for($a=0; $a<=50; $a++) {?>
					<tr>
						<td><?= time(); ?></td>
						<td><?= time(); ?></td>
						<td><?= time(); ?></td>
						<td><?= time(); ?></td>
						<td><?= time(); ?></td>
						<td><?= time(); ?></td>
					</tr>	 
				<?php }?>
			
			</tbody>
		</table>
	</div>
</div>
@endsection