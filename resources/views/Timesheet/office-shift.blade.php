@extends('layout.app')
@section('heading')
Office shifts
@endsection

@section('title')
Office shifts
@endsection

@section('page-label')
Office shifts
@endsection
@section('page-body')
<section>
    <p class="text-right">
        <button class="btn btn-info btn-md font-weight-bold   add-new-button">
        <i class="fa fa-plus-circle mr-1"></i>
        Add New
        </button>
    </p>
    <div class="mb-3 border p-3 bg-white add-form">
        <h5>
            Add New Office Shift
        </h5>
        <div class="row w-50">
            <div class="col">
                <label>Company</label>
            </div>
            <div class="col">
                <select class="form-control">
                    <option>Company</option>
                </select>
            </div>
        </div>
        <br>
        <div class="row w-50">
            <div class="col">
                <label>Shift Name</label>
            </div>
            <div class="col">
                <select class="form-control">
                    <option>Shift Name</option>
                </select>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col">
                <label>Monday</label>
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="In Time">
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="Out Time">
            </div>
            <div class="col">
                <button class="btn btn-info">Clear</button>
            </div>
        </div> 
        <br>
        <div class="row">
            <div class="col">
                <label>Tuesday</label>
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="In Time">
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="Out Time">
            </div>
            <div class="col">
                <button class="btn btn-info">Clear</button>
            </div>
        </div> 
        <br>
        <div class="row">
            <div class="col">
                <label>Wednesday</label>
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="In Time">
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="Out Time">
            </div>
            <div class="col">
                <button class="btn btn-info">Clear</button>
            </div>
        </div> 
        <br>
        <div class="row">
            <div class="col">
                <label>Thursday</label>
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="In Time">
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="Out Time">
            </div>
            <div class="col">
                <button class="btn btn-info">Clear</button>
            </div>
        </div> 
        <br>
        <div class="row">
            <div class="col">
                <label>Friday</label>
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="In Time">
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="Out Time">
            </div>
            <div class="col">
                <button class="btn btn-info">Clear</button>
            </div>
        </div> 
        <br>
        <div class="row">
            <div class="col">
                <label>Saturday</label>
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="In Time">
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="Out Time">
            </div>
            <div class="col">
                <button class="btn btn-info">Clear</button>
            </div>
        </div> 
        <br>
        <div class="row">
            <div class="col">
                <label>Sunday</label>
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="In Time">
            </div>
            <div class="col">
                <input type="" name="" class="form-control" placeholder="Out Time">
            </div>
            <div class="col">
                <button class="btn btn-info">Clear</button>
            </div>
        </div> 
        <br>
        <p class="text-right">
            <button class="btn btn-primary">
                <i class="fa fa-check-square mr-1"></i>
                Save
            </button>
        </p>
    </div>
   


    <div class="card">
        <div class="card-header">
            <h5>List of All Office Shifts</h5>
        </div>
        <div class="card-body">
            <table class="table table-sm border" id="example3">
                <thead>
                    <th>Option</th>
                    <th>Company</th>
                    <th>Day</th>
                    <th>Monday</th>
                    <th>Tuesday</th>
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                    <th>Saturday</th>
                    <th>Sunday</th>
                </thead>
            </table>
        </div>
    </div>
</section>

<script type="text/javascript">
    $(document).ready(function(){
        $('.add-form').slideUp();
        $(document).on('click','.add-new-button', function(){
           $('.add-form').slideToggle();
        });
});
</script>
@endsection
