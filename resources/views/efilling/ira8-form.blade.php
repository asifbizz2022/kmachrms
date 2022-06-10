@extends('layout.app')
@section('heading')
IRA8 Form 
@endsection

@section('heading')
IRA8 Form 
@endsection

@section('page-label')
IRA8 Form 
@endsection

@section('page-body')
<div class="row mb-3">
	<div class="col-md-4 col-sm-12 col-lg-4">
		<div class="border p-3 bg-white">
			<h5>IR8A YA (Year of Assessment)</h5><br>
			<form>
				<p>
					<label>Select Year</label>
					<select class="form-control form-sm">
						<option></option>
					</select>
				</p>
				<p>
					<button class="btn btn-primary">Generate IR8A for 2022 </button>
				</p>
			</form>
		</div>
	</div>
	<div class="col-md-8 col-sm-12 col-lg-8">
		<div class="border p-3 bg-white">
			<h5>List All Employee Summary for 2022</h5><br>
			<table class="table table-sm table-bordered" id="example3">
			<thead>
				<th>Employee</th>
				<th>Citizenship</th>
				<th>Total Taxable Amount</th>
				<th>YTD Gross Salary</th>
				<th>YTD Bonous</th>
				<th>YTD CPF</th>
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
					</tr>
			<?php }?>
			</tbody>
		</table>
		</div>
	</div> 
</div>
<div class="border bg-white p-3">
	<h5>List All Employee IR8A form for <?= date('Y')?></h5><br>
	<table class="table table-sm table-bordered" id="example3">
		<thead>
			<th>Action</th>
			<th>Amount</th>
			<th>Gross Salary Amount</th>
			<th>Bonous Amount</th>
			<th>Director Fees</th>
			<th>Total(D1 to D9)</th>
			<th>CPF Amount(Employee)</th>
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
@endsection() 
