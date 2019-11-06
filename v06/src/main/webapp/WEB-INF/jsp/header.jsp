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
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-content">
			<h3>Cooking in progress..</h3>
			<div id="cooking">
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div id="area">
					<div id="sides">
						<div id="pan"></div>
						<div id="handle"></div>
					</div>
					<div id="pancake">
						<div id="pastry"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">
		<!-- Logo Area -->
		<div class="logo-area">
			<a href="/app/member/list"><img src="/img/core-img/logo.png"
				alt=""></a>
		</div>

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
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="buenoNav">
						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>
						<!-- Menu -->
						<div class="classy-menu">
							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<li><a href="/app/member/list">Home</a></li>
									<li><a href="#">ChopRecipe</a>
										<div class="megamenu">
											<ul class="single-mega cn-col-4">
												<li><a href="/app/recipe/list">Dog</a></li>
												<li><a href="#">Cat</a></li>
												<li><a href="#">Small Animal</a>
												<li><a href="#">Reptilien</a>
											</ul>
										</div></li>
									<li><a href="">ChopStore</a></li>
									<li><a href="">ChopTalk</a></li>
									<li><a href="">ChopRank</a></li>
								</ul>

								<!-- Login/Register -->
								<div>
									<c:if test="${not empty loginUser}">
										<a href="" class="nav-link nav-item"> <i
											class="fa fa-shopping-cart"></i>
										</a>
										<a href="" class="nav-link nav-item"> <i
											class="fa fa-pencil-square-o"></i>
										</a>

									</c:if>
									<c:if test="${empty loginUser}">
										<a class='classy-btn login-area' href='/app/auth/signin'>Sign
											in</a>
									</c:if>
									<c:if test="${not empty loginUser}">
										<a>Hello!</a>
										<a class='nav-user'>${loginUser.nickname}</a>
										<a class='classy-btn login-area' href='/app/auth/logout'>Sign
											out</a>
									</c:if>
								</div>
							</div>
							<!-- Nav End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->

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
