<div class="row">
	<div class="col-md-4">
		<div class="p-3 border bg-white">
			<h5> Add New Education Level </h5>
			<form>
				<p>
					<label>Education Level</label>
					<input type="text" name="" class="form-control" placeholder="Education Lavel">
				</p>
				<p>
					<button class="btn btn-primary"><i class="fa fa-check-square"></i>Save</button>
				</p>
			</form>
		</div>
	</div>
	<div class="col-md-8">
		<div class="border p-3 bg-white">
			<h5>List All Education Level</h5>
			<table class="table table-sm" id="example3">
				<thead>
					<th>Action</th>
					<th>Education Lavel</th>
				</thead>
				<tbody>
					<?php for($a=0; $a<=20; $a++) {?>
					<tr>
						<td><?= date('Y-m-d') ?></td>
						<td><?= date('Y-m-d') ?></td>
					</tr>
					<?php }?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<br>

<div class="row">
	<div class="col-md-4">
		<div class="p-3 border bg-white">
			<h5>Add New Language</h5>
			<form>
				<p>
					<label>Language</label>
					<input type="text" name="" class="form-control" placeholder="Language">
				</p>
				<p>
					<button class="btn btn-primary"><i class="fa fa-check-square"></i>Save</button>
				</p>
			</form>
		</div>
	</div>
	<div class="col-md-8">
		<div class="border p-3 bg-white">
			<h5>List All Languages</h5>
			<table class="table table-sm" id="example3">
				<thead>
					<th>Action</th>
					<th>Language</th>
				</thead>
				<tbody>
					<?php for($a=0; $a<=20; $a++) {?>
					<tr>
						<td><?= date('Y-m-d') ?></td>
						<td><?= date('Y-m-d') ?></td>
					</tr>
					<?php }?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<br>

<div class="row">
	<div class="col-md-4">
		<div class="p-3 border bg-white">
			<h5>Add New Skill</h5>
			<form>
				<p>
					<label>Skill</label>
					<input type="text" name="" class="form-control" placeholder="Skill">
				</p>
				<p>
					<button class="btn btn-primary"><i class="fa fa-check-square"></i>Save</button>
				</p>
			</form>
		</div>
	</div>
	<div class="col-md-8">
		<div class="border p-3 bg-white">
			<h5>List All Skill</h5>
			<table class="table table-sm" id="example3">
				<thead>
					<th>Action</th>
					<th>Skill</th>
				</thead>
				<tbody>
					<?php for($a=0; $a<=20; $a++) {?>
					<tr>
						<td><?= date('Y-m-d') ?></td>
						<td><?= date('Y-m-d') ?></td>
					</tr>
					<?php }?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<br>

