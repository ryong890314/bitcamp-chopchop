<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>ChopChop - Food Blog</title>

<!-- Favicon -->
<link rel="icon" href="/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="/css/member/style-header.css">

</head>

<body>
	<!-- ##### Header Area Start ##### -->
	<header class="header-area">

		<!-- Top Header Area -->
		<div class="top-header-area bg-img bg-overlay"
			style="background-image: url(/img/bg-img/header.jpg);">
			<div class="container h-100">
				<div class="row h-100 align-items-center justify-content-between">
					<div class="col-12 col-sm-6">
						<!-- Top Social Info -->
						<div class="top-social-info">
							<a href="#" data-toggle="tooltip" data-placement="bottom"
								title="Pinterest"><i class="fa fa-pinterest"
								aria-hidden="true"></i></a> <a href="#" data-toggle="tooltip"
								data-placement="bottom" title="Facebook"><i
								class="fa fa-facebook" aria-hidden="true"></i></a> <a href="#"
								data-toggle="tooltip" data-placement="bottom" title="Twitter"><i
								class="fa fa-twitter" aria-hidden="true"></i></a> <a href="#"
								data-toggle="tooltip" data-placement="bottom" title="Dribbble"><i
								class="fa fa-dribbble" aria-hidden="true"></i></a> <a href="#"
								data-toggle="tooltip" data-placement="bottom" title="Behance"><i
								class="fa fa-behance" aria-hidden="true"></i></a> <a href="#"
								data-toggle="tooltip" data-placement="bottom" title="Linkedin"><i
								class="fa fa-linkedin" aria-hidden="true"></i></a>
								<a class='' style="font-size:60px; margin-left: 60%; margin-bottom:20px; opacity:0.7;">ChopChop</a>
						</div>
					</div>
					<div class="col-12 col-sm-6 col-lg-5 col-xl-4">
						<!-- Top Search Area -->
						<div class="top-search-area">
							<form action="#" method="post">
								<input type="search" name="top-search" id="topSearch"
									placeholder="Search">
								<button type="submit" class="btn">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Navbar Area -->
		<div class="bueno-main-menu" id="sticker">
			<div class="classy-nav-container breakpoint-off"
				style="height: 100px;">

				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="buenoNav">
						<!-- Logo Area -->
						<!-- 						<a style="padding-top: 30px;" href="/app/member/list"><img
							src="/img/core-img/choplogo.png" style="width: 80px;" alt=""></a> -->
						<!-- Menu -->
						<div class="classy-menu" style="padding-top: 37px;">
							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<li><a class="nav-items" href="/app/member/list">Home</a></li>
									<li><a class="nav-items" href="#">ChopRecipe</a>
									<li><a class="nav-items" href="">ChopStore</a></li>
									<li><a class="nav-items" href="">ChopTalk</a></li>
									<li><a class="nav-items" href="">ChopRank</a></li>

									<!-- Login/Register -->
									<c:if test="${not empty loginUser}">
										<li><a href="/app/recipe/form" class="nav-link nav-item">
												<i class="fa fa-cutlery fa-lg" title="Add Recipe"></i>
										</a></li>
										<li><a href="/app/cart/search" class="nav-link nav-item"
											title="View Cart"> <i class="fa fa-shopping-cart fa-lg"></i>
										</a></li>
									</c:if>
									<c:if test="${empty loginUser}">
										<li><a class='classy-btn login-area'
											href='/app/auth/signin'>Sign in</a></li>
									</c:if>
									<c:if test="${not empty loginUser}">
										<li><a href="/app/member/myProfile" class='nav-user'>Hello!
												${loginUser.nickname}</a></li>
									</c:if>
									<c:if test="${not empty loginUser}">
										<li><a class='classy-btn c' href='/app/auth/logout'>Sign
												out</a></li>
									</c:if>

								</ul>
							</div>
							<!-- Nav End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->

	<div style="height: 30px;"></div>
</body>

<!-- ##### Footer Area End ##### -->

<!-- ##### All Javascript Script ##### -->
<!-- jQuery-2.2.4 js -->
<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="/js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="/js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="/js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="/js/active.js"></script>

</html>