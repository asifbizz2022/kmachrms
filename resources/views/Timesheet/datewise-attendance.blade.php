@extends('layout.app')
@section('heading')
Datewise Attendance
@endsection
@section('title')
Datewise Attendance
@endsection
@section('page-label')
Datewise Attendance
@endsection
@section('page-body')
<div class="card rounded-0">
    <div class="card-body">
        <div class="row">
            <div class="col">
                <label>Start Date</label> 
               <input type="date" name="date" id="" class="form-control">
            </div>
            <div class="col">
                <label>End Date</label> 
               <input type="date" name="date" id="" class="form-control">
            </div>
        </div>
        <br>
        <div class="row"> 
            <div class="col">
                <label>Company</label>
                <select name="company" id="" class="form-control">
                    <option value="">Compnay</option>
                </select>
            </div>
            <div class="col">
                <label>Choose an Employee</label>
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
<div>
<div class="card rounded-0">
    <div class="card-header">
        <h5>Attendance</h5>
    </div>    
<div class="card-body">
        
        <table id="example3" class=" table table-sm table-bordered">
            <thead>
            <tr>
                <th colspan='3' class="align-middle  ">HR Information</th>
                <th colspan='11' class="align-middle   ">Attendance Report</th>
            </tr> 
           <tr>
            <th>Employee</th>
            <th>Employee Id</th>
            <th>Company</th>
            <th>Date</th>
            <th>Status</th>
            <th>Clock in</th>
            <th>Clock In Location</th>
            <th>Clock Out</th>
            <th>Clock Out Location</th>
            <th>Late</th>
            <th>Early Leaving</th>
            <th>Overtime</th>
            <th>Total Work</th>
            <th>Total Rest</th>
           </tr> 
            </thead>
            <tbody>
                <?php for($a = 1; $a<=100 ; $a++) {?>
                <tr>
                    <td><?=  rand();    ?></td>
                    <td><?= date('d-m-Y'); $a;  ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y');  $a;  ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td>
                    <td><?= date('d-m-Y'); $a ; ?></td> 
                </tr>  
                <?php }?>
            </tbody>
        </table>
    </div>
</div>
</div>
@endsection
