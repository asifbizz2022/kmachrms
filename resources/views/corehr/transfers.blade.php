@extends('layout.app')
@section('heading')
Transfers
@endsection

@section('title')
Transfers
@endsection

@section('page-label')
Transfers
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

<section class="page-container">
 
<div class="card add-form"> 
   <div class="card-header">
        <div class="d-flex justify-content-between"> 
        <h5 class="card-title">Add New Transfer</h5>  
    </div> 
   </div>
    <div class="card-body  " id="transfers-form"> 
        <!--Add new  Form -->
        <div >
            <form method="post" action="{{ route('transfer-add') }}" class="transfer-add-form">
                 @csrf
                <div class="row">
                    @foreach($employee as $row)
                        <input type="hidden" name="employee-id" value="{{$row->company_id}}"> 

                    @endforeach
                    <div class="col-md-6">
                    <p>
                    <label>Company</label>
                    <select name="company" class="form form-control company">
                        @foreach($company as $row) 
                        <option value="{{ $row->company_id }}">{{ $row->trading_name }}</option>
                        @endforeach
                    </select>
                    </p> 
                     <p>
                    <label>Employee to Transfer</label>
                    <select name="employee-to-transfer" class="form form-control employee">
                        @foreach($employee as $row)
                        <option value="{{ $row->employee_id }}">{{ $row->first_name }}{{ $row->last_name }}</option>
                        @endforeach
                    </select>
                    </p> 
                     <p>
                    <label>Transfer Date</label>
                    <input type="date" name="transfer-date" class="form-control">
                    </p> 
                    </div>   
                    <div class="col-md-6">
                        <p>
                        <label>Description</label>
                        <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                             <p>
                                <label>Transfer To(Department)</label>
                                <select name="transfer-to-department" class="form form-control">
                                    @foreach($department as $row)
                                    <option value="{{ $row->department_id }}">{{$row->department_name}}</option>
                                    @endforeach
                                </select>
                            </p>   
                            </div>
                            <div class="col-md-6">
                             <p>
                                <label>Transfer To(Location)</label>
                                <select name="transfer-to-location" class="form form-control">
                                    @foreach($location as $row)
                                    <option value="{{ $row->location_id }}">{{$row->location_name}}</option>
                                    @endforeach
                                </select>
                            </p>   
                            </div>
                        </div>
                     
                    </div> 
                    <div class="col-md-12 mt-3 text-right">
                        <button type="submit" class="btn btn-primary ">
                            <i class="fa fa-check-square mr-1"></i>
                        Save</button>
                    </div>
                </div>
               
            </form>
        </div>
    </div>
</div>

<div class="mt-3">
    <div class="card   mb-4  ">
        <div class="card-header py-3">
            <span>
                 <strong class="m-0 font-weight-bold text-primary" >List All Transfers</strong>
            </span> 
             
        </div>
        <div class="card-body"> 
            <table id="example1" class="table table-bordered table-sm" width="100%" cellspacing="0">
                <thead> 
                    <th><i class="fa fa-cog"></i> Action</th>
                    <th><i class="fa fa-user"></i> Employee Name</th>
                    <th> Company</th> 
                    <th><i class="fa fa-calendar"></i> Transfer Date</th>
                    <th>Status</th> 
                </thead>  
                <tbody>
                @foreach($table as $rows)
                <tr>
                    <td>
                        <a href="{{ route('transfer-edit', $rows->transfer_id) }}" class="edit btn btn-info btn-sm" value="{{$rows->transfer_id}}" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="javascript:void(0)" class="show btn btn-info btn-sm" value="" data-toggle="modal" data-target="#showmodal">
     
                        <i class="fa fa-eye"></i>
                        </a>

                        <a href="{{ route('transfer-delete',$rows->transfer_id) }}" class="delete btn btn-danger btn-sm" value="{{$rows->transfer_id}}">
                            <i class="fa fa-trash-alt"></i>
                        </a>
                    </td>
                    <td>{{ $rows->first_name }}{{ $rows->last_name }}</td>
                    <td>{{ $rows->trading_name }}</td>
                    <td>{{ $rows->trading_name }}</td> 
                    <td>{{ $rows->transfer_date}}</td>
                </tr>
                @endforeach
                </tbody> 
            </table> 
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
        <form method="post" action="{{ route('transfer-update') }}">
                 @csrf
        <div class="row"> 
               
            <div class="col-md-6">
            <p>
            <label>Company</label>
            <input type="hidden" class="id" name="id" >  
            <select name="company" class="company form form-control"> 
                  @foreach($company as $row) 
                        <option value="{{ $row->company_id }}">{{ $row->trading_name }}</option>
                        @endforeach
            </select>
            </p> 
             <p>
            <label>Employee to Transfer</label>
            <select name="employee-id" class="employee-to-transfer form form-control">
                  @foreach($employee as $row)
                        <option value="{{$row->employee_id}}">{{ $row->first_name }}{{ $row->last_name }}</option>
                        @endforeach
            </select>
            </p> 
             <p>
            <label>Transfer Date</label>
            <input type="date" name="transfer-date" class="transfer-date form-control">
            </p> 
            </div>   
            <div class="col-md-6">
                <p>
                <label>Description</label>
                <textarea  name="description" rows="5" cols="10" class="description form form-control" placeholder="Description"></textarea>
                </p>
                <div class="row">
                    <div class="col-md-6">
                     <p>
                        <label>Transfer To(Department)</label>
                        <select name="transfer-to-department" class="transfer-to-department form form-control">
                          @foreach($department as $row)
                                    <option value="{{ $row->department_id }}">{{$row->department_name}}</option>
                                    @endforeach
                        </select>
                    </p>   
                    </div>
                    <div class="col-md-6">
                     <p>
                        <label>Transfer To(Location)</label>
                        <select name="transfer-to-location" class="transfer-to-location form form-control"> 
                           @foreach($location as $row)
                                    <option value="{{ $row->location_id }}">{{$row->location_name}}</option>
                                    @endforeach 
                        </select>
                    </p>   
                    </div>
                </div> 
            </div> 
            <div class="col-md-12 mt-3 text-right">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary ">
                    <i class="fa fa-check-square mr-1"></i>
                Save</button>
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
        
        //store 
        $(document).on('submit', '.transfer-add-form', function(e){ 

        $url = $(this).attr('action');
        $data = $(this).serialize();
        e.preventDefault();
        $.ajax({
            url : $url,
            type : 'post',
            data :$data,
          
            dataType : 'json',

            success : function(response){ 
                toastr.success(response.message);
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

        $(document).on('click','.edit',function(){ 
            var id = $(this).attr('value');
            $.ajax({
                url: '{{ url("transfer/edit") }}'+'/'+id,
                type :'post',
                dataType:'json',
                success : function(data){
                    console.log(data);
                    $.each(data, function(key ,value){
                        $('.description').val(value.description);
                        $('.id').val(value.transfer_id);

                    });
                }
              });
        });

         

        $(document).on('click','.delete',function(){
            var id = $(this).attr('value');
              $.ajax({
                url: '{{ url("transfer/delete") }}'+'/'+id,
                type :'post',
                success : function(data){
                     toastr.options = { 
                            "progressBar" : true
                    } 
                    toastr.error(data);
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