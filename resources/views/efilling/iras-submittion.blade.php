@extends('layout.app')
@section('heading')
IRAS Submittion 
@endsection

@section('heading')
IRAS Submittion 
@endsection

@section('page-label')
IRAS Submittion 
@endsection

@section('page-body')

<div class="row">
	<div class="col-md-4 col-sm-12 col-lg-4">
		<div class="border p-3 bg-white">
			<h5>IRAS Submission YA (Year of Assessment)</h5><br>
			<form>
				<p>
					<label>Select Year</label>
					<select class="form-control form-sm">
						<option></option>
					</select>
				</p>
				<p>
					<button class="btn btn-info">Validate with IRAS</button>
					<button class="btn btn-primary">Submit To IRAS</button>
				</p>
			</form>
		</div>
	</div>
</div>
@endsection() 
