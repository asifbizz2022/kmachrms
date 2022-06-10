<section>
    <div class="card">
        <div class="card-header">
            <h4>List All Accommodated Employees </h4>
        </div>
        <div class="card-body">
            <table id='example3' class='table table-sm border'>
                <thead>
                    <th>
                        Action
                    </th>
                    <th>
                        Employee
                    </th>
                    <th>
                        Benifit Year
                    </th>
                    <th>
                        Utility/Accessory
                    </th>
                    <th>
                        Remark
                    </th>
                    <th>
                        Amount
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
    <div class="card  ">
        <div class="card-header">
        <h4>Accommodate Employee</h4>
        </div>
        <div class="card-body">
          <form action="#">
          <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="accommodation_title">Accommodation Title<i class="hrsale-asterisk">*</i></label>
                        <input class="form-control" placeholder="Accommodation Title" name="accommodation_title" type="text" value="" id="accommodation_title">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="address_1">Address Line 1</label>
                        <input class="form-control" placeholder="Address" name="address_1" type="text" value="" id="address_1">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="address_2">Address Line 2</label>
                        <input class="form-control" placeholder="Address" name="address_2" type="text" value="" id="address_2">
                    </div>
                </div>
            </div>

            <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="period_from">Period From<i class="hrsale-asterisk">*</i></label>
                            <input class="form-control cont_date" placeholder="Accommodation from" name="period_from" type="text" value="" id="period_from" readonly>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="period_to">Period To</label>
                            <input class="form-control cont_date" placeholder="Accommodation from" name="period_to" type="text" value="" id="period_to" readonly>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="accommodation_type">Accommodation Type<i class="hrsale-asterisk">*</i></label>
                            <select name="accommodation_type" id="accommodation_type" class="form-control" data-plugin="select_hrm" data-placeholder="Accommodation Type">
                                <option value="">Select Accommodation Type</option>
                                <option value="owned">Owned</option>
                                <option value="rented">Rented</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" id="annual_value_field">
                        <div class="form-group">
                            <label for="annual_value">Annual Value(AV)<i class="hrsale-asterisk">*</i></label>
                            <input class="form-control" placeholder="Accommodation from" name="annual_value" type="text" value="" id="annual_value">
                        </div>
                    </div>
                    <div class="col-md-4" id="furnished_field">
                        <div class="form-group">
                            <label for="furnished">Furnished</label>
                            <select name="furnished" id="furnished" class="form-control" data-plugin="select_hrm" data-placeholder="Furnished">
                                <option value="">Select Furnished Type</option>
                                <option value="1">Fully Furnished</option>
                                <option value="2">Partially Furnished</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4" id="rent_paid_field">
                        <div class="form-group">
                            <label for="rent_paid">Annual Rent Paid</label>
                            <input class="form-control" placeholder="Total Rent Paid in the period" name="rent_paid" type="text" value="" id="rent_paid">
                        </div>
                    </div>
                </div>

                <div class="text-right"> 
                    <button   type="submit" class="btn btn-primary" >
                    <i class="fa fa fa-check-square mr-3"></i> Save
                    </button>
                </div>
          </form>
        </div>
    </div>
</section>