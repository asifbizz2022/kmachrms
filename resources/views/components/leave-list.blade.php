<div class='border p-3'>
    <h5>List All Leave</h5>
    <table id='example3' class='table table-sm table-bordered'>
      <thead>
      <th>View</th>
      <th>Leave Type</th>
      <th>Department</th>
      <th><i class='fa fa-calendar-alt mr-2'></i>Request Duration</th>
      <th><i class='fa fa-calendar-alt mr-2'></i>Applied On</th>
      </thead>
      <tbody>
           <?php for($a = 1; $a<=50; $a++) {?>
          <tr>
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

