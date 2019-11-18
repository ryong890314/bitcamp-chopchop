<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/w3.css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="/js/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!--Theme style -->
<link rel="stylesheet" href="/css/member/adminlte.min.css">
<!--Favicon -->
<link rel="icon" href="/img/core-img/favicon.ico">
<!-- </head> -->

<title>MY SCRAP RECIPES</title>
<style type="text/css">
.mInfo {
	border-bottom: 2px solid #404040;
}
.sInfo-font {
  font-family: 'Sunflower', sans-serif;
}
.mypage-tagA {
  font-size: inherit;
  color:#404040;
}
</style>
</head>
<jsp:include page="../header.jsp" />
<jsp:include page="../member/mypage_sidebar.jsp" />
<body>
<!-- 	<div class="content-wrapper"> -->
		<div class="w3-main w3-content w3-padding sInfo-font"
			style="max-width: 1200px;">
			<div class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
      <h3>My Bookmark</h3>
       <span style="float: right;font-size: 14px;">
       <a href="/app/member/myprofile" class="mypage-tagA">My Page</a>&nbsp>&nbspMy Bookmark</a></span> 
		</div>
			<div class="w3-row-padding w3-padding-16 w3-center" id="food"></div>

		<script src="/js/jquery/jquery-2.2.4.min.js"></script>
		<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

		<script id="t1" type="listHtml">
{{#each result}}
<div class='w3-quarter my-list'>
    <img src='/upload/recipe/{{thumbnail}}' alt='Sandwich' style='width:200px; height:215px;'>
    <h3><a href='detail?no={{recipeNo}}'>{{title}}</a></h3>
    <p>{{content}}</p>
</div>
{{/each}}
</script>

		<script>
			"use strict";
			var dbody = $('#food');
			var templateSrc = $('#t1').html();
			var template = Handlebars.compile(templateSrc);

			loadList();
			function loadList() {
				$.get("/app/json/recipe/myscrap", function(data) {
					console.log(data.result);
					dbody.html(template(data));
				});
			}
		</script>

		<!-- jQuery -->
		<script src="/node_modules/jquery/dist/jquery.min.js"></script>
		<!-- jQuery UI 1.11.4-->
		<script src="/js/jquery-ui/jquery-ui.min.js"></script>
		<!-- Bootstrap 4 AdminLTE App -->
		<script src="/js/dist/adminlte.js"></script>

		<script>
			function formLoad() {
				// hidden값을 이용해서 자바스크립트를 이용한 경우
				if ($("#userphoto").val() == null
						|| $("#userphoto").val() == "") {
					$("#userThumb")
							.attr("src", "/upload/member/info_photo.jpg");
				} else {
					$("#userThumb").attr("src",
							"/upload/member/" + $("#userphoto").val());
				}
			}
		</script>
	</div>
<!--   </div> -->
</body>
<jsp:include page="../footer.jsp" />
</html>