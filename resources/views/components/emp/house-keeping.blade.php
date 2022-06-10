<section>
    <div class="card">
         <div class="card-header">
            <h4>
List All Housekeeping Wages
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
                    <div class="col-md-4">
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
                </div>
                
                <div id="houseKeepingCont">
                    <div class="row mt-3" id="housekeepingDiv">
                        <div class="col-md-2 utAdd">
                            <div class="form-group">
                                <button type="button" class="btn icon-btn btn-xs btn-success waves-effect waves-light utAddbtn">Add New <span class="fa fa-plus"></span></button>
                            </div>
                            
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="housekeeping_service">Housekeeping Service</label>
                                <select class="form-control selectut" name="housekeeping_service[]" data-plugin="select_hrm" data-placeholder="Housekeeping Service" required>
                                    <option value="">Select Service</option>
                                    <option value="servant">Servant</option>
                                    <option value="gardener">Gardener</option>
                                    <option value="upkeep_of_compound">Upkeep of Compound</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="housekeeping_remark">Remark</label>
                                <input class="form-control" placeholder="Remarks" name="housekeeping_remark[]" type="text">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="housekeeping_amount">Annual Wage</label>
                                <input class="form-control" placeholder="Acutal Amount or Annual wage" name="housekeeping_amount[]" type="text" required>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="text-right"> 
                    <button   type="submit" class="btn btn-primary" >
                    <i class="fa fa fa-check-square mr-3"></i> Save
                    </button>
                </div>
    </div>
</div>
</section>