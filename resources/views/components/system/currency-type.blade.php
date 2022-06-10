<div class="row">
	<div class="col-md-4">
		<div class="p-3 border bg-white">
			<h5>Add New Currency Type</h5>
			<form>
				<p>
					<label>Currency Name</label>
					<input type="text" name="" class="form-control" placeholder="Currency Name">
				</p>
				<p>
					<label>Currency Code</label>
					<input type="text" name="" class="form-control" placeholder="Currency Code">
				</p>
				<p>
					<label>Currency Symbol</label>
					<input type="text" name="" class="form-control" placeholder="Currency Symbol">
				</p>
				<p>
					<button class="btn btn-primary"><i class="fa fa-check-square"></i>Save</button>
				</p>
			</form>
		</div>
	</div>
	<div class="col-md-8">
		<div class="border p-3 bg-white">
			<h5>List All Currency Type</h5>
			<table class="table table-sm" id="example3">
				<thead>
					<th>Action</th>
					<th>Name</th>
					<th>Code</th>
					<th>Symbol</th>
				</thead>
				<tbody>
					<?php for($a=0; $a<=20; $a++) {?>
					<tr>
						<td><?= date('Y-m-d') ?></td>
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