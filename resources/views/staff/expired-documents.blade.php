@extends('layout.app') 
@section('heading') Expired Documents @endsection
@section('page-label') Expired Documents @endsection
@section('page-body')
 
<div class="row">
    <div class="col-4 col-sm-3">
        <div class="nav flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
        
        <a class="list-group-item active p-2" data-toggle="pill" href="#expired-documents" role="tab" aria-selected="true"> <i class="fa fa-cubes mr-3"></i> Expired Documents</a>
        
        <a class="list-group-item p-2" data-toggle="pill" href="#immigration" role="tab" aria-selected="false"> <i class="fa fa-exclamation-circle mr-3"></i>Immigration</a>

        <a class="list-group-item p-2" data-toggle="pill" href="#official-documents" role="tab" aria-selected="false"><i class="fa fa-edit mr-3"></i>Official Documents</a>
        
        <a class="list-group-item p-2" data-toggle="pill" href="#assets-warrenty" role="tab" aria-selected="false"><i class="fa fa-image mr-3"></i>Assets Warrenty</a>
        
        
        
        </div>
    </div>
    <div class="col-7 col-sm-9">
        <div class="tab-content" id="vert-tabs-tabContent">
            <div class="tab-pane text-left fade show active" id="expired-documents" role="tabpanel" aria-labelledby="vert-tabs-home-tab">
               @include('components.expired.expired-documents')
            </div>
            <div class="tab-pane fade" id="immigration" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                @include('components.expired.immigration')
            </div>
            <div class="tab-pane fade" id="official-documents" role="tabpanel" aria-labelledby="vert-tabs-messages-tab">
                @include('components.expired.official-documents')
            </div>
            <div class="tab-pane fade" id="assets-warrenty" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
               @include('components.expired.assets-warrenty')  
            </div> 
        </div>
    </div>
</div> 

  
 
    
 
 
  
@endsection