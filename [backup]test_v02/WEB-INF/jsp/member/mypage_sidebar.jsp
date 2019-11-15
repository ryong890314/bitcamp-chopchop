<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/member/sidebar.css">
<!--Top navbar content -->
<div class="container-fluid">
	<!--Search button-->
	<div class="container-full">
		<div id="wrapper">
			<!-- Sidebar -->
			<div class="col-lg-2">
				<div id="sidebar-wrapper">
					<ul class="sidebar-nav">
						<li><a href="/app/member/detail" class="nav-link"
							style="font-size: large;"> <i class="nav-icon fa fa-user"></i>
								My Profile
						</a></li>
						<li><a href="/app/recipe/myrecipe" class="nav-link"
							style="font-size: large;"> <i class="nav-icon fa fa-paw"></i>
								My Recipe
						</a></li>
						<li><a href="/app/member/detail" class="nav-link"
							style="font-size: large;"> <i class="nav-icon fa fa-book"></i>
								My Review
						</a></li>
						<li><a href="/app/order/searchbymember" class="nav-link"
							style="font-size: large;"> <i class="nav-icon fa fa-list"></i>
								My Order
						</a></li>
						<li><a href="/app/recipe/myscrap" class="nav-link"
							style="font-size: large;"> <i class="nav-icon fa fa-bookmark"></i>
								My Bookmark
						</a></li>
					</ul>
				</div>
			</div>
			<!-- /#sidebar-wrapper -->
		</div>
	</div>
	<!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->
<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
</script>