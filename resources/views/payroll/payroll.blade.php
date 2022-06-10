@extends('layout.app')
@section('heading')
Payroll 
@endsection

@section('heading')
Payroll 
@endsection

@section('page-label')
Payroll
@endsection

@section('page-body')
<div class="row">
    <div class="col-md-5 col-sm-auto">
        <div class="card"> 
            <div class="card-body">
                <h5 class="mb-3">Generate Payslip</h5>
                <div class="row">
                <div class="col-md-4">
                    <label>Company</label>
                    <select name="company" class="form form-control">
                        <option>All Companies</option>
                        <option>SGM</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label>Employee</label>
                    <select name="employee" class="form form-control">
                        <option>All Companies</option>
                        <option>SGM</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label>Select Month</label>
                    <input type="date" name="month" class="form form-control">
                </div> 
            </div>
            <div class="float-right mt-3">
                <button class="btn btn-primary">
                    <i class="fa fa-check"></i>
                    Search
                </button>
            </div>
        </div>
        </div>
    </div>
    <div class="col-md-7 col-sm-auto">
           <div class="card"> 
            <div class="card-body">
                <h5 class="mb-3">Bulk Payment</h5>
                <div class="row">
                <div class="col">
                    <label>Company</label>
                    <select class="form form-control">
                        <option>Company</option>
                        <option>All</option>
                    </select>
                </div>
                <div class="col">
                    <label>Location</label>
                    <select class="form form-control">
                        <option>Location</option>
                        <option>All</option>
                    </select>
                </div>
                <div class="col">
                    <label>Department</label>
                    <select class="form form-control">
                        <option>All Companies</option>
                        <option>SGM</option>
                    </select>
                </div>
                <div class="col">
                    <label>Select Month</label>
                    <input type="date" name="month" class="form form-control">
                </div> 
            </div>
            <div class="float-right mt-3">
                <button class="btn btn-primary">
                    <i class="fa fa-check"></i>
                    Bulk Payment
                </button>
            </div>
        </div>
        </div>
    </div>
</div>
 

<div class="card"> 
    <div class="card-body">
        <h5 class="mb-3">Payment info for <span class="text-red">2022-03</span></h5>
        <table id="example1" class="table table-sm table-bordered">
            <thead>
            <th>Action</th>
            <th>Name</th>
            <th>Payroll Type</th>
            <th>Salary</th>
            <th>Net Salary</th>
            <th>Status</th>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                </tr>
            </tbody>
        </table>
    </div>
@endsection()
