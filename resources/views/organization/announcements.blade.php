@extends('layout.app')
@section('title')
Announcements
@endsection

@section('heading')
Announcements
@endsection

@section('page-label')
Announcements
@endsection

@section('page-body')
 <div class="text-right my-3">
     <button type="button" class="btn rounded-0 btn-info add-new-button">
        <i class="fa fa-plus"></i>
       Add New</button>
</div>
<div class="card add-form">
<div class="card-header"> 
  <div class="d-flex justify-content-between">
    <h3 class="card-title">Add New Announcements</h3> 
    
  </div>
</div>
<div class="card-body  "  id="add-org-announcements-form">
     
    <!--Add new  Form -->
    <div >
        <form method="post" action="{{ route('announcement-add') }}" >
            @csrf
            <div class="row">
              <div class="col">
                <div class="form-group">
                <label for="title">Title</label>
                <input class="form-control" placeholder="Title" name="title" type="text" >
              </div>
              </div>
              <div class="col">
                 
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control  " placeholder="Description" name="description" cols="8" rows="5" id="description"></textarea>
                  </div>
                </div>
              </div>
             
              </div>
            </div>
            <div class="row">  
              <div class="col-md-12"> 
            
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="start_date">Start Date</label>
                    <input class="form-control " placeholder="Start Date"   name="start-date" type="date" value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="end_date">End Date</label>
                    <input class="form-control " placeholder="End Date"  name="end-date" type="date" value="">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="designation" class="control-label">Company</label>
                    <select class="form-control" name="company-id" id="aj_company" data-plugin="select_hrm" data-placeholder="Company">
                    @foreach($company as $row)
                      <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                    @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-md-6" id="location_ajax">
                <div class="form-group">
                  <label for="name">Location</label>
                  <select name="location-id" id="location-id" class="form-control"  >
                    
                    @foreach($location as $row)
                    <option value="{{$row->location_id}}">{{$row->city}}</option>
                    @endforeach
                  </select>
                </div>
                </div>
               
              </div>
            </div>
            
          </div>
          <div class="row">
          <div class="col-md-3">
              <div class="form-group" id="department_ajax">
                <label for="department" class="control-label">Department</label>
                <select class="form-control" name="department-id" >
                  @foreach($department as $row)
                    <option value="{{$row->department_id}}">{{$row->department_name}}</option>
                    @endforeach
                </select>
              </div>
            </div>
          <div class="col-md-8">
          <div class="form-group">
            <label for="summary">Summary</label>
            <input type="text" class="form-control" placeholder="Summary" name="summary" id="summary">
          </div>
           
               </div>
                <div class="col-md-12 mt-3 text-right">
                    <button type="submit" class="btn btn-primary">
                      <i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            </div>
           
        </form>
    </div>
</div>
</div>

<div class="mt-3">
<div class="card mb-4">
    <div class="card-header py-3">
        <span>
             <strong class="m-0 font-weight-bold text-primary" >List All Announcements</strong>
        </span> 
      
    </div>
    <div class="card-body">
<div class="table-responsive">
<table class="table table-bordered table-sm" id="example1" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th>Title</th>  
        <th>Company</th> 
        <th><i class="fa fa-calendar"></i> Start Date</th>
        <th><i class="fa fa-calendar"></i> End Date</th>  
    </thead>  
    @foreach($result as $row)
    <tr>
        <td>
        <a href="javascript:void(0)" class="edit btn btn-info btn-sm" url="announcement/edit" value="{{$row->announcement_id}}" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-edit" ></i>
        </a>
        <a href="javascript:void(0)" class="delete btn btn-danger btn-sm" url="announcement/delete"  value="{{$row->announcement_id}}">
            <i class="fa fa-trash-alt" ></i>
        </a>
        </td>
      <td>
        {{$row->name}}
      </td>
      <td>
        {{ $row->trading_name }}
      </td>
      <td>
        {{$row->start_date}}
      </td>
      <td>
        {{$row->end_date}}
      </td>
     
    </tr>
    @endforeach
   
</table>
</div>    
</div>
</div>    
</div>
<!-- comment -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Announcement Edit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form method="post" action="{{ route('announcement-update') }}" class="update-form">
            @csrf
            <div class="row">
              <div class="col">
                <input type="hidden" name="id" class="id">
                <div class="form-group">
                <label for="title">Title</label>
                <input class="form-control" placeholder="Title" name="title" type="text" >
              </div>
              </div>
              <div class="col">
                 
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control  " placeholder="Description" name="description" cols="8" rows="5" id="description"></textarea>
                  </div>
                </div>
              </div>
             
              </div>
            </div>
            <div class="row">  
              <div class="col-md-12"> 
            
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="start_date">Start Date</label>
                    <input class="form-control " placeholder="Start Date"   name="start-date" type="date" value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="end_date">End Date</label>
                    <input class="form-control " placeholder="End Date"  name="end-date" type="date" value="">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="designation" class="control-label">Company</label>
                    <select class="form-control" name="company-id" id="aj_company" data-plugin="select_hrm" data-placeholder="Company">
                    @foreach($company as $row)
                      <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                    @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-md-6" id="location_ajax">
                <div class="form-group">
                  <label for="name">Location</label>
                  <select name="location-id" id="location-id" class="form-control"  >
                    
                    @foreach($location as $row)
                    <option value="{{$row->location_id}}">{{$row->city}}</option>
                    @endforeach
                  </select>
                </div>
                </div>
               
              </div>
            </div>
            
          </div>
          <div class="row">
          <div class="col-md-3">
              <div class="form-group" id="department_ajax">
                <label for="department" class="control-label">Department</label>
                <select class="form-control" name="department-id" >
                  @foreach($department as $row)
                    <option value="{{$row->department_id}}">{{$row->department_name}}</option>
                    @endforeach
                </select>
              </div>
            </div>
          <div class="col-md-8">
          <div class="form-group">
            <label for="summary">Summary</label>
            <input type="text" class="form-control" placeholder="Summary" name="summary" id="summary">
          </div>
           
               </div>
                <div class="col-md-12 mt-3 text-right">
                   <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">
                      <i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            </div>
           
        </form>
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
$.ajaxSetup({
  headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
});


 $('.add-form').hide();

        $(document).on('click','.add-new-button', function(){
           $('.add-form').slideToggle();
        });

$(document).on('click', '.edit', function(e){
            
     var $id = $(this).attr('value');
    console.log($id);
    $.ajax({
        url : '{{ url("announcement/edit") }}'+'/'+$id,
        type: 'post', 
        dataType: 'Json',
        success:function(data){
            
            $.each(data, function(key , value){ 
              $('.id').val(value.announcement_id);
               
            });
        }
    }); 
   console.log($id);
              
});

$(document).on('click','.delete',function(e){
   
  var $id = $(this).attr('value');
  var $url = $(this).attr('url');


  console.log($id);
  $.ajax({
    url : '{{ url("announcement/delete") }}'+'/'+$id,
    type : 'post',
    dataType : 'Json',
    success: function(data){  
      
      window.location.reload();
      $.each(data, function(key, value){
        console.log(value);
      });
    }
  });
});

$(document).on('submit', '.update-form', function(e){
  e.preventDefault();
  var $url = $(this).attr('action');
  var $data = $(this).serialize();

  $.ajax({
    url : $url,
    type : 'post',
    data : $data,
    dataType : 'json',
    success : function(res){
      console.log(res.message);
      if(res){
        window.location.reload();
      }
    }
  })
})



 
});
</script>
@endsection