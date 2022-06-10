<div class='card rounded-0'>
    <div class="card-body">
        <h5>List </h5>
        <table id='example5' class='table table-sm table-bordered'>
            <thead>
            <th>Action</th><th>Document Type</th><th>Title</th><th>Date of Expiry</th>
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
<div class="card rounded-0"> 
<div class='card-body'>
<h5 class='mb-3'>Add New Documents</h5>
<form action="#" name="document_info" id="document_info" autocomplete="off" enctype="multipart/form-data" method="post" accept-charset="utf-8">
<input type="hidden" name="u_document_info" value="UPDATE" />
<input type="hidden" name="csrf_hrsale" value="134c1fef766057924e854aec09a47a84" />
<input type="hidden" name="user_id" value="2"  />
<div class="row">
  <div class="col-md-6">
    <div class="form-group">
      <label for="relation">Document Type<i class="hrsale-asterisk"></i></label>
      <select name="document_type_id" id="document_type_id" class="form-control" data-plugin="select_hrm" data-placeholder="Choose Document Type">
        <option value=""></option>
        <option value="1"> Driving License</option>
      </select>
    </div>
  </div>
  <div class="col-md-6">
    <div class="form-group">
      <label for="date_of_expiry" class="control-label">Date of Expiry<i class="hrsale-asterisk">*</i></label>
      <input type='date' class="form-control  "   name="date_of_expiry" >
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="form-group">
      <label for="title" class="control-label">Document Title<i class="hrsale-asterisk">*</i></label>
      <input class="form-control" placeholder="Document Title" name="title" type="text">
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-6">
    <div class="form-group">
      <label for="description" class="control-label">Description</label>
      <textarea class="form-control" placeholder="Description" data-show-counter="1" data-limit="300" name="description" cols="30" rows="3" id="d_description"></textarea>
    </div>
  </div>
  <div class="col-md-6">
    <div class="form-group">
      <fieldset class="form-group">
        <label for="logo">Document File</label>
        <input type="file" class="form-control-file" id="document_file" name="document_file">
        <small>Upload files only: png, jpg, jpeg, gif, txt, pdf, xls, xlsx, doc, docx</small>
      </fieldset>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="form-group">
      <div class="form-actions"> 
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
 
 