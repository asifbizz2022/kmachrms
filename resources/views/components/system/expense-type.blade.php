<div class="row">
	<div class="col-md-4">
		<div class="p-3 border bg-white">
			<h5>Add New Expense Type</h5>
			<form>
				<p>
					<label>Company</label>
					<select class="form-control">
						<option>Company</option>
					</select>
				</p>
				<p>
					<label>Expense Type</label>
					<input type="text" name="" class="form-control" placeholder="Expense Type">
				</p>
				<p>
					<button class="btn btn-primary"><i class="fa fa-check-square"></i>Save</button>
				</p>
			</form>
		</div>
	</div>
	<div class="col-md-8">
		<div class="border p-3 bg-white">
			<h5>List All Expense Type</h5>
			<table class="table table-sm" id="example3">
				<thead>
					<th>Action</th>
					<th>Company</th>
					<th>Expense Type</th>
				</thead>
				<tbody>
					<?php for($a=0; $a<=20; $a++) {?>
					<tr>
						<td><?= date('Y-m-d') ?></td>
						<td><?= date('Y-m-d') ?></td>
						<td><?= date('Y-m-d') ?></td>
					</tr>
					<?php }?>
				</tbody>
			</table>
		</div>
	</div>
</div>