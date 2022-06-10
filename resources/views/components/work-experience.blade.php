<div>
    <div class="border p-3">
    <h5>List All Work Experience</h5>
    <table id='example9' class='table table-sm table-bordered' >
        <thead>
        <th>Action</th>
        <th>Company Name</th>
        <th>From Date</th>
        <th>To Date</th>
        <th>Post</th>
        <th>Description</th>
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
<div class='border mt-3 p-3'>
<h5 class='mb-4'>Add New Work Experience</h5>
<form action="#" name="work_experience_info" id="work_experience_info" autocomplete="off" method="post" accept-charset="utf-8">
<input type="hidden" name="u_basic_info" value="UPDATE" />
  <input type="hidden" name="csrf_hrsale" value="419f8aa1ce2c67484e5a6fe3c6477a9d" />
    <input type="hidden" name="user_id" value="2"  />
    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label for="company_name">Company Name<i class="hrsale-asterisk">*</i></label>
          <input class="form-control" placeholder="Company Name" name="company_name" type="text" value="" id="company_name">
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="post">Post<i class="hrsale-asterisk">*</i></label>
          <input class="form-control" placeholder="Post" name="post" type="text" value="" id="post">
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="form-group">
          <label for="from_year" class="control-label">Time Period<i class="hrsale-asterisk">*</i></label>
          <div class="row">
            <div class="col-md-6">
              <input class="form-control "  name="from_date" type="date">
            </div>
            <div class="col-md-6">
              <input class="form-control date"   name="to_date" type="date">
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="form-group">
          <label for="description">Description</label>
          <textarea class="form-control" placeholder="Description" data-show-counter="1" data-limit="300" name="description" cols="30" rows="4" id="description"></textarea>
          <span class="countdown"></span> </div>
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
</div>