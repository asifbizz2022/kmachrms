<div class='border p-3'>
    <h5>List All Pay-Slip</h5>
<table id='example2' class='table table-sm table-bordered'>
  <thead>
  <th>Action</th>
  <th>Net Payable</th>
  <th>Salary Month</th>
  <th>Payroll Date</th>
  <th>Status</th>
  </thead>
  <tbody>
      <?php for($a = 1; $a<=50; $a++) {?>
      <tr>
          <td><?php echo $a; rand(); ?></td>
          <td><?php echo time() ?></td>
          <td>3</td>
          <td>4</td>
          <td>5</td>
      </tr>
      <?php } ?>
  </tbody>
</table> 
</div>
