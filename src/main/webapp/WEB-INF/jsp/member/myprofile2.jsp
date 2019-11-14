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
							<h1 class="m-0 text-dark myprofile-h1">Dashboard</h1>
							<div class="image-text">
									<input type="hidden" id="userphoto" value="${member.photo}" />
									<img src='/upload/member/${member.photo}' id="userThumb"
										class="my-thumb profile-img">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Main content -->
			<section class="content">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box">
							<div class="inner">
								<h3 class="myprofile-h3">My Recipe</h3>
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
								<h3 class="myprofile-h3">My Review</h3>
								<p>All my reviews</p>
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
								<h3 class="myprofile-h3">My Order</h3>
								<p>All my orders</p>
							</div>
							<div class="icon">
								<i class="ion ion-ios-list"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box">
							<div class="inner">
								<h3 class="myprofile-h3">My Bookmar</h3>
								<p>All my bookmarks</p>
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
			if ($("#userphoto").val() == null || $("#userphoto").val() == "") {
				$("#userThumb").attr("src", "/upload/member/info_photo.jpg");
			} else {
				$("#userThumb").attr("src",
						"/upload/member/" + $("#userphoto").val());
			}
		}
	</script>
</body>
<jsp:include page="../footer.jsp" />
</html>
