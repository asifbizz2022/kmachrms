@extends('layout.app')
@section('heading')
Appendix 8A 
@endsection

@section('heading')
Appendix 8A 
@endsection

@section('page-label')
Appendix 8A 
@endsection

@section('page-body')
<div class="row mb-3">
	<div class="col-md-4 col-sm-12 col-lg-4">
		<div class="border p-3 bg-white">
			<h5>Appendix 8A YA (Year of Assessment)</h5><br>
			<form>
				<p>
					<label>Select Year</label>
					<select class="form-control form-sm">
						<option></option>
					</select>
				</p>
				<p>
					<button class="btn btn-primary">Generate IR8A for <?= date('Y') ?> </button>
				</p>
			</form>
		</div>
	</div>
	<div class="col-md-8 col-sm-12 col-lg-8">
		<div class="border p-3 bg-white">
			<h5>List All Employee Summary for <?= date('Y') ?></h5><br>
			<table class="table table-sm table-bordered" id="example3">
			<thead>
				<th>Employee</th>
				<th>Citizenship</th>
				<th>Total Taxable Amount</th> 
				<th>IR8A D9</th>
				<th>Eligible</th>
			</thead>
			<tbody>
				<?php for($a=0 ; $a<=50; $a++) {?>
					<tr>
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
			<th>Accomodation</th>
			<th>Utilities and HouseKeeping</th>
			<th>Hostel Accomodation</th> 
			<th>Others</th>
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

 
 
@endsection() 
