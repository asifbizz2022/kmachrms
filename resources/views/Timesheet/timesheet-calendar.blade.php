@extends('layout.app')
@section('heading')
Timesheet Calendar
@endsection
@section('page-body')
<div class="card rounded-0">
    <div class="card-body">
        <div class="row">
            <div class="col">
                <label>Date</label> 
               <input type="date" name="date" id="" class="form-control">
            </div>
            <div class="col">
                <label>Date</label>
                <select name="company" id="" class="form-control">
                    <option value="">Compnay</option>
                </select>
            </div>
            <div class="col">
                <label>Date</label>
                <select name="employee" id="" class="form-control">
                    <option value="">Employee</option>
                </select>
            </div>
        </div>
        <div class="row">
             <div class="col"> 
                <button type="button" class="btn btn-primary mt-5">Get</button>
            </div>
        </div>
        </div>
    </div>
</div>
@endsection
