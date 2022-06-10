<div class="card"> 
    <div class="card-body">
        <h5>List All Transfers</h5>
        <table id='example6' class='table table-bordered table-sm' >
            <thead>
            <th>View</th>
            <th>Summary</th>
            <th>Company</th>
            <th>Transfer</th>
            <th><i class='fa fa-calendar-alt mr-2'></i>Date</th>
            <th>Status</th>
            </thead>
            <tbody>
                 <?php for($i=1; $i<=50; $i++) {?>
                <tr>
                    <td><?= rand() ?></td>
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
