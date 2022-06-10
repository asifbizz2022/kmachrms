@extends('layout.app') 
@section('heading')
HR Imports
@endsection
@section('page-body')
<div>
<div class="row">
    <div class="col-4 col-sm-3">
        <div class="nav  flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical"> 

        <a class="list-group-item active p-2" data-toggle="pill" href="#basic-information" role="tab" aria-selected="true">
        	<i class="fa fa-user mr-2"></i>Import Employees
        </a>

        <a class="list-group-item p-2" data-toggle="pill" href="#immigration" role="tab" aria-selected="false">
        	<i class="fa fa-clock mr-2"></i>
        Import Attendance
    	</a>

        <a class="list-group-item p-2" data-toggle="pill" href="#emergency-contacts" role="tab" aria-selected="false">
        	<i class="fa fa-users mr-2"></i>
        Imoport Leads
    	</a>
        
        </div>
    </div>
    <div class="col-7 col-sm-9">
        <div class="tab-content" id="vert-tabs-tabContent">
            <div class="tab-pane text-left fade show active" id="basic-information" role="tabpanel" aria-labelledby="vert-tabs-home-tab">
               @include('HrReports.component.import-employees')
            </div>
            <div class="tab-pane fade" id="immigration" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                @include('HrReports.component.import-attendance')
            </div>
            <div class="tab-pane fade" id="emergency-contacts" role="tabpanel" aria-labelledby="vert-tabs-messages-tab">
                @include('HrReports.component.import-leads')
            </div>
            
        </div>
    </div>
</div>
</div>
@endsection