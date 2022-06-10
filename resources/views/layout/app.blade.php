<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>@yield('title','Admin')</title>
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ url('public/plugins/fontawesome-free/css/all.min.css') }}">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css") }}>
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="{{ url('public/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
  <!-- iCheck -->
  <link rel="stylesheet" href="{{ url('public/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
  <!-- JQVMap -->
  <link rel="stylesheet" href="{{ url('public/plugins/jqvmap/jqvmap.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ url('public/dist/css/adminlte.min.css') }}">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="{{ url('public/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="{{ url('public/plugins/daterangepicker/daterangepicker.css') }}">
  <!-- summernote -->
  <link rel="stylesheet" href="{{ url('public/plugins/summernote/summernote-bs4.min.css') }}">
 
  <link rel="stylesheet" href="{{ url('public/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
  <link rel="stylesheet" href="{{ url('public/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
  <script type="text/javascript" src="{{ url('public/plugins/jquery/jquery.min.js') }}"></script>
  <link rel="stylesheet" href="{{ url('public/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <style type="text/css">
    .card , .form-control, .btn , .small-box{
      border-radius: 0px;
    }
    table thead {
      background-color: #dee2e6;
    }
    tr td  {
       font-family: bahnschrift;
      align-items: center;
       
    }
    .card-header {

    }
    .card{
      border-radius: 0px;
    }
   
   
  </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed text-sm">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__rotate" src="{{ url('public/dist/img/spinner.gif')}}" alt="AdminLTELogo" height="60" width="60">
  </div>



  <!-- Navbar -->
@include('layout.navbar')
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
@include('layout.sidebar')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">
              @yield('heading')
            </h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home / </a></li>
              @yield('page-label')
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
         
        @yield('page-body')
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer layout-footer-fixed text-sm">
    <strong> <a href="#">Bizzman web</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
       
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-light">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper --> 
 

<script src="{{ url('public/plugins/jquery/jquery.min.js') }}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{ url('public/plugins/jquery-ui/jquery-ui.min.js') }}"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="{{ url('public/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<!-- ChartJS -->
<script src="{{ url('public/plugins/chart.js/Chart.min.js') }}"></script>
<!-- Sparkline -->
<script src="{{ url('public/plugins/sparklines/sparkline.js') }}"></script>
<!-- JQVMap -->
<script src="{{ url('public/plugins/jqvmap/jquery.vmap.min.js') }}"></script>
<script src="{{ url('public/plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script>
<!-- jQuery Knob Chart -->
<script src="{{ url('public/plugins/jquery-knob/jquery.knob.min.js') }}"></script>
<!-- daterangepicker -->
<script src="{{ url('public/plugins/moment/moment.min.js') }}"></script>
<script src="{{ url('public/plugins/daterangepicker/daterangepicker.js') }}"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="{{ url('public/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
<!-- Summernote -->
<script src="{{ url('public/plugins/summernote/summernote-bs4.min.js') }}"></script>
<!-- overlayScrollbars -->
<script src="{{ url('public/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ url('public/dist/js/adminlte.js') }}"></script>
<!-- AdminLTE for demo purposes -->
<!-- <script src="{{ url('public/dist/js/demo.js') }}"></script> -->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="{{ url('public/dist/js/pages/dashboard.js') }}"></script>
<script src="{{ url('public/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{ url('public/plugins/jszip/jszip.min.js')}}"></script>
<script src="{{ url('public/plugins/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{ url('public/plugins/pdfmake/vfs_fonts.js')}}"></script>
<script src="{{ url('public/plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{ url('public/plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>

<script src="{{ url('public/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
<!-- Toastr -->
<script src="{{ url('public/plugins/toastr/toastr.min.js') }}"></script>

<script>
  $(function () {
    $("#example1 ,#example3").DataTable({
      "responsive": true, "lengthChange": true, "autoWidth": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print" ]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    $('#example2').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "responsive": true,
       
    });

    $('#example5').DataTable( {
       
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
       dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });

  });
</script>

</body>
</html>
