<div class="border p-3 mb-3">
<div>
    <h5>List All Qualifications</h5>
    <table id='example9' class='table table-sm table-bordered' >
        <thead> 
        <th>Action</th>
        <th>School/University</th>
        <th>Time Period</th>
        <th>Education Lavel</th>
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
<div>
<div class='card mt-3'>
    <div class='card-body'>
    <h5 class='my-2'>Add New Qualification</h5>
    <form action="#" name="qualification_info" id="qualification_info" autocomplete="off" method="post" accept-charset="utf-8">
        <input type="hidden" name="u_basic_info" value="UPDATE" />
        <input type="hidden" name="csrf_hrsale" value="419f8aa1ce2c67484e5a6fe3c6477a9d" />                                                                                     
        <input type="hidden" name="user_id" value="2"  />
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label for="name">School/University<i class="hrsale-asterisk">*</i></label>
              <input class="form-control" placeholder="School/University" name="name" type="text">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="education_level" class="control-label">Education Level</label>
              <select class="form-control" name="education_level" data-plugin="select_hrm" data-placeholder="Education Level">
                    <option value="1">High School Diploma / GED</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="form-group">
              <label for="from_year" class="control-label">Time Period<i class="hrsale-asterisk">*</i></label>
              <div class="row">
                <div class="col-md-6">
                  <input class="form-control "  placeholder="from" name="from_year" type="date">
                </div>
                <div class="col-md-6">
                  <input class="form-control "  placeholder="to" name="to_year" type="date">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label for="language" class="control-label">Language</label>
              <select class="form-control" name="language" data-plugin="select_hrm" data-placeholder="">
                <option value="1">English</option>
              </select>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="skill" class="control-label">Professional Courses (if any)</label>
              <select class="form-control" name="skill" data-plugin="select_hrm" data-placeholder="Professional Courses (if any)">
                <option value=""></option>
                <option value="1">jQuery</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="form-group">
              <label for="to_year" class="control-label">Description</label>
              <textarea class="form-control" placeholder="Description" data-show-counter="1" data-limit="300" name="description" cols="30" rows="3" id="d_description"></textarea>
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
</div>    
</div>