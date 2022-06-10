@extends('layout.app')
@section('heading')
Official Documents
@endsection

@section('title')
Official Documents
@endsection

@section('page-label')
Official Documents
@endsection

@section('page-body')
 
<div class="text-right my-3">
    <button type="button" class="btn rounded-0 btn-info add-new-button">
        <i class="fa fa-plus"></i>
       Add New
    </button>
</div>

<div class="card add-form">
    <div class="card-header"> 
    <div class="d-flex justify-content-between">
         <h3 class="card-title">Add New Official Documents</h3> 
    </div>
    </div>
<div class="card-body" id="add-official-document-form"> 
    <!--Add new  Form -->
    <div id="add-form">
        <form method="post" action="{{ route('official-documents-add') }}" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-md-6">
                <p>
                <label>License Name</label>
                <input type="text" name="license-name" class="form form-control" placeholder="Licence Name">
                </p> 
                
                </div>
                <div class="col-md-6"> 
                    <div class="row">
                        <div class="col-md-6">
                            <label>Document Types</label>
                            <select name="document-type" class="form form-control">
                                @foreach($table as $row)
                                <option value="{{$row->document_type_id }}">{{$row->document_type}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Licence Number</label>
                            <input name="license-number" class="form form-control" placeholder="Licence Number">
                        </div>
                    </div>  
                </div>
            </div> 
            <div class="row">
              
                <div class="col-md-6"> 
                    <div class="row">
                        <div class="col-md-6">
                            <label>Company</label>
                            <select name="company" class="form form-control">
                                 @foreach($table as $row)
                                <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Expiry Date</label>
                            <input type="date" name="expiry-date" class="form form-control" placeholder="Expiry Date">
                        </div>
                    </div>  
                </div>
                
                <div class="col-md-6">
                <p>
                <label>Alarm Notification</label>
                <select name="license-notification" class="form form-control">
                    <option>No Alarm</option>
                    <option value="1">1 Month</option>
                    <option value="2">2 Month</option>
                    <option value="3">3 Month</option>
                </select>
                </p> 
                
                </div>
                <div class="col-md-6">
                    <input type="file" name="document" class="form-control-file">
                </div>
            </div> 
            
               
                <div class="col-md-12 mt-3 text-right">
                    <button type="submit" class="btn btn-primary ">
                        <i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            
           
        </form>
    </div>
</div>
</div>

<div class="mt-3">
<div class="card   mb-4">
    <div class="card-header py-3">
        <h3 class="card-title">List All Official Documents</h3>  
    </div>
    <div class="card-body">
        
<div class="table-responsive">
<table class="table table-bordered table-sm" id="example1" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th>Document Type</th>
        <th> Title</th>
        <th>Company</th> 
        <th>Expiry Date</th>
        <th><i class="fa fa-bell"></i> Notification</th>  
    </thead>  
    @foreach($table as $row)
    <tr>
         <td>
        <a href="" class="edit btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModal"  >
            <i class="fa fa-edit"></i>
        </a>
        <a href="{{ route('official-documents-delete', $row->document_id)}}" class="delete btn btn-danger btn-sm" >
            <i class="fa fa-trash-alt"></i>
        </a>
        </td>
        <td>
            {{$row->document_type}}
        </td>
        <td>
            {{$row->document_type}}
        </td>
        <td>
            {{$row->trading_name}}
        </td>
        <td>
            {{$row->expiry_date}}
        </td>
        <td>
            {{$row->license_notification}}
        </td>
    </tr>
    @endforeach
   
</table>
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
   
$(document).ready(function(){
    $('.add-form').hide();
    $(document).on('click','.add-new-button', function(){
       $('.add-form').slideToggle();
    });
});
</script>
@endsection