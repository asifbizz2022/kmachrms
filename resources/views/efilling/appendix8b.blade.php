@extends('layout.app')
@section('heading')
Appendix 8B 
@endsection

@section('heading')
Appendix 8B 
@endsection

@section('page-label')
Appendix 8B 
@endsection

@section('page-body')
<div class="row mb-3">
	<div class="col-md-4 col-sm-12 col-lg-4">
		<div class="border p-3 bg-white">
			<h5>IR8B YA (Year of Assessment)</h5><br>
			<form>
				<p>
					<label>Select Year</label>
					<select class="form-control form-sm">
						<option></option>
					</select>
				</p>
				<p>
					<button class="btn btn-primary">Generate IR8B for  <?= date('Y')?></button>
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
	<h5>List All Employee IR8b form for <?= date('Y')?></h5><br>
	<table class="table table-sm table-bordered" id="example3">
		<thead>
			<th>Action</th>
			<th>Amount</th>
			<th>Total Gross Amount of Gains (EEBR)</th>
			<th>Total Gross Amount of Gains (ESIR) SMEs</th>
			<th>Total Gross Amount of Gains (EEBR) CORPs</th> 
			<th>Total Gross Amount of Gains (EEBR) START-UPs</th>
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
