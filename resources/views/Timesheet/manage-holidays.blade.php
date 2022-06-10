@extends('layout.app')
@section('heading')
Manage Holidays
@endsection
@section('title')
Manage Holidays
@endsection
@section('page-label')
Manage Holidays
@endsection
@section('page-body')
<section>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h5>Add New Holiday</h5>
                </div>
                <div class="card-body">
                    <form action="">
                    <p>
                    <label for="">Company</label>
                    <select name="company" id="" class="form-control">
                        <option value="">Company</option>
                    </select>
                    </p>
                    <p>
                        <label for="">Event Name</label>
                        <input type="text" class="form-control" name="event-name" placeholder="Event Name">
                    </p>
                        <div class="row">
                            <div class="col-md-6">
                                <p>
                                    <label for="">Start Date</label>
                                    <input type="date" name="start-date" id="" class="form-control">
                                </p> 
                            </div>
                            <div class="col-md-6">
                            <p>
                                    <label for="">End Date</label>
                                    <input type="date" name="end-date" id=""  class="form-control">
                                </p>
                            </div>
                        </div>
                    <p>
                        <label for="">Description</label>
                        <textarea name="description" id="" cols="30" rows="3" class="form-control" placeholder="Description"></textarea>
                    </p>
                    <p>
                        <label for="">Status</label>
                        <select name="status" id="" class="form-control">
                            <option value=""></option>
                        </select>
                    </p> 
                    <p>
                    <button class="btn btn-sm btn-primary"><i class="fa fa-check-square mr-3 justify-content-right"></i>Save</button>
                    </p>
                </div>
               
                </form>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h5>List All Holidays</h5>
                </div>
                <div class="card-body">
                <table class="table table-sm border" id="example3">
                <thead>
                    <th>Action</th><th>Event Name</th>
                    <th><i class="fa fa fa-calendar-alt mr-3"></i>Start Date</th>
                    <th><i class="fa fa fa-calendar-alt mr-3"></i>Event Date</th>
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
