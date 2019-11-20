<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/w3.css">
<title>MY RECIPES</title>
<style>
.rInfo {
	border-bottom: 2px solid #404040;
}

.mypage-tagA {
	color: #404040;
}
</style>
</head>
<jsp:include page="../header.jsp" />
<jsp:include page="../member/mypage_sidebar.jsp" />
<body>
	<div class="w3-main w3-content w3-padding rInfo-font"
		style="max-width: 1200px;margin-right: 197px;margin-bottom: 310px;">
		<div
			class="d-flex justify-content-between align-items-center py-0 mb-3 rInfo">
			<h3>My Recipe</h3>
			<span style="float: right; font-size: 14px;"> <a
			 class="mypage-tagA">My Page</a>&nbsp>&nbspMy
				Recipe</a></span>
		</div>
		<div class="w3-row-padding w3-padding-16 w3-center" id="food"></div>
	</div>

	<script src="/js/jquery/jquery-2.2.4.min.js"></script>
	<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

	<script id="t1" type="listHtml">
{{#each result}}
<div class='w3-quarter my-list'>
  <img src='/upload/recipe/{{thumbnail}}' alt='Sandwich' style='width:200px; height:215px;'>
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