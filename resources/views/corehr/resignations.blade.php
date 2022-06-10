@extends('layout.app')
@section('heading')
Resignation
@endsection

@section('title')
Resignation
@endsection

@section('page-label')
Resignation
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

    @if ($message = Session::get('message'))
        <div class="w-25 del-msg text-center m-3">
            <span class="alert alert-danger">Deleted Successfully</span>
        </div>
    @endif

<div class="card add-form">
    <div class="card-header"> 
       <div class="d-flex justify-content-between">
        <h5 >Add New Resignation</h5> 
       
      </div>
    </div>  
    <div class="card-body  " id="resignation-form"> 
        <!--Add new  Form -->
        <div>
            <form method="post" action="{{ route('resignation-add') }}" id="add-resignation-form">
                @csrf
                <div class="row">
                    <div class="col-md-6">

                    <p>
                    <label>Company</label>
                    <select class="form form-control" name="company">
                        @foreach($company as $row)
                        <option value="{{$row->company_id}}">{{ $row->trading_name}}</option>
                        @endforeach
                    </select>
                    </p> 
                    <p>
                   <label>Resigning Employee</label>
                    <select class="form form-control" name="resigning-employee">
                         @foreach($employee as $row)
                        <option value="{{$row->employee_id}}">
                           {{$row->first_name .' '.$row->last_name }}
                        </option>
                        @endforeach
                    </select>
                    </p> 
                    <div class="row">
                        <div class="col-12">
                            <label>Notice Date</label>
                            <input type="date" name="notice-date" class="form form-control">
                        </div>
                     
                    </div>
                    
                    </div>
                    <div class="col-md-6">
                        <label>Resignation Reason</label>
                        <textarea  name="resignation-reason" rows="5" cols="10" class="form form-control" placeholder="Resignation Reason"></textarea>
                        <p>
                        <label>Resignation Date</label>
                        <input type="date" name="Resignation-date" class="form form-control">
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
             <strong class="m-0 font-weight-bold text-primary" >List All Resignation</strong>
        </span> 
         
    </div>
    <div class="card-body">
<div class="table-responsive">
<table id="example1" class="table table-bordered table-sm" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th><i class="fa fa-trophy"></i> Employee Name</th>
        <th> Company</th>
        <th><i class="fa fa-calendar"></i> Notice Date</th> 
        <th><i class="fa fa-calendar"></i> Resignation Date</th>  
    </thead>  
    <tbody>
        @foreach($table as $row)
    <tr>
        <td>
        <a href="javascript:void(0)" class="edit btn btn-info btn-sm"
        data-toggle="modal" data-target="#exampleModal" value="{{$row->resignation_id}}" >
            <i class="fa fa-edit"></i>
        </a>

        <a href="javascript:void(0)" class="show btn btn-info btn-sm" value=" " data-toggle="modal" data-target="#showmodal"> <i class="fa fa-eye"></i>
            </a>
       


        <a href="{{ route('resignation-delete',$row->resignation_id ) }}" class="delete btn btn-danger btn-sm" value="{{$row->resignation_id}}">
            <i class="fa fa-trash-alt"></i>
        </a>
        </td>
        <td><span>{{$row->first_name}}</span>&nbsp;<span>{{$row->last_name}}</span></td>
        <td>{{$row->trading_name}}</td>
        <td>{{$row->notice_date}}</td>
        <td>{{$row->resignation_date}}</td> 
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
       <div>
            <form method="post" action="{{ route('resignation-update') }}"  >
                @csrf
                <div class="row">
                    
                    <div class="col-md-6"> <input type="text" name="id" class="rid"  >
                    <p>
                    <label>Company</label>
                    <select class="form form-control" name="company">
                        @foreach($company as $row)
                        <option value="{{$row->company_id}}">{{ $row->trading_name}}</option>
                        @endforeach
                    </select>
                    </p> 
                    <p>
                   <label>Resigning Employee</label>
                    <select class="form form-control" name="resigning-employee">
                         @foreach($employee as $row)
                        <option value="{{$row->employee_id}}">
                           {{$row->first_name .' '.$row->last_name }}
                        </option>
                        @endforeach
                    </select>
                    </p> 
                    <div class="row">
                        <div class="col-12">
                            <label>Notice Date</label>
                            <input type="date" name="notice-date" class="form form-control">
                        </div>
                     
                    </div>
                    
                    </div>
                    <br>
                    <div class="col-md-6">
                        <label>Resignation Reason</label>
                        <textarea  name="resignation-reason" rows="5" cols="10" class="resignation-reason form form-control" placeholder="Resignation Reason"></textarea>
                        <p> 
                        <label>Resignation Date</label>
                        <input type="date" name="Resignation-date" class="form form-control">
                        </p>
                       
                    </div> 
                   
                    <div class="col-md-12 mt-3 text-right">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary ">
                            <i class="fa fa-check-square mr-1"></i>Save</button>
                    </div>
                </div>
               
            </form>
        </div>
      </div>
       
    </div>
  </div>
</div>   
 
<script>
  $(document).ready(function(){
    $('.del-msg').fadeOut('slow').delay(5000);
        $.ajaxSetup({
            headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
        });

        $('.add-form').hide();
            $(document).on('click','.add-new-button', function(){
            $('.add-form').slideToggle();
        });

        $(document).on('click', '.edit', function(e){
            
            var $id = $(this).attr('value');
             
            $.ajax({
                url : '{{ url("resignation/edit") }}'+'/'+$id,
                type: 'post', 
                dataType: 'Json',
                success:function(data){
                    console.log(data);
                    $.each(data, function(key , value){
                        $('.rid').val(value.resignation_id);
                        $('.resignation-reason').val(value.reason);
                        // $('.cash').val(value.cash_item);
                        // $('.description').val(value.description);
                        // $('.months-year').val(value.award_month_year);
                        // $('.award-information').val(value.award_information);
                        console.log(value.resignation_id);
                    });
                }
            }); 
              
        });

        // $(document).on('click','.delete',function(){
        //     var id = $(this).attr('value');
        //       $.ajax({
        //         url: '{{ url("resignation/delete") }}'+'/'+id,
        //         type :'post',
        //         success : function(data){
        //             alert('deleted');
        //             location.relaod();
        //         }
        //       });
        // }); 
    });
</script>
@endsection