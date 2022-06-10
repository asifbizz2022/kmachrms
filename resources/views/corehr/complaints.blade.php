@extends('layout.app')
@section('page-title')
Complaints
@endsection
@section('heading')
Complaints
@endsection
@section('page-label')
Complaints
@endsection
@section('page-body')

@if(Session::get('status') == 1) 
    <script type="text/javascript">
        toastr.options = {
            "icon": 'info',
           "progressBar" : true
        }
      toastr.success("{!! Session::get('message') !!}");
    </script>  
 
@endif 

@if(Session::get('status') == 2) 
    <script type="text/javascript">

        toastr.options = {
            "icon": 'info',
           "progressBar" : true
        }
      toastr.error("{!! Session::get('message') !!}");
    </script>  
 
@endif

@if(Session::get('status') == 3) 
    <script type="text/javascript">
        toastr.options = {
            "icon": 'info',
           "progressBar" : true
        }
      toastr.success(" Award Updated ");
    </script>  
 
@endif

<div class="text-right my-3">
     <button type="button" class="btn rounded-0 btn-info add-new-button">
        <i class="fa fa-plus"></i>
       Add New</button>
</div>

<div class="card add-form">
<div class="card-header"> 
  <div class="d-flex justify-content-between">
    <h5>Add New Complaints</h5>
     
  </div>
</div>    
<div class="card-body" id="add-complaints-form" > 
    <!--Add new  Form -->
    <div >
        <form method="post" action="{{ route('complaints-add') }}" id="new-complaint-form" enctype='multipart/form-data'>
             
            <div class="row">
                <div class="col-md-6">
                <p>
                <label>Company</label>
                <select name="company" class="company form form-control company" > 
                    
                    @foreach($company as $rows)
                    <option value="{{$rows->company_id}}">{{ $rows->trading_name}}</option>
                    @endforeach
                </select>
                </p> 
                <p>
                <label>Complaint from</label>
                <select name="complaint-from" class="form form-control">
                    @foreach($employee as $rows)
                    <option value="{{$rows->employee_id}}">{{ $rows->first_name .' '.$rows->last_name }}</option>
                    @endforeach
                </select>
                </p> 
                <div class="row">
                    <div class="col-6">
                        <label>Complaint Title</label>
                         <input type="text" name="title" class="form form-control" placeholder="Complaint Title">
                    </div>
                    <div class="col-6">
                        <label>Complaint Date</label>
                         <input type="date" name="complaint-date" class="form form-control">
                    </div>
                     <div class="col-6">
                        <label>Attachment</label>
                         <input type="file" name="attachment" class="form form-control">
                    </div>
                </div>
               
                </div> <br> 
                <div class="col-md-6">
                    <p>
                    <label>Description</label>
                    <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                    </p>
                    <p>
                    <label>Complaint Against</label>
                    <select class="form-control employee" name="complaint-against">
                        @foreach($employee as $rows)
                        <option value="{{$rows->employee_id}}">{{ $rows->first_name .' '.$rows->last_name}}</option>
                        @endforeach
                    </select>
                    </p> 
                </div> 
               
                <div class="col-md-12 mt-3 text-right">
                    <button type="submit" class="btn btn-primary ">
                        <i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            </div>
           
        </form>
    </div>
</div>
</div>

<div class="mt-3">
<div class="card   mb-4">
    <div class="card-header py-3">
        <span>
             <strong class="m-0 font-weight-bold text-primary" >List All Complaints</strong>
        </span> 
         
    </div>
    <div class="card-body">
<div class="table-responsive">
<table id="example1" class="table table-bordered table-sm" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th><i class="fa fa-user"></i> Complaint From</th>
        <th><i class="fa fa-user"></i> Complaint Against</th>
        <th>Company</th>
        <th>Complaint Title</th>
        <th><i class="fa fa-calendar"></i> Complaint Date</th>  
    </thead>  
    <tbody>
    @foreach($table as $row)   
    <tr>
        <td> 
            <a href="javascript:void(0)" class="edit btn btn-info btn-sm" value="{{$row->complaint_id}}" data-toggle="modal" data-target="#exampleModal">
                <i class="fa fa-edit"></i>
            </a>
            <a href="javascript:void(0)" class="show btn btn-info btn-sm" value="{{$row->complaint_id}}" data-toggle="modal" data-target="#showmodal">  <i class="fa fa-eye"></i>
                </a>
          
            <a href="{{ route('complaints-delete', $row->complaint_id) }}" class="delete btn btn-danger btn-sm"  >
                <i class="fa fa-trash-alt"></i>
            </a>
        </td>
        <td>{{ $row->first_name.' '.$row->last_name }}</td>
        <td>{{ $row->first_name.' '.$row->last_name }}</td>
        <td>{{ $row->trading_name }}</td>
        <td>{{ $row->title }}</td>
        <td>{{ $row->complaint_date }}</td>
       
    </tr>
    @endforeach       
    </tbody> 
   
