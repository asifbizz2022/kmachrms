@extends('layout.app')
@section('heading')
Constants
@endsection

@section('heading')
Constants
@endsection

@section('page-label')
Constants
@endsection

@section('page-body')
<div class="row">
    <div class="col-3 col-sm-3">
        <div class="nav flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
        <a class="list-group-item active p-2" data-toggle="pill" href="#contract-types" role="tab" aria-selected="true">
            <i class="fa fa-edit mr-3"></i>Contract Types</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#qualification" role="tab" aria-selected="false"><i class="fa fa-box mr-3"></i>Qualification</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#document-type" role="tab" aria-selected="false"><i class="fa fa-file-archive  mr-3"></i>Document Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#award-type" role="tab" aria-selected="false"><i class="fa fa-trophy mr-3"></i>Award Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#religion" role="tab" aria-selected="true"><i class="fa fa-road mr-3"></i>Religion</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#leave-type" role="tab" aria-selected="false"><i class="fa fa-plane mr-3"></i>Leave Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#warning-type" role="tab" aria-selected="false"><i class="fa fa-exclamation-triangle mr-3"></i>Warning Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#termination-type" role="tab" aria-selected="false"><i class="fa fa-square mr-3"></i>Termination Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#expense-type" role="tab" aria-selected="false"><i class="fa fa-square mr-3"></i>Expense Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#income-type" role="tab" aria-selected="false"><i class="fa fa-square mr-3"></i>Income Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#employee-exit-type" role="tab" aria-selected="false"><i class="fa fa-square mr-3"></i>Employee Exit Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#travel-arrangement-type" role="tab" aria-selected="false"><i class="fa fa-car mr-3"></i>Travel Arrangement Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#currency-type" role="tab" aria-selected="false"><i class="fa fa-dollar-sign mr-3"></i>Currency Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#company-type" role="tab" aria-selected="false"><i class="fa fa-building mr-3"></i>Company Type</a>
        <a class="list-group-item p-2" data-toggle="pill" href="#security-type" role="tab" aria-selected="false"><i class="fa fa-square mr-3"></i>Security Type</a>
        </div>
    </div>
                <div class="col-7 col-sm-9">
                    <div class="tab-content" id="vert-tabs-tabContent">
                        <div class="tab-pane text-left fade show active" id="contract-type" role="tabpanel" aria-labelledby="vert-tabs-home-tab">
                           @include('components.system.contract-type')
                        </div>
                        <div class="tab-pane fade" id="qualification" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                             @include('components.system.qualification') 
                        </div>
                        <div class="tab-pane fade" id="document-type" role="tabpanel" aria-labelledby="vert-tabs-messages-tab">
                            @include('components.system.document-type')
                        </div>
                        <div class="tab-pane fade" id="award-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                           @include('components.system.award-type')
                        </div>
                        <div class="tab-pane fade" id="religion" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                           @include('components.system.religion')
                        </div>
                        <div class="tab-pane fade" id="leave-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.system.leave-type')
                        </div>
                        <div class="tab-pane fade" id="warning-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                             @include('components.system.warning-type')
                        </div>
                        <div class="tab-pane fade" id="termination-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.system.termination-type')
                        </div>
                        <div class="tab-pane fade" id="expense-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                         @include('components.system.expense-type')
                        </div>
                         <div class="tab-pane fade" id="income-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.system.income-type')
                        </div>
                        <div class="tab-pane fade" id="employee-exit-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.system.employee-exit-type')
                        </div>
                        <div class="tab-pane fade" id="travel-arrangement-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.system.travel-arrangement-type')
                        </div>
                        <div class="tab-pane fade" id="currency-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                           @include('components.system.currency-type')
                        </div>
                        <div class="tab-pane fade" id="company-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.system.company-type')
                        </div>
                        <div class="tab-pane fade" id="security-type" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.system.security-type')
                        </div>
                    </div>
                </div>
                </div> 
@endsection() 
