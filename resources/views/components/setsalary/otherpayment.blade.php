 
<div class=""> 
    <div class="border p-3">
        <h5>List All Other Payment</h5>
        <table id='example2' class='table table-bordered table-sm' >
            <thead> 
                <th>Action</th>
                <th>Title</th>
                <th>Amount</th>
            </thead>
            <tbody>
                 <?php for($i=1; $i<=50; $i++) {?>
                <tr>
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
    <h5>Other Payment</h5>
   <form action="">
    <div class="row"> 
        <div class="col">
            <label for="">Title</label>
            <input type="text" name="title" class="form-control" placeholder="Title">
        </div>
        <div>
            <label for="">Amount(%)</label>
            <input type="text" name="amount" class="form-control" placeholder="Amount">
        </div>
    </div>
    <div class="row mt-3">
        <div class="col">
            <button type="submit" class="btn btn-primary"> <i class="fa fa-check mr-3"></i> Save</button>
        </div>
    </div>
</form>
</div>