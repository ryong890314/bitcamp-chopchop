<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>상품 목록</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <style>

  #content {
    width: 1100px;
    padding-top: 10px;
    margin: auto auto;
  }

  #productBody {
    width: 1100px;
    margin: auto auto;
    text-align: center;
    vertical-align: middle;
  }

  #productList {
    padding: 5px;
    margin: 5px;
    text-align: center;
    float: left;
  }
  </style>

</head>
<body>
  

<jsp:include page="../header.jsp"/>

<!-- <header class="header-area"> -->
<!--         <div class="top-header-area bg-img bg-overlay" style="background-image: url(img/bg-img/header.jpg);"> -->
<!--             <div class="container h-100"> -->
<!--                 <div class="row h-100 align-items-center justify-content-between"> -->
<!--                     <div class="col-12 col-sm-6"> -->
<!--                       <div id='content'> -->
<!--                       <h1>상품 목록</h1> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="col-12 col-sm-6 col-lg-5 col-xl-4"> -->
<!--                         Top Search Area -->
<!--                         <div class="top-search-area"> -->
<!--                             <form action='search'> -->
<!--                               <input type='text' name='keyword' placeholder="Search"> -->
<!--                                 <button type="submit" class="btn"><i class="fa fa-search"></i></button> -->
<!--                             </form> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         </header> -->

    <!-- ##### Catagory Area Start ##### -->
    <div class="post-catagory section-padding-100">
        <div class="container">
            <div class="row">
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
<!--                         <img src="img/bg-img/4.jpg" alt=""> -->
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=강아지" class="post-tag">강아지</a>
                                <a href="category?species=강아지" class="post-title" style="color:#524845">강아지</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
<!--                         <img src="img/bg-img/5.jpg" alt=""> -->
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=고양이" id="species" class="post-tag">고양이</a>
                                <a href="category?species=고양이" class="post-title" style="color:#524845">고양이</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
<!--                         <img src="img/bg-img/6.jpg" alt=""> -->
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=새" id="species" class="post-tag">새</a>
                                <a href="category?species=새" class="post-title" style="color:#524845">새</a>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
    </div>
    </div>
        <div class="post-catagory section-padding-100">
        <div class="container">
            <div class="row">
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
<!--                         <img src="img/bg-img/6.jpg" alt=""> -->
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=물고기" id="species" class="post-tag">물고기</a>
                                <a href="category?species=물고기" class="post-title" style="color:#524845">물고기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
<!--                         <img src="img/bg-img/6.jpg" alt=""> -->
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=작은" id="species" class="post-tag">작은 동물</a>
                                <a href="category?species=작은" class="post-title" style="color:#524845">작은 동물</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
<!--                         <img src="img/bg-img/6.jpg" alt=""> -->
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=파충류" id="species" class="post-tag">파충류</a>
                                <a href="category?species=파충류" class="post-title" style="color:#524845">파충류</a>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
    </div>
    </div>
  <button type="button" onclick="location.href='form'">새 상품</button>
  
<div id="productBody">
  <div class="d-flex align-content-start flex-wrap">
<c:forEach items="${products}" var="product" varStatus="status">
  <div id="productList">

<div class="card" style="width: 18rem;">
  <c:forEach items="${product.files}" var="file" end="0">
    <img src='/upload/product/${file.filePath}' style="width: 286px; height: 286px; object-fit: cover" alt=""> 
  </c:forEach>
  
  <div class="card-body">
    <h5 class="card-title">${product.title}</h5>
    <a><span style=" text-decoration:line-through">
    <fmt:formatNumber value="${product.price}" pattern="#,###" /> 원</span><br>
    <span><fmt:formatNumber value="${product.price * (100-product.discount)/100}" pattern="#,###" /> 원
    </span><br></a>
    ${product.discount}
    <a href='detail?no=${product.productNo}'><button  class="btn bueno-btn">구매하기</button></a>
  </div>
</div>
</div>
</c:forEach> 
</div>
</div>

<jsp:include page="../footer.jsp"/>
  <script>
    var totalPrice = document.getElementsByClassName('totalPrice');
    for(var i of totalPrice) {
      i.innerText = parseInt(i.innerText)
    }
  </script>
</body>
</html>
