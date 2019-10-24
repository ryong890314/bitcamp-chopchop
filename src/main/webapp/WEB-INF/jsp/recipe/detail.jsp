<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 .cookingphoto {
    height: 100px;
 }
</style>

<link rel="stylesheet" href="../../css/detail.css">

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
                          <a href="#" class="post-author">By ${recipe.memberNo}</a><br>
                      </div>
                      <c:forEach items="${recipe.cookings}" var="cooking">
                      <h5 class="mb-30">Step 1 순서 : ${cooking.processNo}</h5>
                      <img src='/upload/recipe/${cooking.filePath}' class='cookingphoto'>
                      <p class="mb-30">내용: ${cooking.content}</p>
                      
                      </c:forEach>
                      
                      
                      <h5 class="mb-30">Step 2</h5>
                      <p class="mb-30">Suspendisse nisl leo, gravida quis tortor at, ornare commodo neque. Donec tortor turpis, pharetra et pulvinar vitae, ullamcorper et mi. Sed eu magna aliquam, suscipit massa sit amet, mattis augue. Nam ut tortor ut ligula molestie feugiat vitae et nulla. Sed porta erat vitae leo pellentesque malesuada. In sollicitudin, massa euismod aliquet volutpat, enim metus varius dui, vestibulum efficitur ante velit non nisi. Cras varius bibendum sapien, id tincidunt velit placerat id. Nunc vitae facilisis nunc. Suspendisse ut felis sagittis mauris faucibus tincidunt vitae id tortor. Nullam tincidunt finibus turpis, a accumsan mauris laoreet cursus. Phasellus pharetra odio sapien, id suscipit nisi lobortis ut.</p>

                      <h5 class="mb-30">Step 3</h5>
                      <p class="mb-30">Duis posuere odio vitae neque egestas luctus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer risus neque, sollicitudin pharetra pulvinar a, imperdiet porttitor nunc. Aenean pretium, libero eu pulvinar commodo, lorem enim bibendum est, vel suscipit est mi non tortor. Vestibulum sit amet pretium tortor. Donec posuere, dui quis dictum hendrerit, odio mauris aliquam lacus, eu egestas libero risus vel nisi. Proin condimentum varius lectus sed dapibus.</p>
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
                      <li><img src="img/core-img/compass.png" alt=""> <span>200F</span></li>
                  </ul>
              </div>

              <!-- Ingredients -->
              <div class="ingredients">
              <c:forEach items="${recipe.ingredients}" var="ingredient">
                  <h5>Ingredients</h5>
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

                  <!-- Custom Checkbox -->
                  <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck4">
                      <label class="custom-control-label" for="customCheck4">1 vanilla or plain yogurt, 170g container</label>
                  </div>

                  <!-- Custom Checkbox -->
                  <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck5">
                      <label class="custom-control-label" for="customCheck5">2 yogurt containers unbleached white flour</label>
                  </div>

                  <!-- Custom Checkbox -->
                  <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck6">
                      <label class="custom-control-label" for="customCheck6">1.5 yogurt containers milk</label>
                  </div>

                  <!-- Custom Checkbox -->
                  <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck7">
                      <label class="custom-control-label" for="customCheck7">1/4 tsp cinnamon</label>
                  </div>

                  <!-- Custom Checkbox -->
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck8">
                        <label class="custom-control-label" for="customCheck8">1 cup fresh blueberries </label>
                    </div>
                </div>
            </div>

    </div>
</section>

<!-- ------------------------------------------------------------------------------------------------- 

<div id='content'>
번호: ${recipe.no}<br>
회원번호:${recipe.memberNo}<br>
제목: ${recipe.title}<br>
작성일: ${recipe.createdDate}<br>
조회수: ${recipe.viewCount}<br>
내용: ${recipe.content}<br>
대표사진: <img src='/upload/recipe/${recipe.thumbnail}' class='photo'> <br>
카테고리:${recipe.category}<br>
기타정보:${recipe.otherInfo}<br>

<c:forEach items="${recipe.ingredients}" var="ingredient">
  재료: ${ingredient.name}
  용량${ingredient.quantity}<br>
</c:forEach>

<c:forEach items="${recipe.cookings}" var="cooking">
  순서: ${cooking.processNo}
  사진:<img src='/upload/recipe/${cooking.filePath}' class='photo'>
  내용: ${cooking.content}<br>
</c:forEach>
-->
태그:${recipe.tag}<br>
<a href="updateform?no=${recipe.recipeNo}">수정하기</a>

<form action="like" method='post' enctype='multipart/form-data'>
<input type="hidden" name='no' value="${recipe.recipeNo}">
<input type="hidden" name='memberNo' value="${recipe.memberNo}">
<input type="submit" value="좋아요">
<input type="text" name='scrap' value="${recipe.scrap}" readonly>
</form>
</div>

</body>
</html>