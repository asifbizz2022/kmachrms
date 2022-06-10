<div class="card"> 
    <div class="card-body">
        <h5>List All Promotions</h5>
        <table id='example3' class='table table-bordered table-sm' >
            <thead>
            <th>view</th>
            <th>Promotion Title</th>
            <th><i class='fa fa-calendar-alt mr-2'></i>Date</th>
            
            </thead>
            <tbody>
                 <?php for($i=1; $i<=50; $i++) {?>
                <tr>
                    <td><?= rand() ?></td>
                    <td>2</td>
                    <td>3</td>
                    
                </tr>
                 <?php }?>
            </tbody>
        </table>
    </div>
</div>
