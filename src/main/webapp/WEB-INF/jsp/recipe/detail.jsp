<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/detail.css">
  <link rel="stylesheet" href="/css/recipe/comment.css">
<style>
 .cookingphoto {
    height: 300px;
 }
 .bueno-btn {
    background-color: #b0c364;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: relative;
    z-index: 1;
    display: inline-block;
    min-width: 100px;
    height: 50px;
    color: #ffffff;
    border-radius: 0;
    padding: 0 30px;
    margin-top: 5px;
    font-size: 14px;
    line-height: 50px;
    font-weight: 500;
    text-transform: capitalize;
}

.bueno-btn:hover,
.bueno-btn:focus {
    font-size: 14px;
    font-weight: 500;
    background-color: #000000;
    color: #ffffff;
}
</style>

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
                      <h4 class="post-title">${recipe.title}
                       </h4>
                      <div class="post-meta mb-50">
                          <a href="#" class="post-date">${recipe.createdDate}</a>
                          <a href="#" class="post-author">By ${member.nickname}</a><br>
                          <a href="#" class="post-author">Views ${recipe.viewCount}</a>
                          
<button style="border:none; background-color: #ffffff; " id="likeBtn" type="button" ><img id="likeimg" class="btn-img" style="margin-top:-2px; margin-left:10px; height:15px;" src="${isCheck ? '/img/recipe/like.png' : '/img/recipe/unlike.png'}"></button>
                          <input type="hidden" name='recipeNo' value="${recipe.recipeNo}">
                          <span id="scrap" style="margin-left:5px; margin-bottom:5px;font-size:15px;">${recipe.scrap}</span><br>
                          <button id="updateBtn" class="btn bueno-btn">수정하기</button>
                      </div>
                      
                      <c:forEach items="${recipe.cookings}" var="cooking">
                      <h5 class="mb-30">Step ${cooking.processNo} :</h5>
                      <img src='/upload/recipe/${cooking.filePath}' class='cookingphoto'>
                      <p class="mb-30">내용: ${cooking.content}</p>
                      </c:forEach>
                      
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

<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<jsp:include page="../recipecomment/list.jsp"/>

<script>
loadData();
function loadData() {
  var writerNo = ${member.memberNo};
  var viewerNo = ${viewer.memberNo};
  if (writerNo != viewerNo) {
    $('#updateBtn').css('display', 'none');
  }
};

</script>

<script>
"use strict";
$('#likeBtn').click(function() {
  $.get("/app/json/recipe/like?no=" + ${recipe.recipeNo}, function(data) {
    if(data.result.isLike) { //좋아요를 눌름
      $('#likeimg').attr('src', '/img/recipe/like.png');
      $('span#scrap').html(data.result.scrap);
    } else { // 좋아요를 취소
      $('#likeimg').attr('src', '/img/recipe/unlike.png');
      $('span#scrap').html(data.result.scrap);
    }
  })
});
</script>
<script>
"use strict";
$('#updateBtn').click(function() {
  location.href='/app/recipe/updateform?no=' + ${recipe.recipeNo};
});
</script>

</body>
</html>