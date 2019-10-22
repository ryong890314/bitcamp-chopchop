<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>게시물 목록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/style.css'>
  <style>

/*
.btn-primary {
    background-color: #b0c364;
    border-color: #b0c364;
    color: #FFF; }
.btn-primary:hover,
.btn-primary:focus {
    border-color: #b0c364;
    background-color: #b0c364;
    color: #FFF; }
.btn-primary:active,
.btn-primary:visited,
.btn-primary:active:focus,
.btn-primary:active:hover {
    border-color: #b0c364;
    background-color: #b0c364;
    color: #FFF; }
    
    */

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


  
  
  <button type="button" onclick="location.href='form'">새 상품</button>
  
<!-- 검색기능 추가 시작 -->
<!--
<form action='search'>
  <input type='text' name='keyword'>
  <button>검색</button>
</form>
-->

<!-- 검색기능 추가 끝 -->

<!-- list backup 
<table class='table table-hover'>
<tr>
  <th>번호</th>
  <th>제목</th>
  <th>가격</th>
  <th>재고</th>
  <th>카테고리</th>
  <th>사진</th>

</tr>
<c:forEach items="${products}" var="product">
  <tr>
    <td>${product.productNo}</td>
    <td><a href='detail?productNo=${product.productNo}'>${product.title}</a></td>
    <td>${product.price}</td>
    <td>${product.stock}</td>
    <td>${product.category}</td>
    <td>
  <p>
  <c:forEach items="${product.files}" var="file" end="0">
    <img src='/upload/product/${file.filePath}' class='photo2'> 
  </c:forEach>
  </p>
    </td>
  </tr>
</c:forEach>  
</table>



  ...
</div>

-->
<div id="productBody">
  <div class="d-flex align-content-start flex-wrap">
<c:forEach items="${products}" var="product">
  <div id="productList">

<div class="card" style="width: 18rem;">
  <c:forEach items="${product.files}" var="file" end="0">
    <img src='/upload/product/${file.filePath}' class='card-img-top'> 
  </c:forEach>
 

  
  <div class="card-body">
    <h5 class="card-title">${product.title}</h5>
    <p class="card-text">${product.price}</p>
    <a href='detail?productNo=${product.productNo}' class="btn bueno-btn">구매하기</a>
  </div>
</div>
</div>
</c:forEach> 
</div>
</div>
  <!--
-->


<jsp:include page="../footer.jsp"/>


</body></html>
