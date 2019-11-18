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

<!-- mypage_sidebar start-->
<!-- Font Awesome -->
<link rel="stylesheet"
  href="/js/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
  href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/css/member/adminlte.min.css">
<!-- Favicon -->
<link rel="icon" href="/img/core-img/favicon.ico">
<!-- </head> -->
<!-- mypage_sidebar  end -->
<title>MY RECIPES</title>

<style>
</style>
</head>
<jsp:include page="../header.jsp" />
<jsp:include page="../member/mypage_sidebar.jsp" />
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper" style=" margin: 0 0 0 15%;">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="width: 1100px;">
			<h1 class="myprofile-h1">Dashboard</h1>
			<figure class="snip1559" style="margin-left:25%;">
				<div class="profile-image">
					<input type="hidden" id="userphoto" value="${member.photo}" /> <img
						src='/upload/member/${member.photo}' id="userThumb"
						class="my-thumb profile-img">
				</div>
				<figcaption>
					<h3>${member.nickname}</h3>
				</figcaption>
			</figure>

			<!-- Main content -->
			<section class="content">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box">
							<div class="inner">
								<h3 class="myprofile-h3">Recipe</h3>
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
								<h3 class="myprofile-h3">Review</h3>
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
								<h3 class="myprofile-h3">Order</h3>
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
								<h3 class="myprofile-h3">Bookmark</h3>
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
		</div>
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
	<script>
		/* Demo purposes only */
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
	</script>
	
  <!--  mypage_sidebar script  start -->
  <!-- jQuery -->
  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <!-- jQuery UI 1.11.4 -->
  <script src="/node_modules/jquery-ui-dist/jquery-ui.min.js"></script>
  <!-- AdminLTE App -->
  <script src="/js/dist/adminlte.js"></script>

  <script>
    function sidebar_form() {
      // hidden값을 이용해서 자바스크립트를 이용한 경우
      if ($("#userphoto").val() == null || $("#userphoto").val() == "") {
        $("#userThumb").attr("src", "/upload/member/info_photo.jpg");
      } else {
        $("#userThumb").attr("src",
            "/upload/member/" + $("#userphoto").val());
      }
    }
  </script>
  
  <!--  mypage_sidebar script  end -->
  </body>
<jsp:include page="../footer.jsp" />
</html>