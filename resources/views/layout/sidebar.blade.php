<aside class="main-sidebar sidebar-dark-primary text-sm elevation-0 nav-flat nav-legacy nav-compact sidebar-collapse">
    <!-- Brand Logo --> 
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="row">
        <div class="col ml-3 my-3">
          <img src="{{ url('public/dist/img/logo.png')}}" class="" alt="User Image" width="70%"  >
        </div>
         
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <a href="{{ route('hr-dashboard') }}" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                HR Dashboard 
              </p>
            </a>
            
          </li>
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                Staff
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('staff-dashboard') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Staff Dashboard</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('employees') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Employees</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('employee-benifits') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Employee Benifits</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('roles-and-privilages') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Roles And Privilages</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('staff-directory') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Staff Directory</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('employee-exit') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Employees Exit</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('expired-documents') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Expired Documents</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('employee-last-login') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Employees Last Login</p>
                </a>
              </li>
            </ul>
          </li> 
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-futbol"></i>
              <p>
                Core Hr
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('awards') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Awards</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('transfers') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Transfer</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('resignations') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Resignation</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('promotions') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Promotions</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('complaints') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Complaints</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('warnings') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Warnings</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('terminations') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Terminations</p>
                </a>
              </li>
            </ul>
          </li> 
          
            <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-building"></i>
              <p>
                Organization
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('org-company') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Company</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('org-official-documents') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Official Documents</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('org-announcements') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Announcements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('org-location') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Location</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('org-departments') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Departments</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('org-designation') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Designations</p>
                </a>
              </li>
            
              <li class="nav-item">
                <a href="{{ route('org-company-policy') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Company Policy</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('org-chart') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Organisation Chart</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-clock"></i>
              <p>
                Timesheet
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('timesheet-dashboard') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="{{ route('timesheet-attendance') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Attendance</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('monthly-timesheet') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Monthly Timesheet</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('timesheet-calendar') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Timesheet Calendar</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="{{ route('date-wise-attendance') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Date Wise Attendance</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('update-attendance') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Update Attendance</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('overtime-request') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Overtime Request</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('office-shifts') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Office Shifts</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('manage-holidays') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Manage Holidays</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('manage-leaves') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Manage Leaves</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('manage-status') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Leave Status</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-calculator"></i>
              <p>
                Payroll
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('payroll') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Payroll</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('payslip-history') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Payslip History</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-file"></i>
              <p>
                E-Filling
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('efilling-details') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>E Filling Details</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('cpf-submittion') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>CPF Submittion</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('ira-form') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>IRA8 Form</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('appendix8a') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Appendix 8A</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('appendix8b') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Appendix 8B</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('ira') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>IR8S</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('ira-submittion') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>IRAS Submittion</p>
                </a>
              </li>  
            </ul>
          </li>

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-graduation-cap"></i>
              <p>
                Trainings
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('training-list') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Training List</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('training-type') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Training Type</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('trainners-list') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Trainners List</p>
                </a>
              </li>
               
            </ul>
          </li> 

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-cube"></i>
              <p>
                Performance
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('performance-indicator') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Indicator</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('performance-appraisal') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Appraisal</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('performance-goal-tracking') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Goal Tracking</p>
                </a>
              </li>
               <li class="nav-item">
                <a  href="{{ route('performance-goal-type') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Goal Type</p>
                </a>
              </li>
            </ul>
          </li> 

          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-cog"></i>
              <p>
                System
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('system-settings') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Settings</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="{{ route('system-setup-modules') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Setup Modules</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('system-theme-setting') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Theme Settings</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('system-payment-gateaway') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Payment Gateaway</p>
                </a>
              </li>  
               <li class="nav-item">
                <a href="{{ route('system-constants') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Constants</p>
                </a>
              </li>  
               <li class="nav-item">
                <a href="{{ route('system-database-backup') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Database Backup</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('system-email-templates') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Email Templates</p>
                </a>
              </li>   
            </ul>
          </li>

           <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-folder"></i>
              <p>
                Projects
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('projects-dashboard') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('projects') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Projects</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('tasks') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tasks</p>
                </a>
              </li> 
            </ul>
          </li> 

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Customers
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('clients') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Clients</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('client-users') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Client Users</p>
                </a>
              </li> 
            </ul>
          </li>

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-money-bill"></i>
              <p>
                Sales
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('sales-invoice') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Invoice</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('sales-payments') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Payments</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('sales-estimates') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Estimates</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('sales-products') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products</p>
                </a>
              </li> 
               <li class="nav-item">
                <a href="{{ route('sales-expenses') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Expenses</p>
                </a>
              </li> 
            </ul>
          </li>

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-briefcase"></i>
              <p>
                Other
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('other-team-members') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Team Members</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('other-time-sheet') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Time Sheets</p>
                </a>
              </li> 
            </ul>
          </li>

         <!--  <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-warehouse"></i>
              <p>
                Ware Housing
                <i class="fas fa-angle-left right"></i> 
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('warehouses') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Warehouses</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('racks') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Racks</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('stocks') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Stocks</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('inbound-outbound') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inbound/Outbound</p>
                </a>
              </li> 
              <li class="nav-item">
                <a href="{{ route('fixed-assets') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Assets</p>
                </a>
              </li> 
            </ul>
          </li> -->

          
 
         
          <li class="nav-item">
            <a href="{{route('hr-reports')}}" class="nav-link">
              <i class="fa fa-chart-bar mr-3"></i>
              <p>HR Reports</p>
            </a>
          </li> 
        <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fa fa-phone mr-3"></i>
              <p>Leads</p>
            </a>
          </li> 
          <li class="nav-item">
            <a href="{{route('hr-calendar')}}" class="nav-link">
              <i class="fa fa-envelope mr-3"></i>
              <p>Mail Chimpms</p>
            </a>
          </li> 
          <li class="nav-item">
            <a href="{{route('hr-imports')}}" class="nav-link">
              <i class="fa fa-upload mr-3"></i>
              <p>HR Imports</p>
            </a>
          </li> 
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>