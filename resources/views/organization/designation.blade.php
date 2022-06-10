@extends('layout.app')
@section('title')
Designations
@endsection

@section('heading')
Designations
@endsection

@section('page-label')
Designations
@endsection

@section('page-body') 
 
    <div class="row"> 
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                     <h5>Add New Desination</h5>
                </div>
                <div class="card-body">
                   
                    <form> 
                        <p>
                            <label>Company</label>
                            <select name='company' class="form form-control">
                                <option>company</option>
                            </select>
                        </p>
                        <p>
                            <label>Main Department</label>
                            <select name='location' class="form form-control">
                                <option>Location</option>
                            </select>
                        </p>
                        <p>
                            <label> Designation Name</label>
                            <select name='department-head' class="form form-control">
                                <option>Designation Name</option>
                            </select>
                        </p>
                        <p class="text-right">
                            <button type='submit' class='btn btn-primary'>
                                <i class="fa fa-check-square mr-1"></i> Save</button>
                        </p>
                    </form>
                </div>
            </div>   
        </div>
        <div class="col-md-8">
        <div class=" ">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h3 class="card-title">List All Designations </h3>
                 
            </div>
            <div class="card-body">
        <div class="table-responsive">
        <table class="table table-bordered table-sm" id="example1" width="100%" cellspacing="0">
            <thead> 
                <th>Action</th>
                <th>Designation</th>  
                <th>Company</th>  
            </thead>  
        </table>
        </div>    
        </div>
        </div>    
        </div>
        </div>
    </div> 
 

<!-- comment -->
<div class="modal fade " id="edit-company-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    
    <div class="modal-dialog modal-lg" role="document"  >
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
     
  </div>
    </div>    
</div>

@if(Session::get('status') == 1) 
    <script type="text/javascript">
        toastr.options = {
             "onclick": null,
              "fadeIn": 300,
              "fadeOut": 1000,
              "timeOut": 5000,
              "extendedTimeOut": 1000,
               "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut",
                "closeButton":true,
                "title":'title',
           "positionClass": "toast-top-center",
           "progressBar" : true
        }
      toastr.success("{!! Session::get('message') !!}",{"iconClass":'customer-info'});
    </script>  
 
@endif 

@if(Session::get('status') == 2) 
    <script type="text/javascript">
        toastr.options = {
           "onclick": null,
           "fadeIn": 300,
           "fadeOut": 1000,
           "timeOut": 5000,
           "extendedTimeOut": 1000,
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut",
            "iconClass": "customer-info",
           "positionClass": "toast-top-center",
           "progressBar" : true
        }
      toastr.error("{!! Session::get('message') !!}");
    </script>  
 
@endif

@if(Session::get('status') == 3) 
    <script type="text/javascript">
        toastr.options = {
             "onclick": null,
          "fadeIn": 300,
          "fadeOut": 1000,
          "timeOut": 5000,
          "extendedTimeOut": 1000,
           "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut",
            "iconClass": "customer-info",
           "positionClass": "toast-top-center",
           "progressBar" : true
        }
      toastr.info( "{{ Session::get('message') }}" );
    </script>  
 
@endif
<script>
    $('#add-org-department-form').hide();
    $('#display-org-department-form').click(function(){
        $('#add-org-department-form').slideToggle();

    });
</script>
@endsection