</table>
</div>
</div>
</div>    
</div>
<section>
    <div class="modal fade" id="showmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Show</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     
      </div>
      
    </div>
  </div>
</div>
</section>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form method="post" action="{{ route('complaints-update') }}" >
            @csrf
            <div class="row">
                <div class="col-md-6">
                    <input type="hidden" name="id" class="id" >
                <p>
                <label>Company</label>
                <select name="company" class="company form form-control company" > 
                    
                    @foreach($company as $rows)
                    <option value="{{$rows->company_id}}">{{ $rows->trading_name}}</option>
                    @endforeach
                </select>
                </p> 
                <p>
                <label>Complaint from</label>
                <select name="complaint-from" class="form form-control">
                    @foreach($employee as $rows)
                    <option value="{{$rows->employee_id}}">{{ $rows->first_name .' '.$rows->last_name }}</option>
                    @endforeach
                </select>
                </p> 
                <div class="row">
                    <div class="col-6">
                        <label>Complaint Title</label>
                         <input type="text" name="title" class="form form-control" placeholder="Complaint Title">
                    </div>
                    <div class="col-6">
                        <label>Complaint Date</label>
                         <input type="date" name="complaint-date" class="form form-control">
                    </div>
                     <div class="col-6">
                        <label>Attachment</label>
                         <input type="file" name="attchament" class="form form-control">
                    </div>
                </div>
               
                </div> <br> 
                <div class="col-md-6">
                    <p>
                    <label>Description</label>
                    <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                    </p>
                    <p>
                    <label>Complaint Against</label>
                    <select class="form-control employee" name="complaint-against">
                        @foreach($employee as $rows)
                        <option value="{{$rows->employee_id}}">{{ $rows->first_name .' '.$rows->last_name}}</option>
                        @endforeach
                    </select>
                    </p> 
                </div> 
               
                <div class="col-md-12 mt-3 text-right">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary ">
                        <i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            </div>
           
        </form>
      </div> 
    </div>
  </div>
</div>
<script>
 $(document).ready(function(){
    $.ajaxSetup({
            headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
    });

    $('.add-form').hide();
        $(document).on('click','.add-new-button', function(){
        $('.add-form').slideToggle();
    });

    //add new
    $(document).on('submit', '#new-complaint-form', function(e){ 
        e.preventDefault();
        $url = $(this).attr('action');
        $data = $(this).serialize();
        e.preventDefault();
        $.ajax({
            url : $url,
            type : 'post',
            data : new FormData(this),
            contentType: false, 
            cache: false, 
            processData:false,
            dataType : 'json',

            success : function(response){ 
                toastr.success('Award Added');
            },
            error: function(err){  
                  $.each(err.responseJSON.errors, function(key ,value){
                    toastr.options = { 
                            "progressBar" : true
                    } 
                    toastr.error(value);
                  });   
            }

        });
    });
    //show 
    $(document).on('click', '.show',function(e){
        e.preventDefault();
        $id = $(this).attr('value')
        $.ajax({
            url : '{{ url("complaints/show") }}'+'/'+$id,
            type :'post',
            dataType:'Json',
            success : function(data) {
                $.each(data, function(key, value){
                    
                });
            }
        });
    });

    $(document).on('click', '.edit', function(e){
            
            var $id = $(this).attr('value');
            console.log($id);
            $.ajax({
                url : '{{ url("complaints/edit") }}'+'/'+$id,
                type: 'post', 
                dataType: 'Json',
                success:function(data){
                    console.log(data);
                    $.each(data, function(key , value){

                          $('.id').val(value.complaint_id);
                        // $('.gift').val(value.gift_item);
                        // $('.cash').val(value.cash_item);
                        // $('.description').val(value.description);
                        // $('.months-year').val(value.award_month_year);
                        // $('.award-information').val(value.award_information);
                    });
                }
            }); 
              
        });
            
});
</script>
@endsection