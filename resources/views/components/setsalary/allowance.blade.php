<div class='border p-3'>
    <h5>List All Allowances</h5>
    <table id='example9' class='table table-sm table-bordered' >
        <thead>
        <th>Action</th>
        <th>Allowance Option</th>
        <th>Title</th>
        <th>Amount</th>
        </thead>
        <tbody>
            <?php for($i=1; $i<=50; $i++) {?>
            <tr>
                <td><?= rand() ?></td>
                <td><?= rand() ?></td>
                <td><?= rand() ?></td>
                <td><?= rand() ?></td>
            </tr> 
            <?php }?>
        </tbody>
    </table>
</div>
<div class="border p-3 mt-3">
<h5>Allowances</h5>
<div class="row  ">
    <div class="col">
        <label for="">Allowance Options</label>
        <select name="allowance-options" class="form-control">
            <option value="">Non Taxable</option>
        </select>
    </div>
    <div class="col">
        <label for="">Title</label>
        <input name='title' class="form-control">
    </div>
    <div class="col">
        <label for="">Amount</label>
        <input name="amount" class="form-control">
    </div>
    
</div>
<div class='row'>
   <div class="col"> 
        <button type="submit" class="btn btn-primary float-right mt-2"> <i class="fa fa-check mr-2"></i> Save</button> 
   </div>
</div>
</div>