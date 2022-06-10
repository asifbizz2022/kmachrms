<div class='border p-3'>
    <h5>List All Projects</h5> 
    <table id='example5' class='table table-sm table-bordered'>
  <thead>
  <th>Project Summary</th>
  <th>Priority</th>
  <th><i class='fa fa-user mr-2'></i>Project Members</th>
  <th><i class='fa fa-calendar-alt mr-2'></i>End Date</th>
  <th>Progress</th>
  </thead>
  <tbody>
      <?php for($a = 1; $a<=50; $a++) {?>
      <tr>
          <td><?php echo $a; rand(); ?></td>
          <td><?php echo time() ?></td>
          <td><?php echo time() ?></td>
          <td><?php echo time() ?></td>
          <td><?php echo time() ?></td>
      </tr>
      <?php } ?>
  </tbody>
</table> 
</div>
