<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>

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
                                    <select id="sort" class="form-control" id="ingredients">
                                      <option value="">Recipe List</option>
                                      <option value="">Order by Views</option>
                                      <option value="">Order by Scraps</option>
                                      <option value="">Order by latest</option>
                                      <option value="">Ingredients 4</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <button class="btn bueno-btn w-100">Search</button>
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


 <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
 
         <!-- First Photo Grid-->
        <div class="w3-row-padding w3-padding-16 w3-center" id="food">
         <c:forEach items="${recipes}" var="recipe">
            <div class="w3-quarter">
                <img src='/upload/recipe/${recipe.thumbnail}' alt="Sandwich" style="width:280px; height:250px">
                <h3><a href='detail?no=${recipe.recipeNo}'>${recipe.title}</a></h3>
                <p>${recipe.content}</p>
            </div>
        </c:forEach>
        </div>
 </div>
 
     <script src="/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- All Plugins js -->
    <script src="/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="/js/active.js"></script>
</body>
</html>