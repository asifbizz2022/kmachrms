@extends('layout.app')
@section('heading')
Overtime Request
@endsection

@section('title')
Overtime Request
@endsection

@section('page-label')
Overtime Request
@endsection

@section('page-body')
<section>
    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between">
                <h5>Overtime Reqeust</h5>
            <button class="btn btn-info btn-sm" >Add New</button>
            </div>
        </div>
        <div class="card-body">
        <div class="row">
        <div class="col">
            <table id="example3" class="table table-sm border">
                <thead>
                    <th>Action</th>
                    <th>Employee</th>
                    <th>Date</th>
                    <th>In Time</th>
                    <th>Out Time</th>
                    <th>Total Hours</th>
                    <th>Status</th>
                </thead>
            </table>
        </div>
    </div>
        </div>
    </div>
</section>
@endsection
