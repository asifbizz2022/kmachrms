@extends('layout.app')
@section('heading')
 Awards
@endsection

@section('title')
Awards

@endsection

@section('page-label')
 Awards
@endsection
@section('page-body')
 
<section class="body">
    <div class="text-right my-3">
     <button type="button" class="btn rounded-0 btn-info add-new-button">
        <i class="fa fa-plus"></i>
       Add New
    </button>
    </div>

    <div class="card add-form">
        <div class="card-header"> 
          <div class="d-flex justify-content-between">
             <h5 >Add New Awards</h5>  
          </div>
        </div> 
        <div class="card-body add-award-form" id='add-award-form'> 
            <form method="post" action="{{ route('add-awards') }}" id="new-award-add" enctype="multipart/form-data">
             @csrf
            <div class="row">
                <div class="col-md-6">
                <p>
                <label>Company</label>
                <select class="form-control company" name="company" id="company">
                    
                    @foreach($companies as $row) 
                    <option value="{{$row->company_id}}">{{$row->trading_name}}</option> 
                    @endforeach
                </select>
                </p> 
                <p>
                <label>Employee</label>
                <select class="form-control employee" name="employee" id="employee"> 
                   
                    @foreach($employee as $row)
                        <option value="{{ $row->user_id }}">{{$row->first_name }} {{ $row->last_name}}</option>
                    @endforeach
                </select>
                </p> 
                <div class="row">
                    <div class="col-6">
                        <label>Award Type</label>
                        <select class="form-control" name="award_type">

                            @foreach($award_type as $row)
                            <option selected="selected" value="{{$row->award_type_id}}">
                                {{$row->award_type_id}}
                            </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label>Date</label>
                         <input type="date" name="date" class="form form-control">
                    </div>
                </div>
                <br>
                
                <div class="row">
                    <div class="col-6">
                        <label>Gift</label> 
                        <input type="text" name="gift" class="form form-control" placeholder="Gift">
                    </div>
                    <div class="col-6">
                        <label>Cash</label>
                        <input type="text" name="cash" class="form form-control" placeholder="Cash">
                    </div>
                </div>
                
                </div>
                <div class="col-md-6">
                    <label>Description</label>
                    <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                    <p>
                    <label>Months & Year</label>
                    <input type="date" name="months-year" class="form form-control" placeholder="Months and Year">
                    </p>
                    <p>
                    <label>Award Photo</label> 
                    <input type="file" name="photo" class="form form-control-file" placeholder="Award Photo">
                    </p>
                </div>
                <div class="col-md-12">
                    <label>Award Information</label>
                    <textarea  name="award-information" rows="5" cols="10" class="form form-control" placeholder="Award Information"></textarea>
                </div>

                <div class="col-md-12 mt-3 text-right">
                    <button type="submit" class="btn btn-primary "><i class="fa fa-check-square mr-1"></i> Save</button>
                </div>
            </div>
                   
            </form>
        </div> 
    </div> 
<div class="mt-3 ">
    <div class="card   mb-4">
        <div class="card-header py-3">
            <span>
                 <strong class="m-0 font-weight-bold text-primary" >List All Awards</strong>
            </span> 
           
        </div>
        <div class="card-body">
    <div class="table-responsive">
    <table id="example1" class="table table-bordered table-sm" width="100%" cellspacing="0">
        <thead> 
           
            <th><i class="fa fa-trophy"></i> Award Name</th>
            <th><i class="fa fa-user"></i> Name</th>
            <th>Company</th>
            <th><i class="fa fa-gift"></i> Gift</th>
            <th><i class="fa fa-calendar"></i> Months & Year</th>  
        </thead>  
        <tbody  >
             
        @foreach($result as $row)
        <tr>
            <td>
                <a href="javascript:void(0)" class="edit btn btn-info btn-sm" value="{{$row->award_id}}" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="javascript:void(0)" class="show btn btn-info btn-sm" value="{{$row->award_id}}" data-toggle="modal" data-target="#showmodal">
                    <i class="fa fa-eye"></i>
                </a>
                <a href="javascript:void(0)" value="{{ $row->award_id }}" class="delete btn btn-danger btn-sm"  >
                    <i class="fa fa-trash-alt"></i>
                </a>
            </td>
           
            <td>{{$row->name}}</td>
            <td>{{$row->company_id}}</td>
            <td>{{$row->gift_item}}</td>
            <td>{{$row->award_month_year}}</td>
        </tr>

        @endforeach
        </tbody> 
       
    </table>
    </div>
    </div>
    </div>    
