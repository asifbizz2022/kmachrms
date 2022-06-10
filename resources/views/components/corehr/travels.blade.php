<div class="card"> 
    <div class="card-body">
        <h5>List All Travels</h5>
        <table id='example7' class='table table-bordered table-sm' >
            <thead>
            <th>View</th>
            <th>Summary</th>
            <th>Place of Visit</th>
            <th><i class='fa fa-calendar-alt mr-2'></i>Start Date</th>
            <th><i class="fa fa-calendar-alt mr-2"></i>End Date</th> 
            </thead>
            <tbody>
                 <?php for($i=1; $i<=50; $i++) {?>
                <tr>
                    <td><?php echo rand(1111,2222) ?></td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td> 
                </tr>
                 <?php }?>
            </tbody>
        </table>
    </div>
</div>
