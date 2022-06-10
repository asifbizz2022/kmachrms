@extends('layout.app')
@section('heading')
Training List
@endsection

@section('title')
Training List
@endsection

@section('page-label')
Training List
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
      toastr.warning(" Award Updated ");
    </script>  
 
@endif

<div class="text-right"> 
    <button type="button" class="btn btn-md btn-info add-new-button"  >
      <i class="fa fa-plus"></i>
      Add New
    </button>
</div>
  

<div class="mt-3 card add-form "> 
    <div class="card-header"> 
      <div class="d-flex justify-content-between">
         <h3 class="card-title">Add New Awards</h3>
      <!--   <button type="button" class="btn btn-sm btn-info add-new-button"  >
          Add New</button> -->
      </div>
    </div>
    <div class="card-body  " id="add-org-location-form">
         
        <!--Add new  Form -->
        <div id=" ">
           <form method="post" action="{{ route('training-add') }}">
                @csrf
                <div class="row">
                    <div class="col-md-6">
                    <p>
                    <label>Company</label>
                    <select name="company" class="form form-control">
                        @foreach($company as $row)
                        <option value="{{ $row->company_id }}">{{ $row->trading_name }}</option>
                        @endforeach
                    </select>
                   
                    </p> 
                   
                    <div class="row">
                        <div class="col-6">
                            <label>Trainer Options</label>
                            <select name="trainer-option" class="form form-control">
                                <option>External</option>
                                <option>Internal</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Training Type</label>
                            <select name="training-type" class="form form-control">
                                @foreach($trainingType as $row)
                                <option value="{{$row->training_type_id}}" >{{$row->type}}</option>
                                @endforeach
                            </select>
                        </div>
                       
                        <div class="col-6 mt-3">
                            <label>Trainer</label>
                            <select name="trainer" class="form form-control">
                                @foreach($trainer as $row)
                                <option value="{{$row->trainer_id}}">{{ $row->first_name.' '.$row->last_name}}</option>
                                @endforeach
                            </select>
                        </div>
                     
                        <div class="col-6 mt-3">
                            <label>Training Cost</label>
                           <input type="text" class="form-control" name="training-cost" placeholder="Training Cost"></input>
                        </div>
                        
                        <div class="col-12 mt-3">
                            <label>Employee</label>
                            <select class="form-control" name="employee-id">
                                @foreach($employees as $row)
                                <option value="{{$row->employee_id}}">{{$row->first_name.' '.$row->last_name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                   
                    </div>   
                    <div class="col-md-6">
                        <p>
                        <label>Description</label>
                        <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                         @if ($errors->any()) 
                        @foreach ($errors->all() as $error)
                             <p class="text-danger">  {{ $error }} </p> 
                        @endforeach 
                        @endif
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Start Date</label>
                                <input type="date" name="start-date" class="form form-control">
                            </div>
                            <div class="col-md-6">
                                <label>End Date</label>
                                <input type="date" name="end-date" class="form form-control">
                            </div>
                        </div>
                    </div>
                     
                   
                    <div class="col-md-12 mt-3 text-right">
                        <button type="submit" class="btn btn-primary">
                        <i class="fa fa-check-square mr-1"></i>
                        Save</button>
                    </div>
                </div>
               
            </form>
        </div>
    </div>
</div>

<div class="mt-3">
    <div class="card   mb-4"> 
        <div class="card-body">
            <h5 class="mb-3">List All Trainings</h5>
            <div class="table-responsive">
                <table class="table table-bordered table-sm" id="example1"  >
                    <thead> 
                        <th>Action</th>
                        <th>Training Type</th>
                        <th><i class="fa fa-users"></i> Employee</th>
                        <th>Company</th> 
                        <th>Trainer</th>
                        <th><i class='fa fa-calendar-alt'></i> Training Duration</th>  
                        <th><i class='fa fa-dollar-sign'></i> Cost</th>
                    </thead>   
                    <tbody>
                        @foreach($table as $row)
                        <tr>
                        <td>
                        <a href="javascript:void(0)" class="edit btn btn-info btn-sm" value="{{$row->training_id}}" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="{{ route('training-delete',$row->training_id ) }}" class="delete btn btn-danger btn-sm" value="{{$row->training_id}}">
                            <i class="fa fa-trash-alt"></i>
                        </a>
                        </td>
                            <td>{{ $row->training_type_id}}</td>
                            <td>{{ $row->first_name.' '.$row->last_name}}</td>
                            <td>{{ $row->trading_name}}</td>
                            <td>{{ $row->first_name.' '.$row->last_name}}</td>
                            <td>{{ $row->start_date.' to '.$row->finish_date}}</td>
                            <td>{{ $row->training_cost}}</td>
                            
                        </tr>
                       @endforeach
                    </tbody> 
                   
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
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form method="post" action="{{ route('training-update') }}">
                @csrf
                <div class="row">
                    <div class="col-md-6">
                        <input type="hidden" name="id" class="tid">

                    <p>
                    <label>Company</label>
                    <select name="company" class="form form-control">
                        @foreach($company as $row)
                        <option value="{{ $row->company_id }}">{{ $row->trading_name }}</option>
                        @endforeach
                    </select>
                   
                    </p> 
                   
                    <div class="row">
                        <div class="col-6">
                            <label>Trainer Options</label>
                            <select name="trainer-option" class="form form-control">
                                <option>External</option>
                                <option>Internal</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Training Type</label>
                            <select name="training-type" class="form form-control">
                                @foreach($trainingType as $row)
                                <option value="{{$row->training_type_id}}" >{{$row->type}}</option>
                                @endforeach
                            </select>
                        </div>
                       
                        <div class="col-6 mt-3">
                            <label>Trainer</label>
                            <select name="trainer" class="form form-control">
                                @foreach($trainer as $row)
                                <option value="{{$row->trainer_id}}">{{ $row->first_name.' '.$row->last_name}}</option>
                                @endforeach
                            </select>
                        </div>
                     
                        <div class="col-6 mt-3">
                            <label>Training Cost</label>
                           <input type="text" class="traininig-cost form-control" name="training-cost" placeholder="Training Cost"></input>
                        </div>
                        
                        <div class="col-12 mt-3">
                            <label>Employee</label>
                            <select class="form-control" name="employee-id">
                                @foreach($employees as $row)
                                <option value="{{$row->employee_id}}">{{$row->first_name.' '.$row->last_name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                   
                    </div>   
                    <div class="col-md-6">
                        <p>
                        <label>Description</label>
                        <textarea  name="description" rows="5" cols="10" class="form form-control" placeholder="Description"></textarea>
                         @if ($errors->any()) 
                        @foreach ($errors->all() as $error)
                             <p class="text-danger">  {{ $error }} </p> 
                        @endforeach 
                        @endif
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Start Date</label>
                                <input type="date" name="start-date" class="form form-control">
                            </div>
                            <div class="col-md-6">
                                <label>End Date</label>
                                <input type="date" name="end-date" class="form form-control">
                            </div>
                        </div>
                    </div>
                     
                   
                    <div class="col-md-12 mt-3 text-right">
                         <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">
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


    $(document).on('click', '.edit', function(e){
        
        var $id = $(this).attr('value');
        console.log($id);
        $.ajax({
            url : '{{ url("training/edit") }}'+'/'+$id,
            type: 'post', 
            dataType: 'Json',
            success:function(data){
                console.log(data);
                $.each(data, function(key , value){

                      $('.tid').val(value.training_id);
                      console.log(value.training_id);
                     $('.traininig-cost').val(value.training_cost);
                    // $('.cash').val(value.cash_item);
                    // $('.description').val(value.description);
                    // $('.months-year').val(value.award_month_year);
                    // $('.award-information').val(value.award_information);
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