@extends('layout.app')
@section('heading')
Trainners List
@endsection

@section('title')
Trainners List
@endsection

@section('page-label')
Trainners List
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
      <i class="fas fa-plus mr-1"></i> ADD NEW</button>
</div>
 
<div class="mt-3 card add-form">
    <div class="card-header">
      <h3 class="card-title">Add New Awards</h3>  
    </div>
<div class="card-body" id="add-trainers-form"> 
    <!--Add new  Form -->
    <div id="add-form">
        <form method="post" action="{{route('trainer-add')}}" >
            @csrf
            <div class="row"> 
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                           <label>First Name</label>
                           <input name="first-name" class='form form-control' placeholder='First name'/>
                        </div>
                        <div class="col-md-6">
                           <label>Last Name</label>
                           <input name="last-name" class='form form-control' placeholder='Last Name'/>
                         </div> 
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                           <label>Contact Number</label>
                           <input name="contact-number" class='form form-control' placeholder='Contact Number'/>
                        </div>
                        <div class="col-md-6">
                           <label>Email</label>
                           <input name="email" class='form form-control' placeholder='Email'/>
                         </div> 
                    </div>
                    <br>
                    <div class="row"> 
                        <div class="col-md-6">
                           <label>Company</label>
                           <select name='company' class='form form-control'>
                               @foreach($company as $row)
                               <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                               @endforeach
                           </select>
                         </div> 
                         <div class="col-md-6">
                            <label>Designation</label>
                               <select name='designation' class='form form-control'>
                               @foreach($designation as $row)
                               <option value="{{$row->designation_id}}">{{$row->designation_name}}</option>
                               @endforeach
                           </select>
                         </div>
                    </div> 
                </div> 
                <div class="col-md-6">
                    <label>Expertise</label>
                    <textarea  name="expertise" rows="5" cols="10" class='form form-control' placeholder='Expertise'></textarea>
                </div>
                <br><br>
                <div class='col-md-12 mt-3'>
                    <label>Address</label>
                    <textarea name="address" rows="5" cols="10" class='form form-control' placeholder="Address"></textarea>
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
    <div class="card-header">
        <h5 >List All Companies</h5>
    </div>
<div class="card-body">
    
<div class="table-responsive">
<table class="table table-bordered table-sm" id="example1"  >
    <thead> 
        <th>Action</th>
        <th><i class="fa fa-user"></i> Full Name</th> 
        <th>Company</th>
        <th><i class="fa fa-phone"></i> Contact Number</th> 
        <th><i class="fa fa-envelope"></i> Email</th> 
    </thead> 
    <tbody>
       @foreach($table as $row)
       <tr>
         <td>
        <a href="javascript:void(0)" class="edit btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModal" value="{{$row->trainer_id}}">
            <i class="fa fa-edit"></i>
        </a>
        <a href="{{ route('trainer-delete',$row->trainer_id) }}" class="delete btn btn-danger btn-sm"  >
            <i class="fa fa-trash-alt"></i>
        </a>
        </td>
        
           <td>{{$row->first_name.' '.$row->last_name}}</td>
           <td>{{$row->trading_name}}</td>
           <td>{{$row->contact_number}}</td>
           <td>{{$row->email}}</td>
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
           <form method="post" action="{{route('trainer-update')}}" >
            @csrf
            <div class="row"> 
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" name="id" class="id">
                           <label>First Name</label>
                           <input name="first-name" class='first-name form form-control' placeholder='First name'/>
                        </div>
                        <div class="col-md-6">
                           <label>Last Name</label>
                           <input name="last-name" class='last-name form form-control' placeholder='Last Name'/>
                         </div> 
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                           <label>Contact Number</label>
                           <input name="contact-number" class='contact-number form form-control' placeholder='Contact Number'/>
                        </div>
                        <div class="col-md-6">
                           <label>Email</label>
                           <input name="email" class='email form form-control' placeholder='Email'/>
                         </div> 
                    </div>
                    <br>
                    <div class="row"> 
                        <div class="col-md-6">
                           <label>Company</label>
                           <select name='company' class='form form-control'>
                               @foreach($company as $row)
                               <option value="{{$row->company_id}}">{{$row->trading_name}}</option>
                               @endforeach
                           </select>
                         </div> 
                         <div class="col-md-6">
                            <label>Designation</label>
                               <select name='designation' class='form form-control'>
                               @foreach($designation as $row)
                               <option value="{{$row->designation_id}}">{{$row->designation_name}}</option>
                               @endforeach
                           </select>
                         </div>
                    </div> 
                </div> 
                <div class="col-md-6">
                    <label>Expertise</label>
                    <textarea  name="expertise" rows="5" cols="10" class='expertise form form-control' placeholder='Expertise'></textarea>
                </div>
                <br><br>
                <div class='col-md-12 mt-3'>
                    <label>Address</label>
                    <textarea name="address" rows="5" cols="10" class='address form form-control' placeholder="Address"></textarea>
                </div>
                <div class="col-md-12 mt-3 text-right">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                url : '{{ url("trainers/edit") }}'+'/'+$id,
                type: 'post', 
                dataType: 'Json',
                success:function(data){
                    console.log(data);
                    $.each(data, function(key , value){

                        $('.id').val(value.trainer_id);
                        $('.first-name').val(value.first_name);
                        $('.last-name').val(value.last_name);
                        $('.contact-number').val(value.contact_number);
                        $('.address').val(value.address);
                        $('.expertise').val(value.expertise);
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