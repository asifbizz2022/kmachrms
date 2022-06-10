@extends('layout.app')
@section('page-title')
Promotions
@endsection

@section('heading')
Promotions
@endsection

@section('page-label')
Promotions
@endsection
@section('page-body')
 
@if(Session::get('status') == 1) 
    <script type="text/javascript">
        toastr.options = {
           
           "progressBar" : true
        }
      toastr.success("{!! Session::get('message') !!}");
    </script>  
 
@endif 

@if(Session::get('status') == 2) 
    <script type="text/javascript">
        toastr.options = {
           
           "progressBar" : true
        }
      toastr.error("{!! Session::get('message') !!}");
    </script>  
 
@endif

@if(Session::get('status') == 3) 
    <script type="text/javascript">
        toastr.options = {
           
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
    <h3 class="card-title">Add New Promotions</h3>  
    
  </div>
</div> 
<div class="card-body"  > 
    <!--Add new  Form -->
    <div >
        <form method="post" action="{{ route('promotions-add') }}"  >
            @csrf
            <div class="row">
                <div class="col-md-6">
                <p>
                <label>Company</label>
                <select name="company" class="company form form-control">
                   
                    @foreach($company as $row) 
                    <option value="{{$row->company_id}}">{{ $row->trading_name }}</option>
                    @endforeach
                </select>
                </p> 
               
                <div class="row">
                    <div class="col-6">
                        <label>Promotion For</label>
                        <select name="promotion-for" class="form form-control employee">
                            @foreach($employee as $row) 
                            <option value="{{$row->employee_id}}">{{ $row->first_name.' '.$row->last_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label>Designation</label>
                        <select name="designation" class="form form-control">
                          @foreach($designation as $row)
                            <option>{{$row->designation_name}}</option>
                            @endforeach
                        </select>
                    </div>
                   
                    <div class="col-6 mt-3">
                        <label>Promotion Title</label>
                         <input type="text" name="promotion-title" class="form form-control">
                    </div>
                 
                     <div class="col-6 mt-3">
                        <label>Promotion Date</label>
                         <input type="date" name="promotion-date" class="form form-control">
                    </div>
                </div>
               
                </div>   
                <div class="col-md-6">
                    <p>
                    <label>Description</label>
                    <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                    </p> 
                </div> 
               
                <div class="col-md-12 mt-3 text-right">
                    <button type="submit" class="btn btn-primary "><i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            </div>
           
        </form>
    </div>
</div>
</div>

<div class="mt-3">
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <span>
             <strong class="m-0 font-weight-bold text-primary" >List All Promotions</strong>
        </span> 
        
    </div>
    <div class="card-body">
<div class="table-responsive">
<table id="example1" class="table table-bordered table-sm" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th><i class="fa fa-user"></i> Employee Name</th>
        <th> Company</th>
        <th>Promotion Title</th> 
        <th><i class="fa fa-calendar"></i> Date</th>  
    </thead>  
    <tbody>
    @foreach($table as $row) 
    <tr>
        <td>
            <a href="javascript:void(0)" class="edit btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModal" value="{{$row->promotion_id}}" >
                <i class="fa fa-edit"></i>
            </a>
            <a href="javascript:void(0)" class="show btn btn-info btn-sm" value=" " data-toggle="modal" data-target="#showmodal"> <i class="fa fa-eye"></i>
                </a>
           

            <a href="{{ route('promotions-delete' , $row->promotion_id) }}" class="delete btn btn-danger btn-sm"  >
                <i class="fa fa-trash-alt"></i>
            </a>
        </td>
        <td>{{$row->first_name .' '. $row->last_name}}</td>
        <td>{{$row->trading_name}}</td>
        <td>{{$row->title}}</td> 
        <td>{{$row->promotion_date}}</td>
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
<section>
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
         <form method="post" action="{{ route('promotions-update') }}"  >
            @csrf
            <div class="row">
                <div class="col-md-6">
                    <input type="hidden" name="id" class="id">
                <p>
                <label>Company</label>
                <select name="company" class="company form form-control">
                     
                    @foreach($company as $row) 
                    <option value="{{$row->company_id}}">{{ $row->trading_name }}</option>
                    @endforeach
                </select>
                </p> 
               
                <div class="row">
                    <div class="col-6">
                        <label>Promotion For</label>
                        <select name="promotion-for" class="form form-control employee">
                            @foreach($employee as $row) 
                            <option value="{{$row->employee_id}}">{{ $row->first_name.' '.$row->last_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label>Designation</label>
                        <select name="designation" class="form form-control">
                          @foreach($designation as $row)
                            <option>{{$row->designation_name}}</option>
                            @endforeach
                        </select>
                    </div>
                   
                    <div class="col-6 mt-3">
                        <label>Promotion Title</label>
                         <input type="text" name="promotion-title" class="form form-control">
                    </div>
                 
                     <div class="col-6 mt-3">
                        <label>Promotion Date</label>
                         <input type="date" name="promotion-date" class="form form-control">
                    </div>
                </div>
               
                </div>   
                <div class="col-md-6">
                    <p>
                    <label>Description</label>
                    <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                    </p> 
                </div> 
               
                <div class="col-md-12 mt-3 text-right">  
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary "><i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            </div>
           
        </form>
      </div>
      
    </div>
  </div>
</div>
</section>
<script>
   $(document).ready(function(){
    $.ajaxSetup({
            headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
        });
        $('.del-msg').fadeOut('slow').delay(10000);
        $('.add-form').hide();
        $(document).on('click','.add-new-button', function(){
           $('.add-form').slideToggle();
        });

        $(document).on('click', '.edit', function(e){
            
            var $id = $(this).attr('value');
            console.log($id);
            $.ajax({
                url : '{{ url("promotions/edit") }}'+'/'+$id,
                type: 'post', 
                dataType: 'Json',
                success:function(data){
                    console.log(data);
                    $.each(data, function(key , value){

                          $('.id').val(value.promotion_id);
                        // $('.gift').val(value.gift_item);
                        // $('.cash').val(value.cash_item);
                        // $('.description').val(value.description);
                        // $('.months-year').val(value.award_month_year);
                        // $('.award-information').val(value.award_information);
                    });
                }
            }); 
              
        });


        $(document).on('change','.company', function(){
             var optVal = $(".company option:selected").val();
             console.log($(this).val()); 
             
             $.ajax({
                url : '{{ url("/dependent") }}'+'/'+optVal,
                type : 'get',
                dataType : 'json',
                success : function(data){
                     
                    $.each(data, function(key ,value){
                         $('.employee').append('<option value='+value.user_id+'>'+value.first_name+' '+value.last_name+'</option>');
                    });
                }
             });
             
        });
    });
</script>
@endsection