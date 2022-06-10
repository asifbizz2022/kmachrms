<div class=""> 
    <div class="border p-3">
        <h5>List All Complaints</h5>
        <table id='example2' class='table table-bordered table-sm' >
            <thead>
            <th>View</th>
            <th><i class='fa fa-user mr-2'></i>Complaints From</th>
            <th><i class='fa fa-users mr-2'></i>Complaint Against</th>
            <th>Complaint Title</th>
            <th><i class="fa fa-calendar-alt mr-2"></i>Complaint Date</th>
            
            </thead>
            <tbody>
                 <?php for($i=1; $i<=50; $i++) {?>
                <tr>
                    <td><?= rand() ?></td>
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
