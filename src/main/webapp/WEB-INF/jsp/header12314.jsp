<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<nav class='navbar navbar-expand-lg navbar-light bg-light'>
		<a class='navbar-brand' href='#'> <img src='/images/logo.png'
			class='d-inline-block align-top'> 수업관리시스템
		</a>
		<button class='navbar-toggler' type='button' data-toggle='collapse'
			data-target='#navbarNav' aria-controls='navbarNav'
			aria-expanded='false' aria-label='Toggle navigation'>
			<span class='navbar-toggler-icon'></span>
		</button>
		<div class='collapse navbar-collapse' id='navbarSupportedContent'>
			<ul class='navbar-nav'>
				<li class='nav-item active'><a class='nav-link'
					href='/app/member/list'>Home</a></li>
				<li class='nav-item active'><a class='nav-link'
					href='/app/board/list'>ChopRecipe</a></li>
				<li class='nav-item active'><a class='nav-link'
					href='/app/lesson/list'>ChopStore</a></li>
				<li class='nav-item active'><a class='nav-link'
					href='/app/member/list'>ChopTalk</a></li>
				<li class='nav-item active'><a class='nav-link'
					href='/app/photoboard/list'>ChopRank</a></li>
			</ul>
		</div>

		<div>
			<c:if test="${not empty loginUser}">
				<li><a href="/app/recipe/form" class="nav-link nav-item"> <i
						class="fa fa-cutlery fa-lg" title="Add Recipe"></i>
				</a></li>
				<li><a href="/app/cart/search" class="nav-link nav-item"
					title="View Cart"> <i class="fa fa-shopping-cart fa-lg"></i>
				</a></li>
			</c:if>
			<c:if test="${empty loginUser}">
				<li><a class='classy-btn login-area' href='/app/auth/signin'>Sign
						in</a></li>
			</c:if>
			<c:if test="${not empty loginUser}">
				<li><a href="/app/member/myProfile" class='nav-user'>Hello!
						${loginUser.nickname}</a></li>
			</c:if>
			<c:if test="${not empty loginUser}">
				<li><a class='classy-btn c' href='/app/auth/logout'>Sign
						out</a></li>
			</c:if>
		</div>
	</nav>
</header>