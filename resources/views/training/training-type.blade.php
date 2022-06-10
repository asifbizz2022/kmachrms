@extends('layout.app')
@section('heading')
Training Types
@endsection

@section('title')
Training Types
@endsection

@section('page-label')
Training Types
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

    <!--Add new  Form -->
    <div class="row">
        <div class="col-md-4">
        <div class="card" id="add-form">
            <div class="card-body">
            <h5 >Add New Type</h5>
            <form method="post" action="{{route('training-type-add')}}"  >
                @csrf
                <p class="mt-3">
                    <label>Training Type</label>
                    <input type="text" name="training-type" class="form form-control" placeholder="Training Types">
                </p>
                <p class="mt-3">
                   <label>Company</label>
                   <select name='company-id' class='form form-control'>
                       @foreach($company as $row)
                       <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                       @endforeach
                   </select>

                </p>
                <div class="row">  
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
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title mb-5">List All Training Types</h5>
                <div class="table-responsive">
                <table class="table table-bordered table-sm" id="example1"  >
                    <thead> 
                        <th>Action</th>
                        <th>Type</th>  
                    </thead>  
                    <tbody>
                        @foreach($trainingType as $row)
                        <tr>
                        <td>
                        <a href="javascript:void(0)" class="edit btn btn-info btn-sm"  data-toggle="modal" data-target="#exampleModal" value="{{$row->training_type_id}}" >
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="{{ route('training-type-delete',$row->training_type_id) }}" class="delete btn btn-danger btn-sm" value="">
                            <i class="fa fa-trash-alt"></i>
                        </a>
                        </td>
                        <td>
                            {{$row->type}}
                        </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                </div> 
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
         <form method="post" action="{{route('training-type-update')}}"  >
                @csrf
                <p class="mt-3">
                    <input type="hidden" name="id" class="id">
                    <label>Training Type</label>
                    <input type="text" name="training-type" class="training-type form form-control" placeholder="Training Types">
                </p>
                <p class="mt-3">
                   <label>Company</label>
                   <select name='company-id' class='form form-control'>
                       @foreach($company as $row)
                       <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                       @endforeach
                   </select>

                </p>
                <div class="row">  
                    <div class="col-md-12 mt-3 text-right"> 
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
<!-- comment -->
 
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
                url : '{{ url("training/type/edit") }}'+'/'+$id,
                type: 'post', 
                dataType: 'Json',
                success:function(data){
                    console.log(data);
                    $.each(data, function(key , value){

                        $('.id').val(value.training_type_id);
                        $('.training-type').val(value.type);
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