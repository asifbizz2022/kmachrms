    
  
<div class="card rounded-0"> 
    <div class="card-body">
        <h5>Assigned Immigration Records</h5>
        <table id='example2' class='table table-bordered table-sm' >
            <thead>
            <th>Action</th>
            <th>Document</th>
            <th>Issue Date</th>
            <th>Empty Date</th>
            <th>Issued By</th>
            <th>Eligible Review Date</th>
            </thead>
            <tbody>
                  <?php for($a = 1; $a<=50; $a++) {?>
                <tr>
                    <td><?php echo rand() ?></td>
                    <td><?php echo rand() ?></td>
                    <td><?php echo rand() ?></td>
                    <td><?php echo rand() ?></td>
                    <td><?php echo rand() ?></td>
                    <td><?php echo rand() ?></td>
                </tr>
                  <?php }?>
            </tbody>
        </table>
    </div>
</div>
    <h5>Add New Immigration</h5>
<div class="card">
    <div class="card-body">
        <form action="action">
            <div class='row'>
                <div class='col-md-6 col-sm-auto'>
                    <label>Document</label>
                    <select name='document' class="form form-control">
                        <option>Document</option>
                    </select>
                </div>
                 <div class='col-md-6 col-sm-auto'>
                     <label>Document Number</label>
                     <input name='document-number' class="form form-control" placeholder='Document Number'/>
                </div>
            </div>
            <div class='row mt-3'>
                <div class='col-md-6 col-sm-auto'>
                    <div class='row'>
                        <div class='col-md-6 col-sm-auto'>
                            <label>Issue Date</label>
                            <input type='date' name='issue-date' class="form form-control">
                        </div>
                        <div class='col-md-6 col-sm-auto'>
                            <label>Date of Expiry</label>
                            <input type='date' name='date-of-expiry' class="form form-control">
                        </div>
                    </div>
                </div>
                 <div class='col-md-6 col-sm-auto  '> 
                     <div class="form-group">
                         <label>Upload Document</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" name='document-file' >
                            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                          </div> 
                        </div>
                     </div> 
                </div>
            </div>
            <div class='row mt-3'>
                <div class='col-md-6 col-sm-auto'>
                    <label>Eligible Review Date</label>
                    <input name='eligible-review-date' class="form form-control" placeholder='Eligible Review Date'>
                </div>
                 <div class='col-md-6 col-sm-auto'>
                     <label>Country</label>
                     <select name='country' class='form form-control'>
                         <option>Country</option>
                     </select>
                </div>
            </div>
            <div class="mt-3">
                <button type="submit" class="btn btn-primary float-right">
                    <i class="fa fa-check-square mr-3"></i>
                Save</button>
            </div>
        </form>
    </div>
</div>
    
