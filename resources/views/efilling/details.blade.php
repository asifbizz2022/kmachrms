@extends('layout.app')
@section('heading')
Details 
@endsection

@section('title')
Details 
@endsection

@section('page-label')
Details 
@endsection

@section('page-body')
<div class="border bg-white">
	<h5 class="p-3">E Filing Details </h5> 
	<div class="p-3">
		<form>
			<p>
				<label>CPF Submission Number (CSN)</label>
				<input type="text" name="cpf-submittion-number" class="form-control form-sm" placeholder="CPF Submission Number (CSN)">
			</p>
			<div class="row">
				<div class="col">
					<label>Organization ID Type</label>
					<select class="form-control form-sm">
						<option></option>
					</select>
				</div>
				<div class="col">
					<label>Organization ID No</label>
					<input type="text" name="" class="form-control form-sm">
				</div> 
			</div>
			<div class="row">
				<div class="col">
					<label>Authorised Person Name*</label>
					<input type="" name="" class="form-control form-sm">
				</div>
				<div class="col">
					<label>
						Authorised Person Designation
					</label>
					<input class="form-control form-sm"></input>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label>
						Authorised Person ID Type
					</label>
					<select class="form-control form-sm">
						<option>
							1
						</option>
					</select>
				</div>
				<div class="col">
					<label>
						Authorised Person ID No*
					</label>
					<input type="" name="" class="form-control form-sm">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label>
						Authorised Person Email*
					</label> 
				</div>
				<div class="col">
					<label>
						Authorised Person Telephone Number*
					</label> 
				</div>
			</div>
			<p class="text-right">
				<button class="btn btn-primary"> 
					<i class="fa fa-check-square"></i> 
				Save
				</button>
			</p>
		</form>
	</div>
</div>
@endsection() 
