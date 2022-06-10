@extends('layout.app')
@section('heading')
payslip History
@endsection
@section('page-body') 

<form action="#" id='payslip-filter-form'>
<div class='card'> 
     <div class="card-header py-3">
        
        <span class="float-right">
            <button class="btn btn-primary btn-sm" id='payslip-hide' >
                <i class="fa fa-filter"></i>
                Hide
            </button>
        <span>
    </div>
    <div class='card-body'> 
        <div class='row'>  
             <div class='col-md-3 '> 
                <label>Company</labe>
                <select name='company' class='form form-control'>
                    <option>
                        Company
                    </option>
                </select> 
            </div> 
            
            <div class='col-md-3 '> 
                <label>Location</labe>
                <select name='location' class='form form-control'>
                    <option>
                        Location
                    </option>
                </select> 
            </div> 
            
            <div class='col-md-3 '> 
                <label>Department</labe>
                <select name='department' class='form form-control'>
                    <option>
                        Department
                    </option>
                </select> 
            </div> 
            
            <div class='col-md-3 '> 
                <label>Salary Month</labe>
                <input type='date' class='form form-control'></input>
            </div> 
            
            <div class='col'>
                <button class="btn btn-primary float-right">
                    <i class="fa fa-check"></i>
                     Get</button>
            </div>
        </div>
    </div>
</div>
</form>
<div class="mt-3">
<div class="card   mb-4"> 
<div class="card-body">
    <h5 class="mb-3">List All Payroll</h5>
<div class="table-responsive">
<table class="table table-bordered table-sm" id="example5" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th><i class="fa fa-user"></i> Employee Name</th>
        <th><i class="fa fa-calculator"></i> Company</th>
        <th>Account #</th>
        <th>Net Payable</th>
        <th>Salary Month</th>
        <th>Payroll Date</th>
    </thead>  
    <tbody>
        <?php for($i=0; $i<= 100; $i++) {?>
        <tr>
            <td><?= rand() ?></td>
            <td><?= rand() ?></td>
            <td><?= rand() ?></td>
            <td><?= rand() ?></td>
            <td><?= rand() ?></td>
            <td><?= rand() ?></td>
            <td><?= rand() ?></td>
        </tr>
        <?php }?>
    </tbody>
   
</table>
</div>
</div>
</div>    
</div>
<script>
    $('#payslip-filter-form').hide();
    $('#payslip-filter').click(function(){
        $('#payslip-filter-form').slideToggle();

    });
    $('#payslip-hide').click(function(){
        $('#payslip-filter-form').slideUp();
    });
</script>
@endsection