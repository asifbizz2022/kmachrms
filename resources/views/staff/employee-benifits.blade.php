@extends('layout.app')
@section('heading')
Employee Benifits
@endsection

@section('heading')
Add New Employee
@endsection

@section('page-label')
Employee Benifits
@endsection

@section('page-body')
<div class="row">
                <div class="col-4 col-sm-3">
                <div class="nav flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
                    <a class="list-group-item active p-2" data-toggle="pill" href="#accomodation" role="tab" aria-selected="true">Accomodation</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#accomodateemployee" role="tab" aria-selected="false">Accomodate Employee</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#utilitiesaccessories" role="tab" aria-selected="false">Utilities and Accesories</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#driver" role="tab" aria-selected="false">Driver</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#housekeeping" role="tab" aria-selected="false">House Keeping</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#hostelaccomodation" role="tab" aria-selected="false">Hostel Accomodation</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#otherbenifits" role="tab" aria-selected="false">Other Benifits</a> 
                </div>
                </div>
                <div class="col-7 col-sm-9">
                    <div class="tab-content" id="vert-tabs-tabContent">
                        <div class="tab-pane text-left fade show active" id="accomodation" role="tabpanel" aria-labelledby="vert-tabs-home-tab">
                         @include('components.emp.accomodation')
                        </div>
                        <div class="tab-pane fade" id="accomodateemployee" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                         @include('components.emp.accomodate-employee')
                        </div>
                        <div class="tab-pane fade" id="utilitiesaccessories" role="tabpanel" aria-labelledby="vert-tabs-messages-tab">
                       @include('components.emp.utilities-and-accessories')
                        </div>
                        <div class="tab-pane fade" id="driver" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                        @include('components.emp.driver')
                        </div>
                        <div class="tab-pane fade" id="housekeeping" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                        @include('components.emp.house-keeping')
                        </div>
                        <div class="tab-pane fade" id="hostelaccomodation" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                        @include('components.emp.hostel-accomodation')
                        </div>
                         <div class="tab-pane fade" id="otherbenifits" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                        @include('components.emp.other-benifits')
                        </div>
                        
                    </div>
                </div>
                </div> 
          

@endsection