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


<section class="post-news-area section-padding-100-0 mb-70">
      <div class="container">
          <div class="row justify-content-center">
              <!-- Post Details Content Area -->
          <div class="col-12 col-lg-4 col-xl-5">
              <div class="post-details-content mb-100">
                  <div class="blog-thumbnail mb-50">
                  <img src='/upload/recipe/${recipe.thumbnail}' alt="">
                  </div>
                  <div class="blog-content">
                      <h4 class="post-title">${recipe.title}</h4>
                      <div class="post-meta mb-50">
                          <a href="#" class="post-date">${recipe.createdDate}</a>
                          <a href="#" class="post-author">By ${member.nickname}</a><br>
                          <a href="#" class="post-author">By ${recipe.viewCount}</a><br>
                      </div>
                      <c:forEach items="${recipe.cookings}" var="cooking">
                      <h5 class="mb-30">Step ${cooking.processNo} :</h5>
                      <img src='/upload/recipe/${cooking.filePath}' class='cookingphoto'>
                      <p class="mb-30">내용: ${cooking.content}</p>
                      </c:forEach>
                      
                      <h5 class="mb-30">Step 2</h5>
                      <p class="mb-30">Suspendisse nisl leo, gravida quis tortor at, ornare commodo neque. Donec tortor turpis, pharetra et pulvinar vitae, ullamcorper et mi. Sed eu magna aliquam, suscipit massa sit amet, mattis augue. Nam ut tortor ut ligula molestie feugiat vitae et nulla. Sed porta erat vitae leo pellentesque malesuada. In sollicitudin, massa euismod aliquet volutpat, enim metus varius dui, vestibulum efficitur ante velit non nisi. Cras varius bibendum sapien, id tincidunt velit placerat id. Nunc vitae facilisis nunc. Suspendisse ut felis sagittis mauris faucibus tincidunt vitae id tortor. Nullam tincidunt finibus turpis, a accumsan mauris laoreet cursus. Phasellus pharetra odio sapien, id suscipit nisi lobortis ut.</p>
                  </div>
              </div>
          </div>

          <div class="col-12 col-lg-4 col-xl-4">
              <!-- Info -->
              <div class="recipe-info">
                  <ul class="info-data">
                     <li><span>test2</span></li>
                      <li><img src="img/core-img/eye.png" alt=""> <span>${recipe.viewCount} Views</span></li>
                      <li><img src="img/core-img/alarm-clock.png" alt=""> <span>30 min</span></li>
                      <li><img src="img/core-img/sandwich.png" alt=""> <span>카테고리:${recipe.category}</span></li>
                      <li><img src="img/core-img/compass.png" alt=""> <span>tag${recipe.tag}</span></li>
                  </ul>
              </div>

              <!-- Ingredients -->
              <div class="ingredients">
                  <h5>Ingredients</h5>
              <c:forEach items="${recipe.ingredients}" var="ingredient">
                  <!-- Custom Checkbox -->
                  <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck2">
                      <label class="custom-control-label" for="customCheck2">${ingredient.name} ${ingredient.quantity}</label>
                  </div>
              </c:forEach>
                  <!-- Custom Checkbox -->
                  <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck3">
                      <label class="custom-control-label" for="customCheck3">2 yogurt containers granulated sugar</label>
                  </div>
                </div>
            </div>

    </div>
    </div>
</section>


<a href="updateform?no=${recipe.recipeNo}">수정하기</a>

<form action="like" method='post' enctype='multipart/form-data'>
<input type="hidden" name='no' value="${recipe.recipeNo}">
<input type="hidden" name='memberNo' value="${recipe.memberNo}">
<input type="submit" value="좋아요">
<input type="text" name='scrap' value="${recipe.scrap}" readonly>
</form>

 















<!-- 댓글 입력 -->
<%@ include file="../recipecomment/form.jsp" %>
<%@ include file="../recipecomment/list.jsp" %>
<%@ include file="../recipecomment/detail.jsp" %>










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