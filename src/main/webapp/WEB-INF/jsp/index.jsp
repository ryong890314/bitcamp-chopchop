<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHOPCHOP MAIN</title>
<!-- Stylesheet -->
<link rel="stylesheet" href="/css/main/b_style.css">
</head>
<body>
<jsp:include page="header.jsp"/>
    <!-- ##### Hero Area Start ##### -->
    <div class="hero-area" style="width:1100px; margin: 0 auto;">
        <!-- Hero Post Slides -->
        <div class="hero-post-slides owl-carousel">
            <!-- Single Slide -->
            <c:forEach items="${recipeList}" var="recipe">
            <div class="single-slide">
                <!-- Blog Thumbnail -->
                <div class="blog-thumbnail">
<!--                     <a href="#"><img src="../img/bg-img/2.jpg" alt=""></a> -->
                    <a href="#"><img class="recipe_thumb" src="/upload/recipe/${recipe.thumbnail}" style="width:595px;height:400px;object-fit:cover;"></a>
                </div>
  	            <!-- Blog Content -->
  	            <div class="blog-content-bg" onclick="aaa(${recipe.recipeNo});">
                  <input type="text" name="recipeNo" id="recipeNo" value="${recipe.recipeNo}">
    	            <div class="blog-content-bg" onclick="aaa(${recipe.recipeNo});">
  	                <div class="blog-content">
	                    <a href="#" class="post-tag">${recipe.category}</a>
	                    <a href="#" class="post-title titlaa">${recipe.title}</a>
                      <div class="post-meta">
                        <a href="#" class="post-date">${recipe.createdDate}</a>
                        <a href="#" class="post-author">by ${recipe.memberNo}</a>
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
            <div class="row justify-content-center">
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/photo1.png" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="/app/product/category?species=강아지" class="post-tag">The Best</a>
                                <a href="/app/product/category?species=강아지" class="post-title">강아지</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/photo1.png" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="/app/product/category?species=고양이" class="post-tag">The Best</a>
                                <a href="/app/product/category?species=고양이" class="post-title">고양이</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/photo1.png" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="#" class="post-tag">The Best</a>
                                <a href="#" class="post-title">작은친구들</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/pet4.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="#" class="post-tag">The Best</a>
                                <a href="#" class="post-title">반려동물 식품</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/pet5.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="#" class="post-tag">The Best</a>
                                <a href="#" class="post-title">반려동물 용품</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/main/pet6.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="#" class="post-tag">The Best</a>
                                <a href="#" class="post-title">기타 용품</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Catagory Area End ##### -->


    <!-- ##### Posts Area End ##### -->
    <div class="bueno-post-area mb-70">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Post Area -->
                <div class="col-12 col-lg-8 col-xl-9">
                    <!-- Single Blog Post -->
                    <div class="single-blog-post style-1 d-flex flex-wrap mb-30">
                        <!-- Blog Thumbnail -->
                        <div class="blog-thumbnail">
                            <img src="../img/bg-img/9.jpg" alt="">
                        </div>
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <a href="#" class="post-tag">The Best</a>
                            <a href="#" class="post-title">Friend eggs with ham</a>
                            <div class="post-meta">
                                <a href="#" class="post-date">July 11, 2018</a>
                                <a href="#" class="post-author">By Julia Stiles</a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus.</p>
                        </div>
                    </div>

                    <!-- Single Blog Post -->
                    <div class="single-blog-post style-1 d-flex flex-wrap mb-30">
                        <!-- Blog Thumbnail -->
                        <div class="blog-thumbnail">
                            <img src="../img/bg-img/10.jpg" alt="">
                        </div>
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <a href="#" class="post-tag">The Best</a>
                            <a href="#" class="post-title">Mushrooms with pork chop</a>
                            <div class="post-meta">
                                <a href="#" class="post-date">July 11, 2018</a>
                                <a href="#" class="post-author">By Julia Stiles</a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus.</p>
                        </div>
                    </div>

                    <!-- Single Blog Post -->
                    <div class="single-blog-post style-1 d-flex flex-wrap mb-30">
                        <!-- Blog Thumbnail -->
                        <div class="blog-thumbnail">
                            <img src="../img/bg-img/11.jpg" alt="">
                        </div>
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <a href="#" class="post-tag">The Best</a>
                            <a href="#" class="post-title">Birthday cake with chocolate</a>
                            <div class="post-meta">
                                <a href="#" class="post-date">July 11, 2018</a>
                                <a href="#" class="post-author">By Julia Stiles</a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus.</p>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Area -->
                <div class="col-12 col-sm-9 col-md-6 col-lg-4 col-xl-3">
                    <div class="sidebar-area">

                        <!-- Single Widget Area -->
