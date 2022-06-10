@extends('layout.app') 
@section('heading') Staff Dashboard
@endsection
@section('page-body')
<div class="row  ">
    <div class="col-md-12 col-lg-12 col-sm-auto">
        <h5 class='font-weight-bold'>
            Today is 
            {{ date('l'). ' ,  ' . date('d F Y') }}
        </h5> 
    </div>
</div>
<div class="row  ">
    <div class="col-lg-3 mb-4">
        <div class="card bg-light text-gray shadow">
            <div class="card-body"> 
                <div class="row align-items-center">
                    <div class="col-auto align-items-center">
                        <h1 class="alert border-round alert-primary rounded-circle">
                            <i class="fa fa-user"></i>
                        </h1>
                    </div>
                    <div class="col-auto"> <span>{{ $counts }}</span> 
                        <h6> 
                        Employees
                        </h6> 
                        <a href="{{ route('employees') }}">
                            <small class="badge badge-primary">Active</small>   
                        </a>    
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
    <div class="col-lg-3 mb-4">
        <div class="card bg-light text-black shadow">
            <div class="card-body"> 
                <div class="row align-items-center">
                    <div class="col-auto align-items-center">
                        <h1 class="alert border-round alert-info rounded-circle">
                            <i class="fa fa-user"></i>
                        </h1>
                    </div>
                    <div class="col-auto"> <span>$000</span>    
                        <h6 class="text-wrap">  
                        Total Salaries 
                        Paid
                        </h6> 
                        <a href="#">
                            <small class="badge badge-info">Active</small>   
                        </a>    
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
     <div class="col-lg-3 mb-4">
        <div class="card bg-light text-black shadow">
            <div class="card-body"> 
                <div class="row align-items-center">
                    <div class="col-auto align-items-center">
                        <h1 class="alert border-round alert-success rounded-circle">
                            <i class="fa fa-trophy"></i>
                        </h1>
                    </div>
                    <div class="col-auto"> <span>{{ $awards }}</span>    
                        <h6> 
                        Awards 
                        </h6> 
                        <a href="#">
                            <small class="badge alert-success">Active</small> 
                        </a>  
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
    <div class="col-lg-3 mb-4">
        <div class="card bg-light text-black shadow">
            <div class="card-body"> 
                <div class="row align-items-center">
                    <div class="col-auto align-items-center">
                        <h1 class="alert border-round badge-warning rounded-circle">
                            <i class="fa fa-calendar"></i>
                        </h1>
                    </div>
                    <div class="col-auto"> <span>{{ $leaveRequests }}</span>    
                        <h6>  
                        Leave Requests
                        </h6> 
                        <a href="#">
                            <small class="badge badge-warning">Active</small>   
                        </a>
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
</div>
<!-- another row -->
<div class="row">
    <div class="col-lg-3 mb-4">
        <div class="card bg-light text-gray shadow">
            <div class="card-body"> 
                <div class="row align-items-center">
                    <div class="col-auto align-items-center">
                        <h1 class="alert border-round badge-secondary rounded-circle">
                            <i class="fa fa-ticket-alt"></i>
                        </h1>
                    </div>
                    <div class="col-auto"> <span>{{ $tickets }}</span> 
                        <h6> 
                        Total Tickets
                        </h6> 
                        <a href="#">
                            <small class="badge badge-secondary">Active</small>   
                        </a>
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
    <div class="col-lg-3 mb-4">
        <div class="card bg-light text-black shadow">
            <div class="card-body"> 
                <div class="row align-items-center">
                    <div class="col-auto align-items-center">
                        <h1 class="alert border-round badge-danger rounded-circle">
                            <i class="fa fa-plane"></i>
                        </h1>
                    </div>
                    <div class="col-auto"> <span>{{ $travelRequest }}</span>    
                        <h6> 
                        Travel Requests
                        </h6> 
                        <a href="#">
                            <small class="badge badge-danger">Active</small>   
                        </a>
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
     <div class="col-lg-3 mb-4">
        <div class="card bg-light text-black shadow">
            <div class="card-body"> 
                <div class="row align-items-center">
                    <div class="col-auto align-items-center">
                        <h1 class="alert border-round alert-primary rounded-circle">
                            <i class="fa fa-graduation-cap"></i>
                        </h1>
                    </div>
                    <div class="col-auto"> <span>{{ $training }}</span>    
                        <h6> 
                        Training
                        </h6> 
                        <a href="#">
                            <small class="badge badge-primary">Active</small> 
                        </a>  
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
     
    <div class="col-lg-3 mb-4">
        <div class="card bg-light text-black shadow">
            <div class="card-body"> 
                <div class="row align-items-center">
                    <div class="col-auto align-items-center">
                        <h1 class="alert border-round badge-info rounded-circle">
                            <i class="fa fa-user"></i>
                        </h1>
                    </div>
                    <div class="col-auto"> <span>{{ $assets }}</span>    
                        <h6>  
                            <a href="url" class="link">Assets</a>
                        </h6> 
                        <a href="#">
                             <small class="badge badge-info">Active</small>      
                        </a> 
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
     
</div> 
 
@endsection
