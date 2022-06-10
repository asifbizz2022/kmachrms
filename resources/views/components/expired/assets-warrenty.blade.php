<div class="border p-3 bg-white">
	<h5>List All Assets Warranty </h5><br>
	<table class="table table-sm" id="example3">
		<thead>
			<th>Action</th>
			<th><i class="fa fa-filter mr-1"></i>Asset Name</th>
			<th>Categorey</th>
			<th>Company Asset Code</th>
			<th><i class="fa fa-calendar-alt mr-1"></i>is Working?</th>
			<th><i class="fa fa-user mr-1"></i>Assign To</th>
		</thead>
		<tbody>
			@for($a=0; $a<=50; $a++)
			<tr>
				<td>{{$a}}</td>
				<td>{{date('Y-m-d')}}</td>
				<td>{{date('Y-m-d')}}</td>
				<td>{{date('Y-m-d')}}</td>
				<td>{{date('Y-m-d')}}</td> 
				<td>{{date('Y-m-d')}}</td> 
			</tr>
			@endfor
		</tbody>
	</table>
</div>