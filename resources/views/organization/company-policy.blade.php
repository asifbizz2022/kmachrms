@extends('layout.app')
@section('title')
Company Policy
@endsection

@section('heading')
Company Policy
@endsection

@section('page-label')
Company Policy
@endsection

@section('page-body') 
<div class="row"> 
    <div class="col-md-4">
        <div class="card">
            <div class="card-header">
                <h5  >Company Policy</h5>  
            </div>
            <div class="card-body">
                 
                <form method="post" action="{{ route('policy-add') }}" enctype="multipart/form-data">
                   @csrf 
                    <p>
                        <label>Company</label>
                        <select name='company' class="form form-control">
                            @foreach($company as $row)
                            <option value="{{$row->company_id}}">{{$row->trading_name.''.$row->trading_name}}</option>
                            @endforeach
                        </select>
                    </p> 
                    <p>
                        <label>Title</label>
                        <input name='title' class="form form-control" placeholder="Title"/>
                    </p>
                    <p>
                        <label>Description</label>
                        <textarea name="description" rows="5" cols="10" class='textarea form form-control' placeholder='Description'></textarea>
                    </p>
                    <p>
                        <label>Attachements</label>
                        <input type='file' name='attachements' class='form form-control-file' >
                    </p>
                    <p class="text-right">
                        <button type='submit' class='btn btn-primary'><i class="fa fa-check-square mr-1"></i> Save</button>
                    </p>
                </form>
            </div>
        </div>   
    </div>
    <div class="col-md-8">
        <div class=" ">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <span>
                     <strong class="m-0 font-weight-bold text-primary" >List All Policies</strong>
                </span> 
                
            </div>
            <div class="card-body">
            <div class="table-responsive">
            <table class="table table-bordered table-sm" id="example3" width="100%" cellspacing="0">
                <thead> 
                    <th>Action</th>
                    <th>Title</th>
                    <th><i class="fa fa-user"></i> Created At</th>
                    <th><i class='fa fa-calendar-alt'></i> Added By</th>  
                </thead> 
                <tbody>
                @foreach($policy as $row)
                <tr>
                <td>
                    <a href="javascript:void(0)" class="edit btn btn-info btn-sm" data-toggle="modal" data-target="#editModal"  value="{{ $row->policy_id }}">
                        <i class="fa fa-pen"></i>
                    </a>
                    <a href="javascript:void(0)" class="view btn btn-default btn-sm" data-toggle="modal" data-target="#viewModal"  value="{{ $row->policy_id }}">
                        <i class="fa fa-eye"></i>
                    </a>
                    <a href="{{ route('policy-delete',$row->policy_id) }}" class=" btn btn-danger btn-sm" id="delete-policy" value="{{ $row->policy_id}}">
                        <i class="fa fa-trash-alt"  ></i>
                    </a>
                </td>
               
                <td>
                   {{ $row->title}} 
                </td>
                <td>
                    {{$row->created_at}}
                </td>
                <td>
                    {{ $row->added_by }}
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
</div> 
 

<!-- edit modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Policy</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <form method="post" class="update-policy" action="{{ route('policy-update') }}" enctype="multipart/form-data">
                @csrf
                    <p>
                        <input type="text" name="id" class="id">
                        <label>Company</label>
                        <select name='company' class="edit-company form form-control">
                            @foreach($company as $row)
                            <option value="{{$row->company_id}}">{{$row->trading_name.''.$row->trading_name}}</option>
                            @endforeach
                        </select>
                    </p> 
                    <p>
                        <label>Title</label>
                        <input name='title' class="edit-title form form-control" placeholder="Title"/>
                    </p>
                    <p>
                        <label>Description</label>
                        <textarea name="description" rows="5" cols="10" id="desc" class='edit-description textarea form form-control' placeholder='Description'></textarea>
                    </p>
                    <p>
                        <label>Attachements</label>
                        <input type='file' name='attachements' class='edit-attachment form form-control-file' >
                    </p>
                    <p class="text-right">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type='submit' class='btn btn-primary'><i class="fa fa-check-square mr-1"></i> Save</button>
                    </p>
                </form>
      </div>
      
    </div>
  </div>
</div>
<!-- view modal -->
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="text-info modal-title" id="exampleModalLabel">View Policy</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <table class="table table-striped table-bordered">
        <tr>
            <td>
                Company
            </td>
            <td>
                <span class="view-c"></span>
            </td>
        </tr>
        <tr>
            <td>Title</td>
            <td><span class="view-t"></span></td>
        </tr>
        <tr>
            <td>Attachment</td>
            <td><span class="view-a"></span></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><span class="view-d"></span></td>
        </tr>
    </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
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
          
           "positionClass": "toast-top-center",
           "progressBar" : true
        }
      toastr.error("{!! Session::get('message') !!}");
    </script>  
 
@endif

@if(Session::get('status') == 3) 
    <script type="text/javascript">
        toastr.options = {
             "onclick": null,
         
           "positionClass": "toast-top-center",
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

      
    
    $(document).on('click', '.edit', function(e){
        
        var $id = $(this).attr('value');
        console.log($id);
        $.ajax({
            url : '{{ url("policy/edit") }}'+'/'+$id,
            type: 'post', 
            dataType: 'Json',
            success:function(data){
                console.log(data);
                $.each(data, function(key , value){ 
                      $('.id').val(value.policy_id);
                       $('.edit-company').val(value.company_id);
                        $('.edit-title').val(value.title);
                        // $('.edit-description').ckeditor().editor.insertText('some text here');
                         CKEDITOR.instances['#desc'].insertElement('<p>paragraph</p>');
                          $('.edit-attachment').val(value.attachment);
                });
            }
        }); 
          
    });
    $(document).on('click', '.view', function(e){
        
        var $id = $(this).attr('value');
        console.log($id);
        $.ajax({
            url : '{{ url("policy/view") }}'+'/'+$id,
            type: 'post', 
            dataType: 'Json',
            success:function(data){
                console.log(data);
                $.each(data, function(key , value){  
                       $('.view-c').text(value.company_id); 
                        $('.view-t').text(value.title); 
                         $('.view-a').text(value.attahment); 
                          $('.view-d').text(value.description); 
                        
                });
            }
        }); 
          
    });

function data_table(){
    $('.table').reload();
}
    // $(document).on('click', '#delete-policy', function(){
    //     var $id = $(this).attr('value');
       
    //     $.ajax({
    //         url : '{{ url("policy/delete") }}'+'/'+$id,
    //         type: 'post', 
    //         dataType: 'Json',
    //         success:function(data){
               
    //             location.reload();
    //              toastr.error('Policy Deleted'); 
    //         }
    //     }); 

        
         
    // }); 

});

     
</script>
@endsection