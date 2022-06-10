<section>
    <div class="card">
        <div class="card-header">
            <h4>
                List All Other Benefits 
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
                
                <div id="otherBenefitCont">
                    <div class="row mt-3" id="otherBenefitDiv">
                        <div class="col-md-2 utAdd">
                            <div class="form-group">
                                <button type="button" class="btn icon-btn btn-xs btn-success waves-effect waves-light utAddbtn">Add New <span class="fa fa-plus"></span></button>
                            </div>
                            
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="other_benefit">Benefit</label>
                                <select class="form-control selectut" name="other_benefit[]" data-plugin="select_hrm" data-placeholder="Benefit" required>
                                    <option value="Select Service">Select Service</option>
                                    <option value="Home Leave Passage & Incidental Benefit">Home Leave Passage & Incidental Benefit</option>
                                    <option value="Interest Payment">Interest Payment</option>
                                    <option value="Insurance Premiums">Insurance Premiums</option>
                                    <option value="Free or Subsidised Holidays">Free or Subsidised Holidays</option>
                                    <option value="Educational expenses">Educational expenses</option>
                                    <option value="Social or Recreational clubs Fee">Social or Recreational clubs Fee</option>
                                    <option value="Gains from Assets sold to Employee">Gains from Assets sold to Employee</option>
                                    <option value="Motor Vehicle cost given to Employee">Motor Vehicle cost given to Employee</option>
                                    <option value="Car Benefits">Car Benefits</option>
                                    <option value="Other Benefit">Other Benefit</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="other_benefit_remark">Remark</label>
                                <input class="form-control" placeholder="Remarks" name="other_benefit_remark[]" type="text">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="other_benefit_cost">Actual Cost</label>
                                <input class="form-control" placeholder="Acutal cost of benefit" name="other_benefit_cost[]" type="text" required>
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