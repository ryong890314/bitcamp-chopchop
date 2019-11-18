<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.main-nav {
	width: 100%;
	border: 1px solid #b0c364;
	float: left;
	border-radius: 15px;
	height: 100%;
}

.main-nav ul {
	list-style: none;
}

.main-nav ul li {
	padding-top: 10px;
}

.main-nav ul li a {
	color: #000;
	text-decoration: none;
}

.main-nav ul li a:hover {
	color: #b0c364;
}

.side-bar {
	/* z-index: 1000; */
	position: fixed;
	/* left: 14%; */
	overflow-y: auto;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	margin: 15% auto auto 5%;
	float: left;
	width: 10%;
}
</style>

<div class="side-bar">
	<nav class="mt-2 main-nav">
		<ul class="nav nav-pills nav-sidebar flex-column"
			data-widget="treeview" role="menu" data-accordion="false">

			<li><a href="/app/member/detail" class="nav-link"
				style="font-size: large;">
					<p>My Profile</p>
			</a></li>
			<li class="nav-item"><a href="/app/recipe/myrecipe"
				class="nav-link" style="font-size: large;">
					<p>My Recipe</p>
			</a></li>
			<li class="nav-item"><a href="/app/member/detail"
				class="nav-link" style="font-size: large;">
					<p>My Review</p>
			</a></li>
			<li class="nav-item"><a href="/app/order/searchbymember"
				class="nav-link" style="font-size: large;">
					<p>My Order</p>
			</a></li>
			<li class="nav-item"><a href="/app/recipe/myscrap"
				class="nav-link" style="font-size: large;">
					<p>My Bookmark</p>
			</a></li>
		</ul>
	</nav>
	<!--close-side-bar-->

</div>
<!--closed-full-page-->
