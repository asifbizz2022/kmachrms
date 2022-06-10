@extends('layout.app')
@section('heading')
Leave Status
@endsection

@section('title')
Leave Status
@endsection

@section('page-label')
Leave Status
@endsection
@section('page-body')
<section>
    <div class="row">
        <div class="col-md-4">
        <div class="card rounded-0">
            <h5 class="p-4">Report Filters</h5>
            <div class="card-body">
                <p>
                    <input type="date" class="form-control" name="date">
                </p>
                <p>
                    <input type="date" class="form-control" name="date">
                </p>
                <p>
                    <select class="form-control">
                        <option value="">Company</option>
                    </select>
                </p>
                <p>
                    <select class="form-control">
                        <option value="">Choose employee</option>
                    </select>
                </p>
                <p>
                    <button class="btn btn-primary  "> <i class="fa fa-check-box mr-1"></i>Get</button>
                </p>
            </div>
        </div>
        </div>
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="mb-3">
                        View Leave Reports
                    </h5>
                    <table class="border table table-sm" id="example3">
                        <thead>
                            <th>Company</th>
                            <th>Employee</th>
                            <th>Approved</th>
                            <th>Pending</th>
                            <th>Upcoming</th>
                            <th>Rejected</th>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
