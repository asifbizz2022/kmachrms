<div class="card p-3 rounded-0">
	<h4 class="font-weight-bold">
		Import Leads - Import CSV file only
	</h4>
	<p class="mt-3 text-justify">
		The first line in downloaded csv file should remain as it is. Please do not change the order of columns in csv file.

The correct column order is (Contact Person, Email Address, Password, Contact Number, Company Name, Website URL, Address 1, Address 2, City, State, Zip Code, Country (Use Country ID) ) and you must follow the csv file, otherwise you will get an error while importing the csv file.
	</p>
	<div>
		<button class="btn btn-primary">
			<i class="fa fa-download"></i>
			Download sample File
		</button>
	</div>
	<div class="my-3">
		<form>
			<div class="form-group">
				<label>
					Upload File
				</label>
				<br>
				<input type="file" name="import-employees" class="form form-control">
				 
				<small>
					Please select csv or excel file (allowed file size 2MB
				</small>
			</div>
			<div class="form-group">

				<button type="submit" class="btn btn-primary float-right"> <i class="fa fa-check-square mr-3"></i>Save</button>
			</div>
		</form>
	</div>
</div>