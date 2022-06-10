@extends('layout.app')
@section('heading')
Theme Settings 
@endsection

@section('heading')
Theme Settings
@endsection

@section('page-label')
Theme Settings
@endsection

@section('page-body')
<div class="row">
    <div class="col-4 col-sm-3">
        <div class="nav flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
        
        <a class="list-group-item active p-2" data-toggle="pill" href="#page-layouts" role="tab" aria-selected="true"> <i class="fa fa-cubes mr-3"></i> Page layouts</a>
        
        <a class="list-group-item p-2" data-toggle="pill" href="#notification-position" role="tab" aria-selected="false"> <i class="fa fa-exclamation-circle mr-3"></i> Notification Position</a>

        <a class="list-group-item p-2" data-toggle="pill" href="#form-design" role="tab" aria-selected="false"><i class="fa fa-edit mr-3"></i>Form Design</a>
        
        <a class="list-group-item p-2" data-toggle="pill" href="#system-logo" role="tab" aria-selected="false"><i class="fa fa-image mr-3"></i>System Logo</a>
        
        <a class="list-group-item p-2" data-toggle="pill" href="#sign-in-page-logo" role="tab" aria-selected="true"><i class="fa fa-file-image mr-3"></i>Sign In Page Logo</a>
        
        <a class="list-group-item p-2" data-toggle="pill" href="#Recruitment-page-logo" role="tab" aria-selected="false"><i class="fa fa-file-image mr-3"></i>Recruitment Page Logo</a>
        
        <a class="list-group-item p-2" data-toggle="pill" href="#payroll-logo" role="tab" aria-selected="false"><i class="fa fa-camera mr-3"></i>Payroll Logo</a>
        
        <a class="list-group-item p-2" data-toggle="pill" href="#organisation-chart" role="tab" aria-selected="false"><i class="fa fa-sitemap mr-3"></i>Organization Chart</a>
        
        
        </div>
    </div>
    <div class="col-7 col-sm-9">
        <div class="tab-content" id="vert-tabs-tabContent">
            <div class="tab-pane text-left fade show active" id="page-layouts" role="tabpanel" aria-labelledby="vert-tabs-home-tab">
               @include('components.basic-information')
            </div>
            <div class="tab-pane fade" id="notification-position" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                @include('components.immigration')
            </div>
            <div class="tab-pane fade" id="form-design" role="tabpanel" aria-labelledby="vert-tabs-messages-tab">
                @include('components.emergency-contacts')
            </div>
            <div class="tab-pane fade" id="social-networking" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
               @include('components.social-networking')  
            </div>
            <div class="tab-pane fade" id="system-logo" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                @include('components.add-new-documents') 
            </div>
            <div class="tab-pane fade" id="sign-in-page-logo" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                @include('components.qualification')
            </div>
             <div class="tab-pane fade" id="Recruitment-page-logo" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                 @include('components.work-experience')
            </div>
            <div class="tab-pane fade" id="payroll-logo" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                @include('components.bank-accounts')
            </div>
             <div class="tab-pane fade" id="organisation-chart" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                @include('components.change-password')
            </div>
             
        </div>
    </div>
</div> 
@endsection() 
