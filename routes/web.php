<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Staff\EmployeeController;
use App\Http\Controllers\Staff\EmpExitController;
use App\Http\Controllers\Staff\roleController;

use App\Http\Controllers\corehr\awardsController;
use App\Http\Controllers\corehr\transferController;
use App\Http\Controllers\corehr\resignationController;
use App\Http\Controllers\corehr\promotionsController;
use App\Http\Controllers\corehr\complaintsController;
use App\Http\Controllers\corehr\warningsController;
use App\Http\Controllers\corehr\terminationController;

use App\Http\Controllers\organization\officialController;
use App\Http\Controllers\organization\locationController;
use App\Http\Controllers\organization\companyController;
use App\Http\Controllers\organization\announcementController;
use App\Http\Controllers\organization\departmentController;
use App\Http\Controllers\organization\designationController;
use App\Http\Controllers\organization\companypolicyController; 
use App\Http\Controllers\organization\organisationChartController;

 
use App\Http\Controllers\Training\trainingController;
use App\Http\Controllers\Training\TrainersController;
use App\Http\Controllers\Training\trainingTypeController;

use App\Http\Controllers\HrReports\HrreportsController;
use App\Http\Controllers\HrReports\hrCalendarController;
use App\Http\Controllers\HrReports\hrImportsController;

use App\Http\Controllers\HrReports\dashboardController;

use App\Http\Controllers\staff\StaffController;

use App\Http\Controllers\Payroll\payrollController;
use App\Http\Controllers\Payroll\payslipHistoryController;

use App\Http\Controllers\Timesheet\TimesheetdashboardController;
use App\Http\Controllers\Timesheet\attendanceController;
use App\Http\Controllers\Timesheet\monthlyTimesheetController;
use App\Http\Controllers\Timesheet\timesheetCalendarController;
use App\Http\Controllers\Timesheet\datewiseAttendanceController;
use App\Http\Controllers\Timesheet\updateAttendanceController;
use App\Http\Controllers\Timesheet\overtimeRequestController;
use App\Http\Controllers\Timesheet\officeShiftController;
use App\Http\Controllers\Timesheet\manageHolidaysController;
use App\Http\Controllers\Timesheet\manageLeavesController;
use App\Http\Controllers\Timesheet\leaveStatusController;
use App\Http\Controllers\Purchase\PurchaseController;

use App\Http\Controllers\Warehousing\WarehousesController;
use App\Http\Controllers\Warehousing\FixedAssetsController;

use App\Http\Controllers\Warehousing\InOutBoundController;

use App\Http\Controllers\Warehousing\RacksController;

use App\Http\Controllers\Warehousing\StocksController; 
use App\Http\Controllers\Auth\AuthController;

use App\Http\Controllers\Efilling\efillingDetailsController;
use App\Http\Controllers\Efilling\appendix8aController;
use App\Http\Controllers\Efilling\appendix8bController;
use App\Http\Controllers\Efilling\cpfSubmittionController;
use App\Http\Controllers\Efilling\EfillingController;
use App\Http\Controllers\Efilling\iraController;
use App\Http\Controllers\Efilling\iraSubmittionController;
use App\Http\Controllers\Efilling\iraFormController;

use App\Http\Controllers\Customers\clientsController;
use App\Http\Controllers\Customers\clientUsersController;

use App\Http\Controllers\Performance\appraisalController;
use App\Http\Controllers\Performance\goalTrackingController;
use App\Http\Controllers\Performance\goalTypeController;
use App\Http\Controllers\Performance\indicatorController;

use App\Http\Controllers\Projects\projectdashboardController;
use App\Http\Controllers\Projects\projectsController;
use App\Http\Controllers\Projects\tasksController;

use App\Http\Controllers\System\constantsController;
use App\Http\Controllers\System\databaseBackupController;
use App\Http\Controllers\System\emailTemplatesController;
use App\Http\Controllers\System\paymentGateawayController;
use App\Http\Controllers\System\settingsController;
use App\Http\Controllers\System\setupModulesController;
use App\Http\Controllers\System\themeSettingsController;

use App\Http\Controllers\Sales\estimatesController;
use App\Http\Controllers\Sales\expensesController;
use App\Http\Controllers\Sales\invoiceController;
use App\Http\Controllers\Sales\paymentsController;
use App\Http\Controllers\Sales\productsController;

