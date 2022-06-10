 
<div class=""> 
    <div class="border p-3">
        <h5>List All Loan</h5>
        <table id='example2' class='table table-bordered table-sm' >
            <thead> 
                <th>Action</th>
                <th>Loan</th>
                <th>Loan Amount</th>
                <th>Loan Time</th>
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

 
<div class="border p-3 mt-3">
    <h5>List All Commissions</h5>
    <form action="#">
        <div class="row">
            <div class="col">
                <label for="">Loan Options</label>
                <select name="loan-options" class="form-control">
                    <option>Social Security System Loan</option>
                     <option>Home Development Mutual Fund Loan</option>
                      <option>Other Loans</option>
                </select>
            </div>
            <div class="col">
                <label for="">Title</label>
                <input name="title" class="form-control" placeholder="Title">
            </div>
            <div class="col">
                <label for="">Loan Amount</label>
                <input name="loadn-amount" class="form-control" placeholder="Loan Amount">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <label for="">Start Date</label>
                    <input type="date" name="start-date" class="form-control" placeholder="Start Date">
            </div>
            <div class="col">
                <label for="">End Date</label>
                <input type="date" name="end-date" class="form-control" placeholder="End Date">
            </div> 
        </div>
        <div class="row">
            <div class="col">
                <label>Reason</label>
               <textarea name="reason" class="form-control" id="id" name="name" rows="5" cols="5"></textarea>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col">
                <button type="submit" class="btn btn-primary float-right"> <i class="fa fa-check"></i> Save</button>
            </div>
        </div>
    </form>
</div>