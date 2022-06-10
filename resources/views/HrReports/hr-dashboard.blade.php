@extends('layout.app')
@section('heading')
Hr Dashboard
@endsection
@section('page-body')
<div class="row">
          <div class="col-lg-3 col-md-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner"> 
                 <p>Employees</p>
                <h6>100</h6> 
               
                <span class='badge badge-info'>Active 20</span>
                 <span class='badge badge-Danger'>Inactive 20</span>
              </div>
              <div class="  icon">
                <i class="fa fa-user"></i>
              </div>
               
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-md-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner"> 
                <p>Roles</p>
                <h6>100 </h6> 
                <span>Set Roles</span>
              </div>
              <div class="   icon">
                <i class="fa fa-lock"></i>
              </div>
                
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-md-3 col-6"> 
            <div class="small-box bg-primary">
              <div class="inner"> 
                 <p>Leaves</p>
                 <h6>100</h6> 
                 <span>View Application</span>
              </div>
              <div class="  icon">
                <i class="fa fa-calendar"></i>
              </div> 
            </div>
          </div>
          <!-- ./col -->
            <div class="col-lg-3 col-md-3 col-6"> 
            <div class="small-box bg-danger">
              <div class="inner"> 
                 <p>HR SALE</p>
                 <h6>SETTINGS</h6> 
                 <span>Configration</span>
              </div>
              <div class="  icon">
                <i class="fa fa-cog"></i>
              </div> 
            </div>
          </div>
          </div>
@endsection
