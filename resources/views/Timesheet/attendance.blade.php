@extends('layout.app')
@section('heading')
Attendance  
@endsection

@section('title')
Attendance  
@endsection

@section('page-label')
Attendance  
@endsection

@section('page-body')
<div class="card rounded-0">
    <div class="card-body">
        <div class="row">
            <div class="col">
                <label>Location</label> 
                <select class="form-control location" name="location">
                    <option>All</option>
                </select>
            </div>
            <div class="col">
                <label>Date</label>
                <input type="date" class="form-control" name="date"/>
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
<div class="card rounded-0">
    <div class="card-body">
        <div>
            
        </div>
        <table id="example3" class="border table table-sm">
            <thead>
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
<section>
    
</section>
@endsection
