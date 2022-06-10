@extends('layout.app')
@section('heading')
Edit Employee Exit
@endsection

@section('page-label')
Edit Employee Exit
@endsection

@section('page-title')
Edit Employee Exit
@endsection
@section('page-body')


<div class="border p-4 bg-white w-75">
@foreach($result as $row)
	<form method="post" action="{{ route('emp-exit-update') }}">
		@csrf
		<input type="hidden" name="emp-id" value="{{$row->user_id}}">
		<p>
			<label>Employee</label>
			<div class="row">
				<div class="col">
					<input type="text" value="{{$row->first_name}}" class="form-control form-sm">
				</div>
				<div class="col">
					<input type="text"  value="{{$row->last_name}}" class="form-control form-sm">
				</div>
			</div> 
		</p>
		<p>
			<label>Company</label>
			<input type="hidden" name="company-id" value="{{$row->company_id}}">
			<input type="text"  value="{{$row->trading_name}}" class="form-control form-sm">
		</p>
		<p>
			<label>Exit Type</label>
			<input type="hidden" name="exit-type-id">
			<input type="text" value="{{$row->type}}" class="form-control form-sm">
		</p>
		<p>
			<label>Exit Date</label>
			<input type="text" value="{{$row->exit_date}}" class="form-control form-sm">
		</p>
		<p>
			<label>Exit Interview</label>
			<input type="text" name="exit-interview"  value="{{$row->exit_interview}}" class="form-control form-sm">
		</p>
		<p>
			<label>Exit Interview</label>
			<input type="text"   value="{{$row->exit_interview}}" class="form-control form-sm">
		</p>
		<p>
			<button class="btn btn-primary"><i class="fa fa-check-square mr-1"></i>Save</button>
		</p>
	</form>
@endforeach
</div>
@endsection