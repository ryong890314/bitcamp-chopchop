<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/w3.css">
<link rel="stylesheet" href="/css/recipe/list.css">
   <style>
   a {
   color: black;
   }
   /* :: 3.7.0 bueno Button */
.bueno-btn {
    background-color: #b0c364;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: relative;
    z-index: 1;
    display: inline-block;
    min-width: 160px;
    height: 50px;
    color: #ffffff;
    border-radius: 0;
    padding: 0 30px;
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
    <title>Recipe List</title>
</head>
<body onload="loadList();">

<%-- findRecipe --%>
<jsp:include page="findRecipe.jsp"/>


<!-- ##### Search Area Start ##### -->
    <div class="bueno-search-area section-padding-100-0 pb-70 bg-img" style="height: 50px; background-image: url(/img/core-img/pattern.png);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30" style="display: none">
                                </div>
                            </div>
<!--                             <div class="col-12 col-sm-6 col-lg-3"> -->
<!--                                 <div class="form-group mb-30"  style="display: none"> -->
<!--                                 </div> -->
<!--                             </div> -->

                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <select id="select" name='column' class="form-control my-sort">
                                      <option value="recipe_id" selected="selected">Recipe List</option>
                                      <option value="view_count">Order by Views</option>
                                      <option value="scrap">Order by Scraps</option>
                                      <option value="created_date">Order by latest</option>
                                      <option value="">Ingredients 4</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <button id="sortBtn" class="btn bueno-btn w-100" type="button">Search</button>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                              <button id="add" class="btn bueno-btn w-100" type="button" onclick="location='form.jsp'">레시피등록</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

        
<!-- <form action='form'> -->
<!--   <button class="btn bueno-btn mt-30">레시피 등록</button> -->
<!-- </form> -->

<%--리스트 출력    --%>

 <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
 
         <!-- First Photo Grid-->
        <div class="w3-row-padding w3-padding-16 w3-center" id="food">
<%--          <c:forEach items="${recipes}" var="recipe"> --%>
<!--             <div class="w3-quarter my-list"> -->
<%--                 <img src='/upload/recipe/${recipe.thumbnail}' alt="Sandwich" style="width:280px; height:250px"> --%>
<%--                 <h3><a href='detail?no=${recipe.recipeNo}'>${recipe.title}</a></h3> --%>
<%--                 <p>${recipe.content}</p> --%>
<!--             </div> -->
<%--         </c:forEach> --%>
        </div>
 </div>
 
 <%--리스트 출력    --%>
 
<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<script src="/js/plugins/plugins.js"></script>
<script src="/js/active.js"></script>
<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

<script id="t1" type="listHtml">
<div class='w3-quarter my-list'>
    <img src='/upload/recipe/{{thumbnail}}' alt='Sandwich' style='width:280px; height:250px'>
    <h3><a href='detail?no={{recipeNo}}'>{{title}}</a></h3>
    <p>{{content}}</p>
</div>
</script>

<script>
"use strict";
var dbody = $('#food');
var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);

function loadList() {
  $.get("/app/json/recipe/list", function(data) {
    for (var b of data.result) {
      $(template(b)).appendTo(dbody);
    }
  });
}
</script>

<script>
"use strict";

var dbody = $('#food');
var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);

$('#sortBtn').click(function() {
  $('.my-list').remove();
  
  var selectOption = $('#select option:selected').val();// var selectOption : 프로퍼티명
  console.log(selectOption);
  
  $.get("/app/json/recipe/listSort?column=" + selectOption, function(data) {
    for (var b of data.result) {
      $(template(b)).appendTo(dbody);
    }
  });
  
});
</script>

</body>
</html>