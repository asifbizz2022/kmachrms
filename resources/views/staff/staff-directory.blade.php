@extends('layout.app')
@section('heading')
Staff Directory
@endsection
@section('page-body')
 <section class="content"> 
      <!-- Default box -->
      <div class=" ">
        <div class="  pb-0">
          <div class="row d-flex align-items-stretch">
              
              @foreach($results as $rows)
            <div class="col-12 col-sm-6 col-md-4  ">
              <div class="card bg-light pt-3">
                
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>{{ $rows->first_name.' '.$rows->last_name }}</b></h2>
                      <p>{{ $rows->designation_name }}</p> 
                    </div>
                    <div class="col-5 text-center">
                      <img src="{{ url('public/dist/img/user1-128x128.jpg') }}" alt="" class="img- img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer  ">
                  <div class="text-center">
                    <a href="#" class="btn btn-sm bg-teal mr-3">
                      <i class="fas fa-arrow-circle-right mx-3"></i>
                        View More
                      
                    </a>
                    <a href="#" class="btn btn-sm btn-primary mr-3">
                      <i class="fas fa-user mx-3"></i> 
                        View Profile 
                    </a>
                  </div>
                </div>
              </div>
            </div>
             
              @endforeach
          </div>
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#">6</a></li>
              <li class="page-item"><a class="page-link" href="#">7</a></li>
              <li class="page-item"><a class="page-link" href="#">8</a></li>
            </ul>
          </nav>
        </div>
        <!-- /.card-footer -->
      </div>
      <!-- /.card -->

    </section> 
@endsection