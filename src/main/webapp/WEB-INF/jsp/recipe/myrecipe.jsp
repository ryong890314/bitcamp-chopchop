<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/w3.css">
<link rel="stylesheet"
	href="/node_modules/bootstrap/dist/css/bootstrap.css">

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

<title>MY RECIPES</title>
<style>
a {
	color: #000000;
}
.mInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}
</style>
</head>
<jsp:include page="../header.jsp" />
<jsp:include page="../member/mypage_sidebar.jsp" />
<body>
	<div class="content-wrapper">
		<div class="w3-main w3-content w3-padding"
			style="max-width: 1200px;">
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 mInfo">
      <h3>My Recipe</h3>
       <span style="float: right;font-size: 14px;">
       <a href="" >My Page</a>&nbsp>&nbspMy Recipe</a></span> 
    </div>
			<div class="w3-row-padding w3-padding-16 w3-center" id="food">
			</div>
		</div>
    
		<script src="/js/jquery/jquery-2.2.4.min.js"></script>
		<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

		<script id="t1" type="listHtml">
{{#each result}}
<div class='w3-quarter my-list'>
  <img src='/upload/recipe/{{thumbnail}}' alt='Sandwich' style='width:280px; height:250px'>
  <div>
    <img src='/img/recipe/eye.png' style='height:15px; margin-top:-2.5px;'>&nbsp{{viewCount}}&nbsp&nbsp
    <img src='/img/recipe/like.png' style='height:15px; margin-top:-2px;'>&nbsp{{scrap}}
  </div>
    <h3><a href='detail?no={{recipeNo}}'>{{title}}</a></h3>
    <p>{{otherInfo}}</p>
<button type="del-btn" class="btn btn-light" onclick="del({{recipeNo}});">DELETE</button>
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
				$.get("/app/json/recipe/myrecipe", function(data) {
					console.log(data.result);
					dbody.html(template(data));
				});
			}
			function del(recipeNo) {
				$.get('/app/recipe/delete?no=' + recipeNo, function(data) {
					loadList();
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
</body>
<jsp:include page="../footer.jsp" />
</html>