<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>상품 목록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/product/style.css'>
  <style>

  #header {
    width: 1100px;
    margin: 0 auto;
  }

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

 #footer {
  background-color: #524845;
  color: #ffffff;
  height: 40px;
  width: 1100px;
  text-align: center;
  vertical-align: middle;
  padding-top: 10px;
  margin: auto auto;
  clear: left; 
  }
  </style>

</head>
<body>
  

<jsp:include page="../header.jsp"/>

<header class="header-area">
        <div class="top-header-area bg-img bg-overlay" style="background-image: url(img/bg-img/header.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-between">
                    <div class="col-12 col-sm-6">
                      <div id='content'>
                      <h1>상품 목록</h1>
                      </div>
                    </div>
                    <div class="col-12 col-sm-6 col-lg-5 col-xl-4">
                        <!-- Top Search Area -->
                        <div class="top-search-area">
                            <form action='search'>
                              <input type='text' name='keyword' placeholder="Search">
                                <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </header>

<!--     <form action='category'> -->
<!--       <select name='species' id='species' onchange=''> -->
<!--         <option id='1' value='강아지'>강아지</option> -->
<!--         <option id='2' value='고양이'>고양이</option> -->
<!--         <option id='3' value='새'>새</option> -->
<!--         <option id='4' value='물고기'>물고기</option> -->
<!--         <option id='5' value='작은'>작은 동물</option> -->
<!--         <option id='6' value='파충류'>파충류</option> -->
<!--       </select><br> -->
<!--       <input type='text' id='inputValue' value=''></input> -->
<!--       <button>검색</button> -->
<!--     </form> -->
    
    <!-- ##### Catagory Area Start ##### -->
    <div class="post-catagory section-padding-100">
        <div class="container">
            <div class="row">
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="img/bg-img/4.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=강아지" class="post-tag">강아지</a>
                                <a href="category?species=강아지" class="post-title">강아지</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="img/bg-img/5.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=고양이" id="species" class="post-tag">고양이</a>
                                <a href="category?species=고양이" class="post-title">고양이</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Catagory -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="img/bg-img/6.jpg" alt="">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="category?species=물고기" id="species" class="post-tag">물고기</a>
                                <a href="category?species=물고기" class="post-title">물고기</a>
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
<c:forEach items="${products}" var="product">
  <div id="productList">

<div class="card" style="width: 18rem;">
  <c:forEach items="${product.files}" var="file" end="0">
    <img src='/upload/product/${file.filePath}' style="width: 286px; height: 286px;"> 
  </c:forEach>
  
  <div class="card-body">
    <h5 class="card-title">${product.title}</h5>
    <p class="card-text">${product.price}원</p>
    <a href='detail?no=${product.productNo}' class="btn bueno-btn">구매하기</a>
  </div>
</div>
</div>
</c:forEach> 
</div>
</div>

<jsp:include page="../footer.jsp"/>


  <script>
    var species = document.querySelector("#species");
    switch(species.innerHTML) {
      case '강아지' : 
        species.href = 'category?species=강아지';
        break;
      case '고양이' : 
        species.href ='category?species=고양이';
        break;
      case '물고기' : 
        species.href ='category?species=물고기';
        break;
    }
  </script>

</body></html>
