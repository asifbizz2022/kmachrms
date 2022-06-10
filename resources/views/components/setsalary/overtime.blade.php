  
<div class=""> 
    <div class="border p-3">
        <h5>List All Commissions</h5>
        <table id='example2' class='table table-bordered table-sm' >
            <thead> 
                <th>Action</th>
                <th>Overtime Title</th>
                <th>Number of Days</th>
                <th>Hours</th>
                <th>Rate</th>
            </thead>
            <tbody>
                 <?php for($i=1; $i<=50; $i++) {?>
                <tr>
                    <td><?= rand() ?></td>
                    <td><?= rand() ?></td>
                    <td><?= rand() ?></td>
                    <td><?= rand() ?></td>
                    <td><?= rand() ?></td>
                </tr>
                 <?php }?>
            </tbody>
        </table>
    </div>
</div>

 
<div class="border p-3 mt-3">
    <h5>List All Commissions</h5>
    <form action="">
    <div class="row"> 
        <div class="col">
            <label for="">Overtime Title</label>
            <input name="overtime-title"  class="form-control" placeholder="Overtime Title">
        </div>
        <div class="col">
            <label for="">Number of Days</label>
            <input name="number-of-days"   class="form-control" placeholder="Number Of Days">
        </div>
        <div>
            <label for="">Hours</label>
            <input type="text" name="hours" class="form-control" placeholder="Hours">
        </div>
        <div class="col">
            <label>Rate</label> 
            <input type="text" name="rate" class="form-control" placeholder="Rate">
        </div>
    </div>
    <div class="row mt-3">
        <div class="col">
            <button type="submit" class="btn btn-primary float-right"> <i class="fa fa-check mr-3"></i> Save</button>
        </div>
    </div>
</form>
</div>