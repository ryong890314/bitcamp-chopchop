<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<style>
.navbar {
	position: fixed !important;
	z-index: 1010;
	width: 100%;
	top: 0;
	right: 0;
	left: 0;
}

.nav-logo {
	width: 100px;
	height: 100px;
}

.top-header-area {
	position: relative;
	z-index: 1;
	width: 100%;
	height: 150px;
}

@media only screen and (min-width: 768px) and (max-width: 991px) {
	.top-header-area {
		height: 80px;
	}
}

@media only screen and (max-width: 767px) {
	.top-header-area {
		height: 120px;
	}
}

@media only screen and (min-width: 576px) and (max-width: 767px) {
	.top-header-area {
		height: 75px;
	}
}
</style>
</head>
<nav class="navbar navbar-expand-lg">
	<a class="nav-logo" href="/app/member/list"><img
		src="/img/core-img/choplogo.png" alt=""></a>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="#">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">ChopRecipe</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">ChopStore</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">ChopTalk</a></li>
			<li class="nav-item"><a class="nav-link" href="#">ChopRank</a></li>

			<!-- Login/Register -->
			<c:if test="${not empty loginUser}">
				<li><a class="nav-link" href="/app/recipe/form"> <i
						class="fa fa-cutlery fa-lg" title="Add Recipe"></i>
				</a></li>
				<li><a class="nav-link" href="/app/cart/search"
					title="View Cart"> <i class="fa fa-shopping-cart fa-lg"></i>
				</a></li>
			</c:if>
			<c:if test="${empty loginUser}">
				<li><a class="nav-link" href='/app/auth/signin'>Sign in</a></li>
			</c:if>
			<c:if test="${not empty loginUser}">
				<li><a class="nav-link" href="/app/member/myProfile">Hello!
						${loginUser.nickname}</a></li>
			</c:if>
			<c:if test="${not empty loginUser}">
				<li><a class="nav-link" href='/app/auth/logout'>Sign out</a></li>
			</c:if>
		</ul>
	</div>
</nav>

<script>
	
</script>

</html>
