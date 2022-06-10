@extends('layout.app')
@section('heading')
Update Attendance
@endsection
@section('page-body')
<section>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <h5 class="p-4">
                    Update Attendance
                </h5>
                <div class="card-body">
                    <form action="">
                        <p>
                            <label for="">Date</label>
                            <input type="date" class="form-control" name="date">
                        </p>
                        <p>
                            <label for="">Company</label>
                            <select name="" id="" class="form-control" name="company">
                                <option value="">Company</option>
                            </select>
                        </p>
                        <p>
                            <label for="">Employee</label>
                            <select name="employee" id="" class="form-control">
                                <option value="">Choose an Employee</option>
                            </select>
                        </p>
                        <p>
                            <button class="btn btn-primary  "> <i class="fa fa-check-square mr-3"></i> Get</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card">
                 <h5 class="p-3">
                     Update Attendance
                 </h5>
                <div class="card-body">
                    <table id="example3" class="table table-sm">
                        <thead>
                            <th>Action</th><th>In Time</th><th>Out Time</th><th>Total Work</th>
                        </thead>
                        <tbody>
                             
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
