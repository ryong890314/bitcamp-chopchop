<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="/css/recipe/w3.css"> -->
<link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.css">
<title>MY RECIPES</title>
<style>
.container {
  margin: 0 auto;
}

</style>
</head>
<jsp:include page="../member/mypage_sidebar.jsp" />
<body>
<div class="container" >
  <h1>My Recipe</h1>
  <div class="w3-main w3-content w3-padding" >
    <div class="w3-row-padding w3-padding-16 w3-center" id="food"></div>
  </div>
</div>


<div class="bueno-post-area mb-70">
  <div class="container">
    <div class="row ">
      <h3>popular product</h3>
        <div id="prod_columns">
          <c:forEach items="${productList}" var="product" begin='0' end="7" >
            <figure>
              <a href="/app/product/detail?no=${product.productNo}"><img src="/upload/product/${product.files[0].filePath}"></a>
              <figcaption>
                <div class="product-info">
                <a href="/app/product/detail?no=${product.productNo}">
                <div class="product-title"><b>${product.title}</b></div></a>
                  <div class="product-detail"><span>${product.detail}</span></div>
                  <div class="product-price"><span>${product.price}원</span></div>
                </div>
              </figcaption>
            </figure>
          </c:forEach>
        </div>
    </div>
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
    <p>{{content}}</p>
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
</body>
</html>