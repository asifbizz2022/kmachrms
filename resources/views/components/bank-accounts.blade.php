<div class="border p-3">
    <h5>List All Bank Accounts</h5>
    <table id='example2' class='table table-bordered table-sm' >
        <thead>
        <th>Action</th>
        <th>Account Title</th>
        <th>Account Number</th>
        <th>Bank Name</th>
        <th>Bank Code</th>
        <th>Bank Branch</th>
        </thead>
        <tbody>
             <?php for($i=1; $i<=50; $i++) {?>
            <tr>
                <td><?= rand() ?></td>
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
<div class='border p-3 mt-3'>
    <h5>Add New Bank Accounts</h5>
    <form action="#">
     <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label for="account_title">Account Title<i class="hrsale-asterisk">*</i></label>
            <input class="form-control" placeholder="Account Title" name="account_title" type="text" value="" id="account_name">
          </div>
        </div>
        <div class="col-md-6">
          <div class="form-group">
            <label for="account_number">Account Number<i class="hrsale-asterisk">*</i></label>
            <input class="form-control" placeholder="Account Number" name="account_number" type="text" value="" id="account_number">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label for="bank_name">Bank Name<i class="hrsale-asterisk">*</i></label>
            <input class="form-control" placeholder="Bank Name" name="bank_name" type="text" value="" id="bank_name">
          </div>
        </div>
        <div class="col-md-6">
          <div class="form-group">
            <label for="bank_code">Bank Code<i class="hrsale-asterisk">*</i></label>
            <input class="form-control" placeholder="Bank Code" name="bank_code" type="text" value="" id="bank_code">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="form-group">
            <label for="bank_branch">Bank Branch</label>
            <input class="form-control" placeholder="Bank Branch" name="bank_branch" type="text" value="" id="bank_branch">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="form-group">
            <div class="form-actions box-footer"> 
                <button type="submit" class="btn btn-primary float-right">
                <i class="fa fa-check-square mr-3"></i>
                Save</button>
            </div>
          </div>
        </div>
      </div>
    </form>
</div>