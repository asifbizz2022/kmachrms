<div class="border p-3 bg-white">
	<h5>List All Expired Documents </h5><br>
	<table class="table table-sm" id="example3">
		<thead>
			<th>Action</th>
			<th>Employee</th>
			<th>Document Type</th>
			<th>Title</th>
			<th><i class="fa fa-calendar-alt mr-1"></i>Date of Expiry</th>
		</thead>
		<tbody>
			@for($a=0; $a<=50; $a++)
			<tr>
				<td>{{$a}}</td>
				<td>{{date('Y-m-d')}}</td>
				<td>{{date('Y-m-d')}}</td>
				<td>{{date('Y-m-d')}}</td>
				<td>{{date('Y-m-d')}}</td> 
			</tr>
			@endfor
		</tbody>
	</table>
</div>