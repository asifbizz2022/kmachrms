<div class="border p-3">
    <div class=" "> 
    <div class=" ">
        <h5>List All Securiry</h5>
        <table id='example2' class='table table-bordered table-sm' >
            <thead>
            <th>Action</th>
            <th>Security Lavel</th>
            <th>Date of Expiry</th>
            <th>Date of Clearence</th>
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
</div>
</div>
<div class="border mt-4 p-3">
    <h5>Add New Security Lavel</h5>
    <form action="#">
        <div class="row">
            <div class="col-md-4">
                <label>Security Lavel</label>
                <select name="security-lavel" class="form-control">
                    <option>Security Lavel</option>
                </select>
            </div>
            <div class="col-md-4">
                <label>Date of Expiry</label>
                <input type="date" name="date-of-expiry" class="form-control"/>
            </div>
            <div class="col-md-4">
                <label>Date of Clearence</label>
                <input type="date" name="date-of-clearence" class="form-control"/>
            </div>
        </div>
        <div class='row mt-3'>
            <div class='col-md-12 text-right'>
               <button type="submit" class="btn btn-primary float-right">
        <i class="fa fa-check-square mr-3"></i>
        Save</button>
            </div>
        </div>
    </form>
</div>