</div>
</section> 
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
     <table class="table table-sm table-bordered">
         <tr>
             <td>
                 table
             </td>
         </tr>
     </table>
      </div> 
    </div>
  </div>
</div>
        
</section>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Awards</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form method="post" action="{{ route('update-awards') }}" id="add-awards-form" enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-md-6">
            <p>
                <input type="hidden" name="id" class='id'>
            <label>Company</label>
            <select class="form-control company" name="company" id="company">
                
                @foreach($companies as $row) 
                <option value="{{$row->company_id}}">{{$row->trading_name}}</option> 
                @endforeach
            </select>
            </p> 
            <p>
            <label>Employee</label>
            <select class="form-control employee" name="employee" id="employee"> 
               
                @foreach($employee as $row)
                    <option value="{{ $row->user_id }}">{{$row->first_name }} {{ $row->last_name}}</option>
                @endforeach
            </select>
            </p> 
            <div class="row">
                <div class="col-6">
                    <label>Award Type</label>
                    <select class="form-control" name="award-type">
                        @foreach($award_type as $row)
                        <option value="{{$row->award_type_id}}">
                            {{$row->award_type_id}}
                        </option>
                        @endforeach
                    </select>
                </div>
                <div class="col-6">
                    <label>Date</label>
                     <input type="date" name="date" class="form form-control">
                </div>
            </div>
            <br>
            
            <div class="row">
                <div class="col-6">
                    <label>Gift</label> 
                    <input type="text" name="gift" class="gift form form-control" placeholder="Gift">
                </div>
                <div class="col-6">
                    <label>Cash</label>
                    <input type="text" name="cash" class="cash form form-control" placeholder="Cash">
                </div>
            </div>
            
            </div>
            <div class="col-md-6">
                <label>Description</label>
                <textarea  name="description" rows="5" cols="10" class="description form form-control" placeholder="Description"></textarea>
                <p>
                <label>Months & Year</label>
                <input type="date" name="months-year" class="months-year form form-control" placeholder="Months and Year">
                </p>
                <p>
                <label>Award Photo</label> 
                <input type="file" name="photo" id="photo" class="award-photo form form-control-file" placeholder="Award Photo">
                </p>
            </div>
            <br>
            <div class="col-md-12">
                <label>Award Information</label>
                <textarea  name="award-information" rows="5" cols="10" class="award-information form form-control" placeholder="Award Information"></textarea>
            </div>

            <div class="col-md-12 mt-3 text-right">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary "><i class="fa fa-check-square mr-1"></i> Save</button>
            </div>
        </div>
               
        </form>
      </div>
      
    </div>
  </div>
</div>
@foreach ($errors->all() as $error)
       <script type="text/javascript">
           toastr.error("{{ $error }}")
       </script>
@endforeach
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
           "positionClass": "toast-top-right",
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
           "positionClass": "toast-top-right",
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
    //add new record
    $(document).on('submit', '#new-award-add', function(e){ 
        e.preventDefault();
        $url = $(this).attr('action');
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
                location.relaod();
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
      
    //edit and update

     $(document).on('click', '.edit', function(e){
        
        var $id = $(this).attr('value'); 
        $.ajax({
            url : '{{ url("awards/edit") }}'+'/'+$id,
            type: 'post', 
            dataType: 'Json',
            success:function(data){
                 
                $.each(data, function(key , value){
                    $('.id').val(value.award_id);
                    $('.gift').val(value.gift_item);
                    $('.cash').val(value.cash_item);
                    $('.description').val(value.description);
                    $('.months-year').val(value.award_month_year);
                    $('.award-information').val(value.award_information);
                });
            }
        }); 
          
    });
     //display 

    $(document).on('click', '.show',function(e){
        e.preventDefault();
        $id = $(this).attr('value')
        $.ajax({
            url : '{{ url("awards/show") }}'+'/'+$id,
            type :'post',
            dataType:'Json',
            success : function(data) {
                 
                $.each(data, function(key, value){
                     
                });
            }
        });
    });
    //delete 

    $(document).on('click', '.delete', function(e){
           var $id =  $(this).attr('value');
           $.ajax({
            url : '{{ url("awards/delete") }}'+'/'+$id,
            type : 'post',
             
            success : function(data){
                toastr.error(data.message);
            }
           }); 
       
    });  
   
});   
</script>
@endsection