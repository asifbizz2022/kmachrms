@extends('layout.app')
@section('heading')
Terminations
@endsection

@section('title')
Terminations
@endsection

@section('page-label')
Terminations
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
     
    <h3 class="card-title">Add New Termination</h3> 
     
  </div>
</div> 
<div class="card-body  " id="add-form"> 
    <!--Add new  Form -->
    <div >
        <form method="post" action="{{ route('termination-add') }}" >
            @csrf
            <div class="row">
                <div class="col-md-6">
                <p>
                <label>Company Name</label>
                <select name="company" class="form form-control company">
                    <option value="0">Select Company</option>
                    @foreach($company as $row) 
                    <option value="{{$row->company_id}}">{{ $row->trading_name}}</option>
                    @endforeach
                </select>
                </p>

                <p>
                <label>Employee Terminated</label>
                <select name="employee-terminated" class="employee form form-control select2 employee">
                    <option>Employee Terminated</option>
                   
                </select>
                </p>

                <div class="row">
                    <div class="col-6">
                        <label>Notice Date</label>
                        <input type="date" name="notice-date" class="form form-control">
                    </div>
                    <div class="col-6">
                        <label>Termination Date</label>
                       <input type="date" name="termination-date" class="form form-control">
                    </div> 
                </div>
               
                </div>   
                <div class="col-md-6">
                    <p>
                    <label>Description</label>
                    <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                    </p> 
                    <p>
                        <label>Termination Type</label>
                        <select name="termination-type" class="form form-control termination-type">
                            @foreach($type as $row)
                            <option value="{{$row->termination_type_id}}">{{$row->type}}</option>
                            @endforeach
                        </select>
                    </p>
                </div> 
                 
                <div class="row">
                    <div class="col ml-2">
                    <p>
                    <label>Attachment</label>
                    <input type="file" name="attachment" class="border form-control-file">
                    </p>
                    </div>
                    <div class="col ml-2">
                    <p>
                    <label>Terminated By</label>
                    <select class="terminated-by form-control" name="terminated-by">
                    @foreach($employee as $row) 
                    <option value="{{$row->employee_id}}">{{ $row->first_name.' '.$row->last_name}}</option>
                    @endforeach
                    </select>
                    </p>
                    </div>
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
             <strong >List All Terminations</strong>
        </span> 
         
    </div>
    <div class="card-body">
<div class="table-responsive">
<table id="example1" class="table table-bordered table-sm" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th><i class="fa fa-user"></i> Employee Name</th>
        <th> Company</th>
        <th><i class="fa fa-calendar"></i> Notice Date</th> 
        <th><i class="fa fa-calendar"></i> Termination Date</th>  
    </thead>  
    <tbody>
    @foreach($table as $row)
    <tr>
        <td>
        <a href="{{ route('termination-edit',$row->termination_id ) }}" class="edit btn btn-info btn-sm"  >
            <i class="fa fa-edit"></i>
        </a>

        <a href="javascript:void(0)" class="show btn btn-info btn-sm" value="" data-toggle="modal" data-target="#showmodal">
     
        <i class="fa fa-eye"></i>
        </a>

        <a href="{{ route('termination-delete',$row->termination_id ) }}" class="delete btn btn-danger btn-sm" value="{{$row->termination_id}}">
            <i class="fa fa-trash-alt"></i>
        </a>
        </td> 
        <td>{{$row->first_name.' '.$row->last_name}}</td>
        <td>{{$row->trading_name}}</td>
        <td>{{$row->notice_date}}</td> 
        <td>{{$row->termination_date}}</td>
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
<script>
   
$(document).ready(function(){
        $.ajaxSetup({
            headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
        });

        $(document).on('click', '.edit', function(e){ 
            var $id = $(this).attr('value');
            console.log($id);
            $.ajax({
                url : '{{ url("termination/edit") }}'+'/'+$id,
                type: 'post', 
                dataType: 'Json',
                success:function(data){
                    console.log(data);
                    $.each(data, function(key , value){

                          $('.id').val(value.termination_id);
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
                         $('.employee,.terminated-by').append('<option value='+value.user_id+'>'+value.first_name+' '+value.last_name+'</option>');
                    });
                }
             });
             
        }); 
        

        $('.add-form').hide();
        $(document).on('click','.add-new-button', function(){
           $('.add-form').slideToggle();
        });
});
</script>
@endsection