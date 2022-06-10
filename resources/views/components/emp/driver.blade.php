<section>
    <div class="card">
        <div class="card-header">
            <h4  >
                Driver
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
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="company">Company</label>
                            <select class="form-control aj_company" name="company" data-plugin="select_hrm" data-placeholder="Company" required>
                                <option value="">Select Company</option>
                                                                <option value="1"> SANTE WELLNESS PTE. LTD.</option>
                                                            </select>
                        </div>
                    </div>
                    <div class="col-md-3 employee_ajax">
                        <div class="form-group">
                            <label for="employee_id">Employee</label>
                            <select name="employee_id" class="form-control employee_id" data-plugin="select_hrm" data-placeholder="Choose an Employee">
                                <option value="">Select Employee</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="benefits_year">Benefits Year</label>
                            <select class="form-control" name="benefits_year" id="benefits_year" data-plugin="select_hrm" data-placeholder="Benefit Year">
                                <option value=""></option>
                                <option value="2016" >2016</option>
                                <option value="2017" >2017</option>
                                <option value="2018" >2018</option>
                                <option value="2019" >2019</option>
                                <option value="2020" >2020</option>
                                <option value="2021" >2021</option>
                                <option value="2022" selected>2022</option>
                                <option value="2023">2023</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="driver_wage">Driver Annual Wage</label>
                            <input class="form-control" placeholder="Annual wage of driver" name="driver_wage" id="driver_wage" type="text">
                            <small id="driver_wage_help" class="form-text text-muted">Annual wages x (Private / Total Mileage)</small>
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