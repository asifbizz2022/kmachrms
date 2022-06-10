<div class="card rounded-0">
<div class='card-body '>
    <h5>List All Awards</h5>
    <table id='example9' class='table table-sm table-bordered' >
        <thead>
        <th>View</th>
        <th><i class='fa fa-trophy mr-2'></i>Award Name</th>
        <th><i class='fa fa-gift mr-2'></i>Gift</th>
        <th><i class='fa fa-calendar-alt mr-2'></i>Month & Year</th>
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