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
    <!-- ##### Hero Area Start ##### -->
    <div class="hero-area">
        <!-- Hero Post Slides -->
        <div class="hero-post-slides owl-carousel">
            <!-- Single Slide -->
            <c:forEach items="${recipeList}" var="recipe">
            <div class="single-slide">
                <!-- Blog Thumbnail -->
                <div class="blog-thumbnail">
<!--                     <a href="#"><img src="../img/bg-img/2.jpg" alt=""></a> -->
                    <a href="#"><img src="/upload/pet/${recipe.thumbnail}" alt=""></a>
                </div>
	            <!-- Blog Content -->
	            <div class="blog-content-bg" onclick="aaa(${recipe.recipeNo});">
              <input type="input" name="recipeNo" id="recipeNo" value="${recipe.recipeNo}">
	            <div class="blog-content-bg" onclick="aaa(${recipe.recipeNo});">
	                <div class="blog-content">
	                    <a href="#" class="post-tag">${recipe.category}</a>
	                    <a href="#" class="post-title">${recipe.title}</a>
	                    <div class="post-meta">
	                        <a href="#" class="post-date">${recipe.createdDate}</a>
	                        <a href="#" class="post-author">${recipe.memberNo}</a>
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
                        <img src="../img/bg-img/4.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="#" class="post-tag">The Best</a>
                                <a href="#" class="post-title">Healthy Food</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/bg-img/5.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="#" class="post-tag">The Best</a>
                                <a href="#" class="post-title">Organic Cuisine</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="../img/bg-img/6.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="#" class="post-tag">The Best</a>
                                <a href="#" class="post-title">Vegetarian Food</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Catagory Area End ##### -->

    <!-- ##### Big Posts Area Start ##### -->
    <div class="big-posts-area mb-50">
        <div class="container">
            <!-- Single Big Post Area -->
            <div class="row align-items-center">
                <div class="col-12 col-md-6">
                    <div class="big-post-thumbnail mb-50">
                        <img src="../img/bg-img/7.jpg" alt="">
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="big-post-content text-center mb-50">
                        <a href="#" class="post-tag">Healthy</a>
                        <a href="#" class="post-title">Friend eggs with ham</a>
                        <div class="post-meta">
                            <a href="#" class="post-date">July 11, 2018</a>
                            <a href="#" class="post-author">By Julia Stiles</a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus, egestas tincidunt augue pellentesque. Suspendisse vestibulum sem in eros maximus, pretium commodo turpis convallis. Aenean scelerisque orci quis urna tempus, vitae interdum velit aliquet.</p>
                        <a href="#" class="btn bueno-btn">Read More</a>
                    </div>
                </div>
            </div>

            <!-- Single Big Post Area -->
            <div class="row align-items-center">
                <div class="col-12 col-md-6">
                    <div class="big-post-content text-center mb-50">
                        <a href="#" class="post-tag">The Best</a>
                        <a href="#" class="post-title">Steak with boiled vegetables</a>
                        <div class="post-meta">
                            <a href="#" class="post-date">July 11, 2018</a>
                            <a href="#" class="post-author">By Julia Stiles</a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus, egestas tincidunt augue pellentesque. Suspendisse vestibulum sem in eros maximus, pretium commodo turpis convallis. Aenean scelerisque orci quis urna tempus, vitae interdum velit aliquet.</p>
                        <a href="#" class="btn bueno-btn">Read More</a>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="big-post-thumbnail mb-50">
                        <img src="../img/bg-img/8.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Big Posts Area End ##### -->

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
                        <div class="single-widget-area add-widget mb-30">
                            <img src="../img/bg-img/add.png" alt="">
                        </div>

                        <!-- Single Widget Area -->
                        <div class="single-widget-area post-widget">

                            <!-- Single Post Area -->
                            <div class="single-post-area d-flex">
                                <!-- Blog Thumbnail -->
                                <div class="blog-thumbnail">
                                    <img src="../img/bg-img/12.jpg" alt="">
                                </div>
                                <!-- Blog Content -->
                                <div class="blog-content">
                                    <a href="#" class="post-title">Friend eggs with ham</a>
                                    <div class="post-meta">
                                        <a href="#" class="post-date">July 11, 2018</a>
                                        <a href="#" class="post-author">By Julia Stiles</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Post Area -->
                            <div class="single-post-area d-flex mb-30">
                                <!-- Blog Thumbnail -->
                                <div class="blog-thumbnail">
                                    <img src="../img/bg-img/13.jpg" alt="">
                                </div>
                                <!-- Blog Content -->
                                <div class="blog-content">
                                    <a href="#" class="post-title">Burger with fries</a>
                                    <div class="post-meta">
                                        <a href="#" class="post-date">July 11, 2018</a>
                                        <a href="#" class="post-author">By Julia Stiles</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Post Area -->
                            <div class="single-post-area d-flex">
                                <!-- Blog Thumbnail -->
                                <div class="blog-thumbnail">
                                    <img src="../img/bg-img/14.jpg" alt="">
                                </div>
                                <!-- Blog Content -->
                                <div class="blog-content">
                                    <a href="#" class="post-title">Avocado &amp; Oisters</a>
                                    <div class="post-meta">
                                        <a href="#" class="post-date">July 11, 2018</a>
                                        <a href="#" class="post-author">By Julia Stiles</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Post Area -->
                            <div class="single-post-area d-flex">
                                <!-- Blog Thumbnail -->
                                <div class="blog-thumbnail">
                                    <img src="../img/bg-img/15.jpg" alt="">
                                </div>
                                <!-- Blog Content -->
                                <div class="blog-content">
                                    <a href="#" class="post-title">Tortilla prawns</a>
                                    <div class="post-meta">
                                        <a href="#" class="post-date">July 11, 2018</a>
                                        <a href="#" class="post-author">By Julia Stiles</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Post Area -->
                            <div class="single-post-area d-flex">
                                <!-- Blog Thumbnail -->
                                <div class="blog-thumbnail">
                                    <img src="../img/bg-img/16.jpg" alt="">
                                </div>
                                <!-- Blog Content -->
                                <div class="blog-content">
                                    <a href="#" class="post-title">Burger with fries</a>
                                    <div class="post-meta">
                                        <a href="#" class="post-date">July 11, 2018</a>
                                        <a href="#" class="post-author">By Julia Stiles</a>
                                    </div>
                                </div>
                            </div>

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
    <footer class="footer-area">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-5">
                    <!-- Copywrite Text -->
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>
                <div class="col-12 col-sm-7">
                    <!-- Footer Nav -->
                    <div class="footer-nav">
                        <ul>
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#">Recipes</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
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
    function aaa(rNo) {
    	alert(rNo);
    	alert($("#recipeNo").val());
    	frm.submit();
    }
    </script>
</body>
</html>