<!--                         <div class="single-widget-area add-widget mb-30"> -->
<!--                             <img src="../img/bg-img/add.png" alt=""> -->
<!--                         </div> -->

                        <!-- Single Widget Area -->
                        <div class="single-widget-area post-widget">

                            <!-- Single Post Area -->
                             <c:forEach items="${productList}" var="product">
                            <div class="single-post-area d-flex">
                                <!-- Blog Thumbnail -->
                                <div class="blog-thumbnail">
                                  <img src="/upload/product/${product.files[0].filePath}" alt="">
<!--                                     <img src="../img/bg-img/12.jpg" alt=""> -->
                                </div>
                                <!-- Blog Content -->
                                <div class="blog-content">
                                    <a href="#" class="post-title">${product.title}</a>
                                    <div class="post-meta">
                                        ${product.detail}
                                        / ${product.price}
                                    </div>
                                </div>
                            </div>
                                </c:forEach>





<!--                             Single Post Area -->
<!--                             <div class="single-post-area d-flex mb-30"> -->
<!--                                 Blog Thumbnail -->
<!--                                 <div class="blog-thumbnail"> -->
<!--                                     <img src="../img/bg-img/13.jpg" alt=""> -->
<!--                                 </div> -->
<!--                                 Blog Content -->
<!--                                 <div class="blog-content"> -->
<!--                                     <a href="#" class="post-title">Burger with fries</a> -->
<!--                                     <div class="post-meta"> -->
<!--                                         <a href="#" class="post-date">July 11, 2018</a> -->
<!--                                         <a href="#" class="post-author">By Julia Stiles</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             Single Post Area -->
<!--                             <div class="single-post-area d-flex"> -->
<!--                                 Blog Thumbnail -->
<!--                                 <div class="blog-thumbnail"> -->
<!--                                     <img src="../img/bg-img/14.jpg" alt=""> -->
<!--                                 </div> -->
<!--                                 Blog Content -->
<!--                                 <div class="blog-content"> -->
<!--                                     <a href="#" class="post-title">Avocado &amp; Oisters</a> -->
<!--                                     <div class="post-meta"> -->
<!--                                         <a href="#" class="post-date">July 11, 2018</a> -->
<!--                                         <a href="#" class="post-author">By Julia Stiles</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             Single Post Area -->
<!--                             <div class="single-post-area d-flex"> -->
<!--                                 Blog Thumbnail -->
<!--                                 <div class="blog-thumbnail"> -->
<!--                                     <img src="../img/bg-img/15.jpg" alt=""> -->
<!--                                 </div> -->
<!--                                 Blog Content -->
<!--                                 <div class="blog-content"> -->
<!--                                     <a href="#" class="post-title">Tortilla prawns</a> -->
<!--                                     <div class="post-meta"> -->
<!--                                         <a href="#" class="post-date">July 11, 2018</a> -->
<!--                                         <a href="#" class="post-author">By Julia Stiles</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             Single Post Area -->
<!--                             <div class="single-post-area d-flex"> -->
<!--                                 Blog Thumbnail -->
<!--                                 <div class="blog-thumbnail"> -->
<!--                                     <img src="../img/bg-img/16.jpg" alt=""> -->
<!--                                 </div> -->
<!--                                 Blog Content -->
<!--                                 <div class="blog-content"> -->
<!--                                     <a href="#" class="post-title">Burger with fries</a> -->
<!--                                     <div class="post-meta"> -->
<!--                                         <a href="#" class="post-date">July 11, 2018</a> -->
<!--                                         <a href="#" class="post-author">By Julia Stiles</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Posts Area End ##### -->

    <!-- ##### Instagram Area Start ##### -->
    <div class="instagram-feed-area d-flex flex-wrap">
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
    
    <script type="text/javascript">
    $(document).ready(function() {
        $('.rolling_wrap').rolling({
        arrowBtn:true,
        rollingBtn:true,
        main:true,
        timer:6000
      });
    });
    
    function aaa(rNo) {
    	alert(rNo);
    	alert($("#recipeNo").val());
    	frm.submit();
    }
    
    function textLengthOverCut(txt, len, lastTxt) {
      if (len == "" || len == null) { // 기본값
          len = 10;
      }
      if (lastTxt == "" || lastTxt == null) { // 기본값
          lastTxt = "...";
      }
      if (txt.length > len) {
          txt = txt.substr(0, len) + lastTxt;
      }
      return txt;
  }
    </script>
</body>
</html>