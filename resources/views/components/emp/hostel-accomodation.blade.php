<section>
    <div class="card">
        <div class="card-header">
            <h4>
                List All Hotel Accommodation 
            </h4>
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
<div class="card">
    <div class="card-body">
        <form action="#">
        <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="company">Company</label>
                            <select class="form-control aj_company" name="company" data-plugin="select_hrm" data-placeholder="Company" required>
                                <option value="">Select Company</option>
                                                                <option value="1"> SANTE WELLNESS PTE. LTD.</option>
                                                            </select>
                        </div>
                    </div>
                    <div class="col-md-4 employee_ajax">
                        <div class="form-group">
                            <label for="employee_id">Employee</label>
                            <select name="employee_id" class="form-control employee_id" data-plugin="select_hrm" data-placeholder="Choose an Employee">
                                <option value="">Select Employee</option>
                            </select>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="hotel_name">Hotel Name</label>
                            <input class="form-control" placeholder="Hotel Name" name="hotel_name" id="hotel_name" type="text">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ht_check_in">Check In Date</label>
                            <input class="form-control cont_date" placeholder="Check in date" name="ht_check_in" id="ht_check_in" type="text" readonly>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ht_check_out">Check Out Date</label>
                            <input class="form-control cont_date" placeholder="Check Out date" name="ht_check_out" id="ht_check_out" type="text" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ht_actual_cost">Actual Cost</label>
                            <input class="form-control" placeholder="Actual Cost" name="ht_actual_cost" id="ht_actual_cost" type="text">
                            <small id="ht_actual_cost_help" class="form-text text-muted">Actual Cost of Hotel Accommodation</small>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ht_employee_paid">Employee Paid Amount</label>
                            <input class="form-control" placeholder="Amount Paid by Employee" name="ht_employee_paid" id="ht_employee_paid" type="text">
                            <small id="ht_employee_paid_help" class="form-text text-muted">Amount paid by the employee</small>
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