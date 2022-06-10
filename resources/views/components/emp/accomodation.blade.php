<section>
    <div class="card">
        <div class="card-header">
            <h4>List All Accomodation</h4>
        </div>
        <div class="card-body">
            <table id='example3' class='table table-sm border'>
                <thead>
                    <th>
                        Action
                    </th>
                    <th>
                        Title
                    </th>
                    <th>
                        <i class="fa fa-calendar"></i>
                        period
                    </th>
                    <th>
                        Annual value
                    </th>
                    <th>
                        Furnished
                    </th>
                    <th>
                        Rent
                    </th>
                </thead>
                <tbody>
                    <?php for($a = 0; $a<= 50 ; $a++) {?>
                        <tr>
                            <td><?= time()?></td>
                            <td><?= time()?></td>
                            <td><?= time()?></td>
                            <td><?= time()?></td>
                            <td><?= time()?></td>
                            <td><?= time()?></td>
                        </tr>
                    <?php }?>
                </tbody>
            </table>
        </div>
    </div>
</section>
<section>
<div class="card">
    <div class="card-header">
       <h4>Accomodation</h4>
    </div>
    <div class="card-body">
        <form action="">
            <div class="row">
                <div class="col">
                    <label for="">Accomodation Title</label>
                    <input type="text" name="" id="" class="form-control form-sm" placeholder="Accomodation Title">
                </div>
                <div class="col">
                <label for="">Address Line 1</label>
                    <input type="text" name="" id="" class="form-control form-sm" placeholder="Address">
                </div>
                <div class="col">
                <label for="">Address Line 2</label>
                    <input type="text" name="" id="" class="form-control form-sm" placeholder="Address">
                </div>
                
            </div>
            <div class="row">
                <div class="col">
                <label for="">Period Form</label>
                    <input type="text" name="" id="" class="form-control form-sm" placeholder="Accomodation from">
                </div>
                <div class="col">
                <label for="">Period To</label>
                    <input type="text" name="" id="" class="form-control form-sm" placeholder="Accomodation from">
                </div>
                <div class="col">
                <label for="">Accomodation Type</label>
                    <select name="" id="" class="form-control form-sm" class="form-control">
                        <option value="">Owned</option>
                        <option value="">Rent</option>
                    </select>
                </div>
            </div>
            <br>
            
            <div class="form-group text-right">
                <button type="submit" class="btn btn-primary"> <i class="fa fa-check-square mr-3"></i> Save</button>
            </div>
        </form>
    </div>
</div>
</section>