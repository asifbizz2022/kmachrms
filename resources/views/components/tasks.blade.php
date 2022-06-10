<div class='border p-3'>
    <h5>List All Tasks</h5> 
    <table id='example2' class='table table-bordered table-sm'>
      <thead>
      <th>View</th>
      <th>Title</th>
      <th>End Date</th>
      <th>Status</th>
      <th>Assigned To</th>
      <th>Progress</th>
      </thead>
      <tbody>
          <?php for($a = 1; $a<=50; $a++) {?>
          <tr>
              <td><?php echo $a; rand(); ?></td>
              <td><?php echo time() ?></td>
              <td>3</td>
              <td>4</td>
              <td>5</td>
              <td>6</td>
          </tr>
          <?php } ?>
      </tbody>
</table>  
</div>