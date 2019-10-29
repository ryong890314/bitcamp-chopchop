<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.cookingphoto {
	height: 200px;
}
</style>
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Bueno - Food Blog HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet" href="/css/recipe/detail.css">


<title>레시피 보기</title>
</head>
<body>

<!-- 댓글 입력 -->
<%@ include file="../recipecomment/form.jsp" %>






<div id='content'>
<h1>댓글등록</h1>

<form>
<div class="form-group row my-view-group">
  <label for="fiCommentNo" class="col-sm-2 col-form-label">댓글번호</label>
  <div class="col-sm-10">
    <input type="text" readonly class="form-control-plaintext" 
      id="fiCommentNo">
  </div>
</div>

<div class="form-group row my-view-group">
  <label for="fiRecipeNo" class="col-sm-2 col-form-label">레세피번호</label>
  <div class="col-sm-10">
    <input type="text" readonly class="form-control-plaintext" 
      id="fiRecipeNo">
  </div>
</div>

<div class="form-group row my-view-group">
  <label for="staticCreatedDate" class="col-sm-2 col-form-label">등록일</label>
  <div class="col-sm-10">
    <input type="text" readonly class="form-control-plaintext" 
      id="staticCreatedDate">
  </div>
</div>

<div class="form-group row my-view-group">
  <label for="fiContent" class="col-sm-2 col-form-label">내용</label>
  <div class="col-sm-10">
  
    <textarea class="form-control" 
      id="fiContent" rows="5"></textarea>
  </div>
</div>


<div class="form-group row">
  <div class="col-sm-10">
<button id="btnUpdate" type="button" class="btn btn-primary my-view-group">변경</button>
</div>
</div>

<div class="form-group row">
  <div class="col-sm-10">
    <button id="btnAdd" type="button" class="btn btn-primary my-view-group">등록</button><br>
    <button id="btnUpdate" type="button" class="btn btn-primary my-view-group">변경</button>
    <button id="btnDelete" type="button" class="btn btn-danger my-view-group">삭제</button>
    <button id="btnList" type="button" class="btn btn-danger my-view-group">목록</button>
  </div>
</div>
</form>
</div>




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
	<!-- RecipeComment js -->
	<script src="/js/recipecomment/form.js"></script>
	<script src="/js/recipecomment/choprecipecomment.js"></script>
	
	
</body>
</html>