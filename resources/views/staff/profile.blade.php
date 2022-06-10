@extends('layout.app') 
@section('page-body')

<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="list-group-item p-2" data-bs-toggle="tab" data-bs-target="#nav-general" type="button" role="tab" aria-controls="nav-genral" aria-selected="false">General</button>
    <button class="list-group-item p-2" data-bs-toggle="tab" data-bs-target="#nav-salary" type="button" role="tab" aria-controls="nav-salary" aria-selected="false">Salary</button>
    <button class="list-group-item p-2" data-bs-toggle="tab" data-bs-target="#nav-leaves" type="button" role="tab" aria-controls="nav-leaves" aria-selected="false">Leaves</button>
    <button class="list-group-item p-2" data-bs-toggle="tab" data-bs-target="#nav-hr" type="button" role="tab" aria-controls="nav-leaves" aria-selected="false">Core HR</button>
    <button class="list-group-item p-2" data-bs-toggle="tab" data-bs-target="#nav-project-task" type="button" role="tab" aria-controls="nav-leaves" aria-selected="false">Projects & Tasks</button>
    <button class="list-group-item p-2" data-bs-toggle="tab" data-bs-target="#nav-payslip" type="button" role="tab" aria-controls="nav-leaves" aria-selected="false">Payslips</button>
    
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-general" role="tabpanel" aria-labelledby="nav-home-tab">
      General
  <div class="row">
    <div class="col-md-8">

    </div>
    <div class="col-md-4">
      
    </div>
  </div>
  </div>
  <div class="tab-pane fade" id="nav-salary" role="tabpanel" aria-labelledby="nav-profile-tab">
  Salary
  
  </div>
  <div class="tab-pane fade" id="nav-leaves" role="tabpanel" aria-labelledby="nav-contact-tab">...
 Leaves
  </div>
   <div class="tab-pane fade" id="nav-hr" role="tabpanel" aria-labelledby="nav-contact-tab">...
 Hr
  </div>   
    <div class="tab-pane fade" id="nav-project-task" role="tabpanel" aria-labelledby="nav-contact-tab">...
 Projects
  </div> 
    <div class="tab-pane fade" id="nav-payslip" role="tabpanel" aria-labelledby="nav-contact-tab">...
 Payslip
  </div> 
   
</div> 
@endsection

 