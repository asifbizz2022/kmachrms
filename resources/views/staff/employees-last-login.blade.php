@extends('layout.app')
@section('heading')
Employees Last Login
@endsection

@section('page-label')
Employees Last Login
@endsection

@section('page-body')
  
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="row">
            <div class="col-md-9">
            <h5 class="m-0  ">Employees Last Login</h5>
            </div>
            <div class="col-md-3 text-right">
                <button class="btn btn-primary btn-sm">Filter</button>
            </div>
        </div>         
    </div>
    <div class="card-body">
<div class="table-responsive">
<table class="table table-bordered table-sm" id="example3" width="100%" cellspacing="0">
    <thead> 
        <th>Name</th>
        <th>User Name</th>
        <th>Company</th>
        <th>Last Login</th>
        <th>Role</th>
        <th>Status</th>  
    </thead> 
    <tbody>
        <?php for($i=0; $i<=50; $i++){ ?>
        <tr>
        <td>Name<?= rand() ?></td> 
        <td>User Name<?= time()?></td> 
        <td>Company<?= time()?></td> 
        <td>Last Login<?= time()?></td> 
        <td>Role<?= time()?></td> 
        <td>Status<?= time()?></td>
        </tr>
        <?php } ?>
    </tbody>
</table>
</div>
</div>
</div>
@endsection