use App\Http\Controllers\Other\teamMemeberController;
use App\Http\Controllers\Other\timesheetsController;
use App\Http\Controllers\Admin\AdminAuthController;
use Illuminate\Support\Facades\DB;

 /*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/login/page', [AdminAuthController::class ,'login_page'])->name('login-page');
Route::get('/register/page', [AdminAuthController::class ,'register_page'])->name('register-page');

Route::get('/', function () {
    return view('layout.app');
});
Route::get('admin/login', [AuthController::class , 'login_page']);
Route::get('admin/register', [AuthController::class, 'register_page']);

Route::get('/',[StaffController::class, 'staff_dashboard'])->name('staff-dashboard');

Route::get('staff/directory',[StaffController::class, 'staff_directory'])->name('staff-directory');

Route::get('staff/dashboard',[StaffController::class, 'staff_dashboard'])->name('staff-dashboard');


Route::get('staff/employee/benifits',[EmployeeController::class, 'employee_benifits'])->name('employee-benifits');
Route::get('staff/employee/last/login',[EmployeeController::class, 'employee_last_login'])->name('employee-last-login');
Route::get('staff/employee/exit',[EmpExitController::class, 'index'])->name('employee-exit');
Route::get('staff/expired/documents',[EmployeeController::class, 'expired_documents'])->name('expired-documents'); 

 
Route::get('staff/profile',[EmployeeController::class, 'profile'])->name('staff-profile');
Route::post('staff/add-employee',[EmployeeController::class, 'add_employee'])->name('employee-add');

//roles and privilages
Route::get('staff/role/privilage',[roleController::class, 'roles_and_privilages'])->name('roles-and-privilages');

Route::post('staff/role/add-role',[roleController::class, 'add_role'])->name('add-role');
Route::get('staff/role-delete/{id}',[roleController::class,'destroy'])->name('role-delete');
Route::get('staff/role-edit-form/{id}',[roleController::class,'edit'])->name('role-edit-form');
Route::post('staff/role-update',[roleController::class,'update'])->name('role-update');
//Core Hr

Route::get('corehr/awards', [awardsController::class, 'index'])->name('awards');
 
Route::get('corehr/complaints', [complaintsController::class, 'index'])->name('complaints');
Route::get('corehr/promotions', [promotionsController::class, 'index'])->name('promotions');
Route::get('corehr/resignations', [resignationController::class, 'index'])->name('resignations');
Route::get('corehr/terminations', [terminationController::class, 'index'])->name('terminations');
Route::get('corehr/transfers', [transferController::class, 'index'])->name('transfers');
Route::get('corehr/warnings', [warningsController::class, 'index'])->name('warnings');
//org company 
Route::get('org/company',[companyController::class,'index'])->name('org-company');
Route::get('org/company/edit/{id}',[companyController::class,'edit'])->name('org-company-edit');
Route::get('org/official/documents',[officialController::class, 'index'])->name('org-official-documents');
Route::get('org/location',[locationController::class,'index'])->name('org-location');
Route::get('org/announcements',[announcementController::class,'index'])->name('org-announcements');
Route::get('org/departments',[departmentController::class,'index'])->name('org-departments');
Route::get('org/designation',[designationController::class,'index'])->name('org-designation');
Route::get('org/company/policy',[companypolicyController::class,'index'])->name('org-company-policy'); 
Route::get('org/chart', [organisationChartController::class, 'index'])->name('org-chart');
// 
Route::get('payslip/history',[payslipHistoryController::class, 'index'])->name('payslip-history');
Route::get('payroll',[payrollController::class, 'index'])->name('payroll');
 
//
Route::get('training/list',[trainingController::class, 'index'])->name('training-list');
Route::get('training/type',[trainingTypeController::class, 'index'])->name('training-type');
Route::get('trainers/list',[trainersController::class, 'index'])->name('trainners-list');
//
 
Route::get('hr/dashboard', [dashboardController::class, 'index'])->name('hr-dashboard'); 
Route::get('hr/reports', [HrreportsController::class, 'index'])->name('hr-reports');
Route::get('hr/imports', [hrImportsController::class, 'index'])->name('hr-imports');
Route::get('hr/calendar', [hrCalendarController::class, 'index'])->name('hr-calendar'); 
//
 
Route::get('timesheet/dashboard', [TimesheetdashboardController::class, 'index'])->name('timesheet-dashboard');
Route::get('timesheet/attendance', [attendanceController::class, 'index'])->name('timesheet-attendance');
Route::get('timesheet/monthly', [monthlyTimesheetController::class, 'index'])->name('monthly-timesheet');
Route::get('timesheet/calendar', [timesheetCalendarController::class, 'index'])->name('timesheet-calendar');
Route::get('timesheet/datewise/attendance', [datewiseAttendanceController::class, 'index'])->name('date-wise-attendance');
Route::get('timesheet/update/attendance', [updateAttendanceController::class, 'index'])->name('update-attendance');
Route::get('timesheet/overtime/registraion', [overtimeRequestController::class, 'index'])->name('overtime-request'); 
Route::get('timesheet/office/shifts', [officeShiftController::class, 'index'])->name('office-shifts'); 
Route::get('timesheet/manage/holidays', [manageHolidaysController::class, 'index'])->name('manage-holidays'); 
Route::get('timesheet/manage/leaves', [manageLeavesController::class, 'index'])->name('manage-leaves'); 
Route::get('timesheet/manage/status', [leaveStatusController::class, 'index'])->name('manage-status'); 

//purchase 
Route::get('purchase/vendors',[purchaseController:: class, 'vendors'])->name('purchase-vendors');
Route::get('purchase/orders',[purchaseController:: class, 'orders'])->name('purchase-orders');
//warehouses 
Route::get('warehousing/warehouses',[WarehousesController::class, 'index'])->name('warehouses');
Route::get('warehousing/racks',[RacksController::class, 'index'])->name('racks');
Route::get('warehousing/stocks',[StocksController::class, 'index'])->name('stocks');
Route::get('warehousing/fixed',[FixedAssetsController::class, 'index'])->name('fixed-assets');
Route::get('warehousing/inbound/outbound',[InOutBoundController::class, 'index'])->name('inbound-outbound');

//efilling

Route::get('efilling/appendix8a',[appendix8aController::class, 'index'])->name('appendix8a');
Route::get('efilling/appendix8b',[appendix8bController::class, 'index'])->name('appendix8b');
Route::get('efilling/ira8',[iraController::class, 'index'])->name('ira');
Route::get('efilling/ira8/form',[iraFormController::class, 'index'])->name('ira-form');
Route::get('efilling/ira/submittion',[iraSubmittionController::class, 'index'])->name('ira-submittion');
Route::get('efilling/cpf/submittion',[cpfSubmittionController::class, 'index'])->name('cpf-submittion');
Route::get('efilling',[EfillingController::class, 'index'])->name('efilling');
Route::get('efilling/detials',[efillingDetailsController::class, 'index'])->name('efilling-details');

//Customers

Route::get('customers/clients',[clientsController::class, 'index'])->name('clients');
Route::get('customers/client/users',[clientUsersController::class, 'index'])->name('client-users');

//Performance

Route::get('performance/appraisal',[appraisalController::class, 'index'])->name('performance-appraisal');
Route::get('performance/indicator',[indicatorController::class, 'index'])->name('performance-indicator');
Route::get('performance/goal/tracking',[goalTrackingController::class, 'index'])->name('performance-goal-tracking');
Route::get('performance/goal/type',[goalTypeController::class, 'index'])->name('performance-goal-type');

//system
Route::get('system/constants',[constantsController::class, 'index'])->name('system-constants');
Route::get('system/database/backup',[databaseBackupController::class, 'index'])->name('system-database-backup');
Route::get('system/email/templates',[emailTemplatesController::class, 'index'])->name('system-email-templates');
Route::get('system/payment/gateaway',[paymentGateawayController::class, 'index'])->name('system-payment-gateaway');
Route::get('system/settins',[settingsController::class, 'index'])->name('system-settings');
Route::get('system/setup/modules',[setupModulesController::class, 'index'])->name('system-setup-modules');
Route::get('system/theme',[themeSettingsController::class, 'index'])->name('system-theme-setting');

//staff
Route::get('staff/employee',[EmployeeController::class, 'index'])->name('employees');
Route::get('staff/employee/edit{id}', [EmployeeController::class, 'edit'])->name('employee-edit');
Route::get('staff/employee/delete{id}', [EmployeeController::class, 'delete'])->name('employee-delete');

//projects
Route::get('projects',[projectsController::class, 'index'])->name('projects');
Route::get('projects/dashboard',[projectdashboardController::class, 'index'])->name('projects-dashboard');

Route::get('tasks',[tasksController::class, 'index'])->name('tasks');
 
//sales
Route::get('sales/estimates',[estimatesController::class, 'index'])->name('sales-estimates');
Route::get('sales/expense',[expensesController::class, 'index'])->name('sales-expenses');
Route::get('sales/invoice',[invoiceController::class, 'index'])->name('sales-invoice');
Route::get('sales/payments',[paymentsController::class, 'index'])->name('sales-payments');
Route::get('sales/products',[productsController::class, 'index'])->name('sales-products');

//others

Route::get('other/team/members',[teamMemeberController::class, 'index'])->name('other-team-members');
Route::get('other/time/sheets',[timesheetsController::class, 'index'])->name('other-time-sheet');

//add announcemet crud
 Route::any('announcement/add', [announcementController::class, 'store'] )->name('announcement-add');
Route::any('announcement/delete/{id}', [announcementController::class, 'delete'])->name('announcement-delete');
Route::any('announcement/edit/{id}', [announcementController::class, 'edit'])->name('announcement-edit');
Route::any('announcement/update', [announcementController::class, 'update'])->name('announcement-update');

//staff
Route::any('staff/employee/exit/add',[EmpExitController::class, 'store'] )->name('emp-exit-add');
Route::get('staff/employee/delete/{id}',[EmpExitController::class, 'delete'])->name('emp-exit-delete');
Route::get('staff/employee/edit/{id}',[EmpExitController::class, 'edit'])->name('emp-exit-edit');
Route::post('staff/employee/update',[EmpExitController::class, 'update'])->name('emp-exit-update');

//
Route::any('staff/employee/exit/add',[EmpExitController::class, 'store'] )->name('emp-exit-add');
Route::get('staff/employee/delete/{id}',[EmpExitController::class, 'delete'])->name('emp-exit-delete');
Route::get('staff/employee/edit/{id}',[EmpExitController::class, 'edit'])->name('emp-exit-edit');
Route::post('staff/employee/update',[EmpExitController::class, 'update'])->name('emp-exit-update');

//transfer
Route::any('transfer/add', [transferController::class, 'store'] )->name('transfer-add');
Route::any('transfer/delete/{id}', [transferController::class, 'delete'])->name('transfer-delete');
Route::any('transfer/edit/{id}', [transferController::class, 'edit'])->name('transfer-edit');
Route::any('transfer/update', [transferController::class, 'update'])->name('transfer-update');
Route::any('transfer/show/{id}', [transferController::class, 'show'])->name('transfer-show');
//awards
Route::any('awards/add', [awardsController::class, 'store'])->name('add-awards');
Route::any('awards/delete/{id}', [awardsController::class, 'delete'])->name('delete-awards');
Route::any('awards/edit/{id}', [awardsController::class, 'edit'])->name('edit-awards');
Route::any('awards/update', [awardsController::class, 'update'])->name('update-awards');
Route::any('awards/show/{id}', [awardsController::class, 'show'])->name('show-awards');
//Resignation 
Route::any('resignation/add', [resignationController::class, 'store'] )->name('resignation-add');
Route::any('resignation/delete/{id}', [resignationController::class, 'delete'])->name('resignation-delete');
Route::any('resignation/edit/{id}', [resignationController::class, 'edit'] )->name('resignation-edit');
Route::any('resignation/update', [resignationController::class, 'update'])->name('resignation-update'); 
Route::any('resignation/edit/{id}', [resignationController::class, 'edit'])->name('resignation-edit');
Route::any('resignation/update', [resignationController::class, 'update'])->name('resignation-update');
Route::any('resignation/show/{id}', [transferController::class, 'show'])->name('resignation-show');
//termination

Route::any('termination/add', [terminationController::class, 'store'] )->name('termination-add');
Route::any('termination/delete/{id}', [terminationController::class, 'delete'])->name('termination-delete');
Route::any('termination/edit/{id}', [terminationController::class, 'edit'])->name('termination-edit');
Route::any('termination/update', [terminationController::class, 'update'])->name('termination-update');
Route::any('termination/show', [awardsController::class, 'show'])->name('show-termination');
//promotions
Route::any('promotions/add', [promotionsController::class, 'store'] )->name('promotions-add');
Route::any('promotions/delete/{id}', [promotionsController::class, 'delete'])->name('promotions-delete');
Route::any('promotions/edit/{id}', [promotionsController::class, 'edit'])->name('promotions-edit');
Route::any('promotions/update', [promotionsController::class, 'update'])->name('promotions-update');
Route::any('promotions/show', [awardsController::class, 'show'])->name('show-promotions');
//complaints 
Route::any('complaints/add', [complaintsController::class, 'store'] )->name('complaints-add');
Route::any('complaints/delete/{id}', [complaintsController::class, 'delete'])->name('complaints-delete');
Route::any('complaints/edit/{id}', [complaintsController::class, 'edit'])->name('complaints-edit');
Route::any('complaints/update', [complaintsController::class, 'update'])->name('complaints-update');
Route::any('complaints/show', [awardsController::class, 'show'])->name('complaints-awards');
//warnings
Route::any('warnings/add', [warningsController::class, 'store'] )->name('warnings-add');
Route::any('warnings/delete/{id}', [warningsController::class, 'delete'])->name('warnings-delete');
Route::any('warnings/edit/{id}', [warningsController::class, 'edit'])->name('warnings-edit');
Route::any('warnings/update', [warningsController::class, 'update'])->name('warnings-update');
Route::any('awards/show', [awardsController::class, 'show'])->name('show-awards');
//company 
Route::any('company/add', [companyController::class, 'store'] )->name('company-add');
Route::any('company/delete/{id}', [companyController::class, 'delete'])->name('company-delete');
Route::any('company/edit/{id}', [companyController::class, 'edit'])->name('company-edit');
Route::any('company/update', [companyController::class, 'update'])->name('company-update');
Route::any('company/show/{id}',[companyController::class, 'show'])->name('company-show');
//official-documents
Route::any('offical/documents/add', [officialController::class, 'store'] )->name('official-documents-add');
Route::any('offical/documents/delete/{id}', [officialController::class, 'delete'])->name('official-documents-delete');
Route::any('offical/documents/edit/{id}', [officialController::class, 'edit'])->name('official-documents-edit');
Route::any('offical/documents/update', [officialController::class, 'update'])->name('official-documents-update');
//locations
Route::any('locations/add', [locationController::class, 'store'] )->name('locations-add');
Route::any('locations/delete/{id}', [locationController::class, 'delete'])->name('locations-delete');
Route::any('locations/edit/{id}', [locationController::class, 'edit'])->name('locations-edit');
Route::any('locations/update', [locationController::class, 'update'])->name('locations-update');
//training
Route::any('training/add', [trainingController::class, 'store'] )->name('training-add');
Route::any('training/delete/{id}', [trainingController::class, 'delete'])->name('training-delete');
Route::any('training/edit/{id}', [trainingController::class, 'edit'])->name('training-edit');
Route::any('training/update', [trainingController::class, 'update'])->name('training-update');
//training types
Route::any('training/type/add', [trainingTypeController::class, 'store'] )->name('training-type-add');
Route::any('training/type/delete/{id}', [trainingTypeController::class, 'delete'])->name('training-type-delete');
Route::any('training/type/edit/{id}', [trainingTypeController::class, 'edit'])->name('training-type-edit');
Route::any('training/type/update', [trainingTypeController::class, 'update'])->name('training-type-update');
//trainers 
Route::any('trainers/add', [TrainersController::class, 'store'] )->name('trainer-add');
Route::any('trainers/delete/{id}', [TrainersController::class, 'delete'])->name('trainer-delete');
Route::any('trainers/edit/{id}', [TrainersController::class, 'edit'])->name('trainer-edit');
Route::any('trainers/update', [TrainersController::class, 'update'])->name('trainer-update');
//policy

Route::any('policy/add', [companypolicyController::class, 'store'] )->name('policy-add');
Route::any('policy/delete/{id}', [companypolicyController::class, 'delete'])->name('policy-delete');
Route::any('policy/edit/{id}', [companypolicyController::class, 'edit'])->name('policy-edit');
Route::any('policy/update', [companypolicyController::class, 'update'])->name('policy-update');
Route::any('policy/view/{id}', [companypolicyController::class, 'view'])->name('policy-view');


//dependent
Route::get('/dependent/{id}', function($id){
    $emp = DB::table('xin_employees')->where('company_id','=',$id)->get();
    echo json_encode($emp);
});