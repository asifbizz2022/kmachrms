<div class="card"> 
    <div class="card-body">
        <h5>List All Warnings</h5>
        <table id='example8' class='table table-bordered table-sm' >
            <thead> 
            <th>View</th>
            <th>Subject</th>
            <th><i class="fa fa-calendar-alt mr-2"></i>Warning Date</th>
            <th><i class='fa fa-user mr-2'></i>Warning By </th>
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
