@extends('layout.app')
@section('page-title')
Warnings
@endsection

@section('heading')
Warnings
@endsection

@section('page-label')
Warnings
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
      toastr.success(" Warning Updated ");
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
      <h6 class=" ">Add New Warning<h6>  
  </div>   
</div> 
<div class="card-body" id="warnings-form">
    
    <!--Add new  Form -->
    <div >
        <form method="post" action="{{ route('warnings-add') }}" >
            @csrf
            <div class="row">
                <div class="col-md-6">
                <p>
                <label>Company</label>
                <select name="company" class="form form-control company">
                     
                    @foreach($company as $row)
                    <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                    @endforeach
                </select>
                </p> 
                 <p>
                <label>Warning To</label>
                <select name="warning-to" class="form form-control warning-to" placeholder="Warning To">
                    @foreach($employee as $row)
                    <option value="{{$row->first_name .' '.$row->last_name}}">{{$row->first_name .' '.$row->last_name}}</option>
                    @endforeach
 
                </select>
                </p> 
                 
                </div>   
                <div class="col-md-6">
                    <p>
                    <label>Description</label>
                    <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                    </p> 
                </div> 
               
            </div>
            <div class="row">
                <div class="col-md-3">
                 <p>
                <label>Warning Type</label>
                <select name="warning-type" class="form form-control">
                    @foreach($warning as $row)
                    <option>{{ $row->type }}</option>
                    @endforeach
                </select>
                </p>    
                </div>
                <div class="col-md-3">
                 <p>
                <label>Subject</label>
                <input type="text" name="subject" class="form form-control" placeholder="Subject">
                </p>    
                </div>
                <div class="col-md-3">
                 <p>
                <label>Warning By</label>
                <select name="warning-by" class="warning-by form form-control">
                    @foreach($employee as $row)
                    <option value="{{$row->first_name .' '.$row->last_name}}">{{$row->first_name .' '.$row->last_name}}</option>
                    @endforeach
                </select>
                </p>    
                </div>
                <div class="col-md-3">
                <p>
                    <label>Warning Date</label>
                    <input type="date" name="warning-date" class="form form-control">
                </p>    
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label>Attachments</label><br>
                    <input type="file" name="attachment" class="form-control-input">
                </div>
            </div>
            <div class="col-md-12 mt-3 text-right">
                    <button type="submit" class="btn btn-primary ">
                        <i class="fa fa-check-square mr-1"></i>
                    Save</button>
                </div>
        </form>
    </div>
</div>
</div>

<div class="mt-3">
<div class="card mb-4">
    <div class="card-header py-3">
        <span>
             <strong class="m-0 font-weight-bold text-primary" >List All Warnings</strong>
        </span> 
         
    </div>
    <div class="card-body">
<div class="table-responsive">
<table id="example5" class="table table-bordered table-sm" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th><i class="fa fa-user"></i> Employee Name</th>
        <th> Company</th> 
        <th><i class="fa fa-calendar"></i> Warning Date</th>
        <th>Subject</th>
        <th><i class="fa fa-user"></i> Warning By</th>
    </thead>  
    <tbody>
        @foreach($table as $row)
    <tr>
       <td> 
            <a href="javascript:void(0)" class="edit btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModal"  value="{{$row->warning_id}}" >
                <i class="fa fa-edit" ></i>
            </a>
            <a href="javascript:void(0)" class="show btn btn-info btn-sm" value="" data-toggle="modal" data-target="#showmodal">
     
            <i class="fa fa-eye"></i>
            </a>
            <a href="{{ route('warnings-delete', $row->warning_id) }}" class="delete btn btn-danger btn-sm"  >
                <i class="fa fa-trash-alt"></i>
            </a>
        </td>
        <td>{{$row->warning_to }}</td>
        <td>{{$row->trading_name}}</td>
        <td>{{$row->warning_date}}</td> 
        <td>{{$row->subject}}</td>
        <th>{{$row->warning_by}}</th>
    </tr>
        @endforeach
    </tbody> 
   
</table>
</div>
</div>
</div>    
</div>
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
         <form method="post" action="{{ route('warnings-update') }}" >
            @csrf
            <div class="row">
                <div class="col-md-6">
                    <input type="hidden" name="id" class="id">
                <p>
                <label>Company</label>
                <select name="company" class="form form-control company"> 
                    @foreach($company as $row)
                    <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                    @endforeach
                </select>
                </p> 
                 <p>
                <label>Warning To</label>
                <select name="warning-to" class="form form-control warning-to" placeholder="Warning To">
                    @foreach($employee as $row)
                    <option value="{{$row->first_name .' '.$row->last_name}}">{{$row->first_name .' '.$row->last_name}}</option>
                    @endforeach
 
                </select>
                </p> 
                 
                </div>   
                <div class="col-md-6">
                    <p>
                    <label>Description</label>
                    <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                    </p> 
                </div> 
               
            </div>
            <div class="row">
                <div class="col-md-3">
                 <p>
                <label>Warning Type</label>
                <select name="warning-type" class="form form-control">
                    @foreach($warning as $row)
                    <option>{{ $row->type }}</option>
                    @endforeach
                </select>
                </p>    
                </div>
                <div class="col-md-3">
                 <p>
                <label>Subject</label>
                <input type="text" name="subject" class="form form-control" placeholder="Subject">
                </p>    
                </div>
                <div class="col-md-3">
                 <p>
                <label>Warning By</label>
                <select name="warning-by" class="warning-by form form-control">
                    @foreach($employee as $row)
                    <option value="{{$row->first_name .' '.$row->last_name}}">{{$row->first_name .' '.$row->last_name}}</option>
                    @endforeach
                </select>
                </p>    
                </div>
                <div class="col-md-3">
                <p>
                    <label>Warning Date</label>
                    <input type="date" name="warning-date" class="form form-control">
                </p>    
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label>Attachments</label><br>
                    <input type="file" name="attachment" class="form-control-input">
                </div>
            </div>
            <div class="col-md-12 mt-3 text-right">
                 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary ">
                        <i class="fa fa-check-square mr-1"></i>
                    Save</button>
                </div>
        </form>
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

        $(document).on('change','.company', function(){
             var optVal = $(".company option:selected").val();
             console.log($(this).val()); 
             
             $.ajax({
                url : '{{ url("/dependent") }}'+'/'+optVal,
                type : 'get',
                dataType : 'json',
                success : function(data){
                     
                    $.each(data, function(key ,value){
                         $('.employee ').append('<option value='+value.user_id+'>'+value.first_name+' '+value.last_name+'</option>');
                    });
                }
             });
             
        });
    
        $(document).on('click', '.edit', function(e){
            
            var $id = $(this).attr('value');
            console.log($id);
            $.ajax({
                url : '{{ url("warnings/edit") }}'+'/'+$id,
                type: 'post', 
                dataType: 'Json',
                success:function(data){
                    
                    $.each(data, function(key , value){ 
                          $('.id').val(value.warning_id);
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
    $('.add-form').hide();
         

        $(document).on('click','.add-new-button', function(){
           $('.add-form').slideToggle();
        });
        
</script>
@endsection