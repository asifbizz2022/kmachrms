<div class="card"> 
    <div class="card-body">
        <h5>List All Tickets</h5>
        <table id='example4' class='table table-bordered table-sm' >
            <thead>
            <th>View</th>
            <th>Ticket Code</th>
            <th>Subject</th>
            <th>Priority</th>
            <th><i class='fa fa-calendar-alt mr-2'></i>Date</th>
            
            <tbody>
                 <?php for($i=1; $i<=50; $i++) {?>
                <tr>
                    <td><?= rand() ?></td>
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
