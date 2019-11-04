<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ChopChop-MyPage</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/css/member/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
				href="#"><i class="fas fa-bars"></i></a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="../member/list" class="nav-link">Home</a></li>
		</ul>
	</nav>
	<!-- /.navbar -->

	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-success-primary elevation-4">
		<!-- Brand Logo -->
		<a href="/app/member/myProfile" class="brand-link"> <span
			class="brand-text font-weight-light">ChopChop-MyPage</span>
		</a>

		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="info">
					<!-- user name받기~ -->
					<a href="/app/pet/list" class='nav-user'>${loginUser.nickname}</a>
				</div>
			</div>

			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					
					<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
					<li class="nav-item"><a href="/app/member/detail?no=${loginUser.memberNo}"
						class="nav-link"> <i class="nav-icon fa fa-user"></i>
							<p>My Profile</p>
					</a></li>
					<li class="nav-item"><a href="/app/member/detail?no=${loginUser.memberNo}"
						class="nav-link"> <i class="nav-icon fa fa-paw"></i>
							<p>My Recipe</p>
					</a></li>
					<li class="nav-item"><a href="/app/member/detail?no=${loginUser.memberNo}"
						class="nav-link"> <i class="nav-icon fa fa-book"></i>
							<p>My Review</p>
					</a></li>
					<li class="nav-item"><a href="pages/widgets.html"
						class="nav-link"> <i class="nav-icon fa fa-tags"></i>
							<p>My Order</p>
					</a></li>
					<li class="nav-item"><a href="pages/widgets.html"
						class="nav-link"> <i class="nav-icon fa fa-bookmark"></i>
							<p>My Bookmark</p>
					</a></li>
				</ul>

			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
 <!-- jQuery -->
    <script src="/js/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="/js/jquery-ui/jquery-ui.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="/node_modules/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/js/dist/adminlte.js"></script>
</body>

</html>
