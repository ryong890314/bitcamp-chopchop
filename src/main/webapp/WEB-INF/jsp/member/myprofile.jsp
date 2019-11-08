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
<link rel="stylesheet" href="/css/member/myProfile.css">
<style>
.small-box:hover{
boarder:1px solid ;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<jsp:include page="../member/mypage_sidebar.jsp" />
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">Dashboard</h1>
						</div>
						<h2>${member.photo}</h2>
						<!-- /.col
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">My Page</li>
                            </ol>
                        </div>
                        <!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box">
								<div class="inner">
									<h3>My Recipe</h3>
									<p>All my recipes</p>
								</div>
								<div class="icon">
									<i class="ion ion-ios-paw"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box">
								<div class="inner">
									<h3>My Review</h3>
									<p>My Review</p>
								</div>
								<div class="icon">
									<i class="ion ion-ios-book"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box ">
								<div class="inner">
									<h3>My Order</h3>
									<p>My Order</p>
								</div>
								<div class="icon">
									<i class="ion ion-ios-list"></i>
								</div>
								<a href="/app/order/searchbymember" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box">
								<div class="inner">
									<h3>My Bookmar</h3>
									<p>My Bookmark</p>
								</div>
								<div class="icon">
									<i class="ion ion-bookmark"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
					</div>
					<!-- /.row -->
					<!-- Main row -->
					<!-- /.row (main row) -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<script>
		function formLoad() {
			// hidden값을 이용해서 자바스크립트를 이용한 경우
			if (document.getElementById("userphoto").value == null
					|| document.getElementById("userphoto").value == "") {
				document.getElementById("userThumb").src = "/upload/member/info_photo.jpg";
			} else {
				document.getElementById("userThumb").src = "/upload/member/"
						+ document.getElementById("userphoto").value;
			}
		}
	</script>
</body>
<jsp:include page="../footer.jsp" />
</html>
