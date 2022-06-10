@extends('layout.app') 
@section('heading')
Warehouses
@endsection
@section('page-body')
   
<section>
 
<div class=""> 
<a href="#"  class="border text-lg p-3"><i class="fa fa-folder"></i></a> 
<a href="#" class="border text-lg p-3"><i class="fa fa-filter"></i></a>
<a href="#" class="border   text-lg p-3"><i class="fa fa-plus"></i></a>
</div>
  <br>

   <div class="card"> 
       <h5 class="p-3">Purchase Orders</h5>
    <div class="card-body"> 
        <table class="table table-sm border" id="example3">
            <thead>
                <th class="text-info text-lg">
                Id
                </th>
                <th class="text-info text-lg">Date</th>
                <th class="text-info text-lg">Company Name</th>
                <th class="text-info text-lg">Amount</th>
                <th class="text-info text-lg">Status</th> 
                <th class="text-info text-lg">Action</th>
            </thead>
        </table>
    </div>
</div> 
</section>

@endsection