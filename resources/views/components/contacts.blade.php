<div class="border p-3">
    <div class=" "> 
    <div class=" ">
        <h5>List All Contacts</h5>
        <table id='example3' class='table table-bordered table-sm' >
            <thead>
            <th>Action</th>
            <th>Duration</th>
            <th>Designation</th> 
            <th>Contact Type</th>
            <th>Title</th>
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
</div>
<div class="border p-3 mt-3">
    <h5 class='mb-3'>Add New Contact</h5>
    <form action="#">
        <div class="row">
            <div class="col-md-6">
                <label>Contact Type</label>
                <select name="contact-type" class="form-control">
                    <option>Contact Type</option>
                </select>
                 
            </div>
            <div class="col-md-6">
                <label>Contact Title</label>
                 <input name="contact-title" class="form-control" placeholder="Contact Title"/> 
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>Form Date</label>
                <input type="date" name='from-date' class="form-control" />
            </div>
            <div class="col-md-6">
                <label>To Date</label>
                <input type='date' name='to-date' class="form-control"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>Designation</label>
                 <select name="designation" class="form-control">
                    <option>Broker</option>
                </select>
            </div>
            <div class="col-md-6">
                <label>Description</label>
                <textarea  name="description" rows="3" cols="10" placeholder='Description' class='form-control'></textarea>
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
