@extends('layout.app') 
@section('heading')
Employee Details
@endsection

@section('page-label')
 Employee Details
@endsection

@section('page-title')
 Employee Details
@endsection

@section('page-body')
 
<div class="col-md-12 col-sm-6">
            <div class="card card-primary card-outline card-outline-tabs">
              <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active"   data-toggle="pill" href="#general-tab" role="tab"   aria-selected="true">General</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#profile-picture" role="tab"   aria-selected="false">Profile Picture</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#set-salary" role="tab"   aria-selected="false">Set Salary</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#leaves" role="tab"   aria-selected="false">Leaves</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#core-hr" role="tab"   aria-selected="false">Core Hr</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#project-tasks" role="tab"   aria-selected="false">Project Tasks</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#payslips" role="tab"   aria-selected="false">Pay Slips</a>
                  </li>
                </ul>
              </div>
            <div class="card-body">
                <div class="tab-content" id="custom-tabs-four-tabContent">
                <div class="tab-pane fade show active" id="general-tab" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
                <div>
            
                <div class="row">
                <div class="col-4 col-sm-3">
                    <div class="nav flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
                    <a class="list-group-item active p-2" data-toggle="pill" href="#basic-information" role="tab" aria-selected="true">Basic Information</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#immigration" role="tab" aria-selected="false">Immigration</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#emergency-contacts" role="tab" aria-selected="false">Emergency Contacts</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#social-networking" role="tab" aria-selected="false">Social Networking</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#documents" role="tab" aria-selected="true">Documents</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#qualification" role="tab" aria-selected="false">Qualification</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#work-experience" role="tab" aria-selected="false">Work Experience</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#bank-account" role="tab" aria-selected="false">Bank Accounts</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#change-password" role="tab" aria-selected="false">Change Password</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#security-lavel" role="tab" aria-selected="false">Security Lavel</a>
                    <a class="list-group-item p-2" data-toggle="pill" href="#contacts" role="tab" aria-selected="false">Contacts</a>
                    </div>
                </div>
                <div class="col-7 col-sm-9">
                    <div class="tab-content" id="vert-tabs-tabContent">
                        <div class="tab-pane text-left fade show active" id="basic-information" role="tabpanel" aria-labelledby="vert-tabs-home-tab">
                           @include('components.basic-information')
                        </div>
                        <div class="tab-pane fade" id="immigration" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                            @include('components.immigration')
                        </div>
                        <div class="tab-pane fade" id="emergency-contacts" role="tabpanel" aria-labelledby="vert-tabs-messages-tab">
                            @include('components.emergency-contacts')
                        </div>
                        <div class="tab-pane fade" id="social-networking" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                           @include('components.social-networking')  
                        </div>
                        <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.add-new-documents') 
                        </div>
                        <div class="tab-pane fade" id="qualification" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.qualification')
                        </div>
                         <div class="tab-pane fade" id="work-experience" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                             @include('components.work-experience')
                        </div>
                        <div class="tab-pane fade" id="bank-account" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.bank-accounts')
                        </div>
                         <div class="tab-pane fade" id="change-password" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.change-password')
                        </div>
                         <div class="tab-pane fade" id="security-lavel" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.security-lavel')
                        </div>
                         <div class="tab-pane fade" id="contacts" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                            @include('components.contacts')
                        </div>
                    </div>
                </div>
                </div> 
         
                </div>
                  </div>
                  <div class="tab-pane fade" id="profile-picture" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
                       @include('components.upload-form')
                  </div>
                  <div class="tab-pane fade" id="set-salary" role="tabpanel" aria-labelledby="custom-tabs-four-messages-tab">
                  <div>
            
                    <div class="row">
                    <div class="col-4 col-sm-3">
                        <div class="nav  flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
                        <a class="list-group-item active p-2" data-toggle="pill" href="#update-salary" role="tab" aria-selected="true">Update Salary</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#allowance" role="tab" aria-selected="false">Allowance</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#commission" role="tab" aria-selected="false">Commission</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#loan" role="tab" aria-selected="false">Loan</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#statutory-deductions" role="tab" aria-selected="true">Statutory Deduction</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#other-payment" role="tab" aria-selected="false">Other Payment</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#overtime" role="tab" aria-selected="false">Overtime</a>
                        </div>
                    </div>
                    <div class="col-7 col-sm-9">
                        <div class="tab-content" id="vert-tabs-tabContent">
                            
                            <div class="tab-pane fade show active" id="update-salary" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                                 @include('components.setsalary.update-salary')
                            </div>
                            <div class="tab-pane fade" id="allowance" role="tabpanel" aria-labelledby="vert-tabs-messages-tab">
                                @include('components.setsalary.allowance')
                            </div>
                            <div class="tab-pane fade" id="commission" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                               @include('components.setsalary.commission') 
                            </div>
                            <div class="tab-pane fade" id="loan" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                                @include('components.setsalary.loan') 
                            </div>
                            <div class="tab-pane fade" id="statutory-deductions" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                                @include('components.setsalary.statutory') 
                            </div>
                             <div class="tab-pane fade" id="other-payment" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                                @include('components.setsalary.otherpayment') 
                            </div>
                           <div class="tab-pane fade" id="overtime" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                                @include('components.setsalary.overtime') 
                            </div>
                        </div>
                    </div>
                    </div> 
         
                  </div>
                  </div>
                  <div class="tab-pane fade" id="leaves" role="tabpanel" aria-labelledby="custom-tabs-four-settings-tab">
                      <div>
                          @include("components.leave-list")  
                      </div>
                  </div>
                  <div class="tab-pane fade" id="core-hr" role="tabpanel" aria-labelledby="custom-tabs-four-settings-tab">
                        <div class="row">
                    <div class="col-4 col-sm-3">
                        <div class="nav  flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
                        <a class="list-group-item active p-2" data-toggle="pill" href="#awards" role="tab" aria-selected="true">Awards</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#travels" role="tab" aria-selected="false">Travels</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#trainings" role="tab" aria-selected="false">Trainings</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#tickets" role="tab" aria-selected="false">Tickets</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#transfers" role="tab" aria-selected="true">Transfers</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#promotions" role="tab" aria-selected="false">Promotions</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#complaints" role="tab" aria-selected="false">Complaints</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#warnings" role="tab" aria-selected="false">Warnings</a>
                        </div>
                    </div>
                    <div class="col-7 col-sm-9">
                        <div class="tab-content" id="vert-tabs-tabContent">
                            <div class="tab-pane text-left fade show active" id="awards" role="tabpanel" aria-labelledby="vert-tabs-home-tab">
                                @include('components.corehr.awards')
                            </div>
                            <div class="tab-pane fade" id="travels" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                                @include('components.corehr.travels')
                            </div>
                            <div class="tab-pane fade" id="trainings" role="tabpanel" aria-labelledby="vert-tabs-messages-tab">
                                @include('components.corehr.trainings')
                            </div>
                            <div class="tab-pane fade" id="tickets" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                               @include('components.corehr.tickets') 
                            </div>
                            <div class="tab-pane fade" id="transfers" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                                @include('components.corehr.transfers')
                            </div>
                            <div class="tab-pane fade" id="promotions" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                                @include('components.corehr.promotions')
                            </div>
                             <div class="tab-pane fade" id="complaints" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                                @include('components.corehr.complaints')
                            </div>
                           <div class="tab-pane fade" id="warnings" role="tabpanel" aria-labelledby="vert-tabs-settings-tab">
                                @include('components.corehr.warnings')
                            </div>
                        </div>
                    </div>
                    </div>  
                  </div>
                  <div class="tab-pane fade" id="project-tasks" role="tabpanel" aria-labelledby="custom-tabs-four-settings-tab">
                        <div class="row">
                    <div class="col-4 col-sm-3">
                        <div class="nav  flex-column nav-tabs " id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
                        <a class="list-group-item active p-2" data-toggle="pill" href="#projects" role="tab" aria-selected="true">Projects</a>
                        <a class="list-group-item p-2" data-toggle="pill" href="#tasks" role="tab" aria-selected="false">Tasks</a>
                        </div>
                    </div>
                    <div class="col-7 col-sm-9">
                        <div class="tab-content" id="vert-tabs-tabContent">
                            <div class="tab-pane text-left fade show active" id="projects" role="tabpanel" aria-labelledby="vert-tabs-home-tab">
                                @include('components.projects')
                            </div>
                            <div class="tab-pane fade" id="tasks" role="tabpanel" aria-labelledby="vert-tabs-profile-tab">
                                @include('components.tasks')
                            </div>
                             
                        </div>
                    </div>
                    </div> 
                  </div>
                  <div class="tab-pane fade" id="payslips" role="tabpanel" aria-labelledby="custom-tabs-four-settings-tab">
                      @include('components.payslip-form')
                  </div>
                </div>
              </div>
              <!-- /.card -->
            </div>
          </div>
 
 

@endsection
