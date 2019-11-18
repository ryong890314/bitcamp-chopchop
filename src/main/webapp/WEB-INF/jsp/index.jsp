<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHOPCHOP MAIN</title>
<link rel="stylesheet" href="/css/main/main_style.css">
</head>
<jsp:include page="header.jsp"/>
<body>
    <!-- ##### Hero Area Start ##### -->
    <h3>popular recipe</h3>
    <div class="hero-area">
        <!-- Hero Post Slides -->
        <div class="hero-post-slides owl-carousel">
            <!-- Single Slide -->
            <c:forEach items="${recipeList}" var="recipe">
            <div class="single-slide">
                <!-- Blog Thumbnail -->
                <div class="blog-thumbnail">
                    <a href="/app/recipe/detail?no=${recipe.recipeNo}">
                    <img class="recipe_thumb tagA" src="/upload/recipe/${recipe.thumbnail}"></a>
                </div>
  	            <!-- Blog Content -->
  	            <div class="blog-content-bg" >
                  <input type="hidden" name="recipeNo" id="recipeNo" value="${recipe.recipeNo}">
    	            <div class="blog-content-bg">
  	                <div class="blog-content">
	                    <span class="post-tag">${recipe.category}</span>
	                    <a href="/app/recipe/detail?no=${recipe.recipeNo}" class="post-title tagA">${recipe.title}</a>
                      <div class="post-meta">
                        <span class="post-author">by ${recipe.memberNo}</span><br>
                        <span class="post-date">${recipe.createdDate}</span>
                      </div>
  	                </div>
    	            </div>
  	            </div>
              </div>
            </c:forEach>
        </div>
    </div>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Catagory Area Start ##### -->
    <div class="post-catagory section-padding-100-0 mb-70">
        <div class="container">
            <div class="row" style="width: 1100px;margin: 0 auto;">
            <h3>chop Store</h3>
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4 px-1">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/photo1.png">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <span class="post-tag">chop store</span>
                                <a href="/app/product/category?species=강아지" class="post-title tagA">강아지</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4 px-1">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/photo1.png">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <span class="post-tag">chop store</span>
                                <a href="/app/product/category?species=고양이" class="post-title tagA">고양이</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4 px-1">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/photo1.png">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <span class="post-tag">chop store</span>
                                <a href="/app/product/category?species=작은" class="post-title tagA">작은친구들</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Catagory Area End ##### -->

<div class="bueno-post-area mb-70">
  <div class="container">
    <div class="row" style="width: 1100px;margin: 0 auto;">
      <h3>popular product</h3>
        <div id="prod_columns">
          <c:forEach items="${productList}" var="product" begin='0' end="7" >
            <figure>
              <a href="/app/product/detail?no=${product.productNo}"><img src="/upload/product/${product.files[0].filePath}"></a>
              <figcaption>
                <div class="product-info">
                  <div class="product-title tagA">
                    <a href="/app/product/detail?no=${product.productNo}"><strong style="font-size: 22px;">${product.title}</strong></a>
                  </div>
                  <div class="product-detail"><span>${product.detail}</span></div>
                    <div class="product-price">
                      <c:if test="${product.discount ne 0}">
                        <span style="color:#35c5f0;">${product.discount}%&nbsp</span>
                        <span style=" text-decoration:line-through">
                        <fmt:formatNumber value="${product.price}" pattern="#,###" />원</span>&nbsp
                      </c:if>
<%--                       <span style="color:#35c5f0;">${product.discount}%&nbsp</span> --%>
                      <span><fmt:formatNumber value="${product.price * (100-product.discount)/100}" pattern="#,###" />원</span>
                    </div>
                </div>
              </figcaption>
            </figure>
          </c:forEach>
        </div>
    </div>
  </div>
</div>

    <!-- ##### Instagram Area Start ##### -->
    <div class="instagram-feed-area d-flex flex-wrap" style="max-width: 1100px;margin: 0 auto;">
        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta1.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta1.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta2.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta2.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta3.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta3.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta4.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta4.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta5.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta5.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta6.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta6.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta7.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta7.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta8.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta8.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta9.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta9.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>

        <!-- Single Instagram -->
        <div class="single-instagram">
            <img src="../img/bg-img/insta10.jpg" alt="">
            <!-- Image Zoom -->
            <a href="../img/bg-img/insta10.jpg" class="img-zoom" title="Instagram Image">+</a>
        </div>
    </div>
    <!-- ##### Instagram Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <jsp:include page="footer.jsp"/>
    <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="../js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="../js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="../js/active.js"></script>
    
    
</body>
</html>