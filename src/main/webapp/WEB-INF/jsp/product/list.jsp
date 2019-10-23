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

    <form action='category'>
      <select name='species' id='species' onchange=''>
        <option id='1' value='강아지'>강아지</option>
        <option id='2' value='고양이'>고양이</option>
        <option id='3' value='새'>새</option>
        <option id='4' value='물고기'>물고기</option>
        <option id='5' value='작은'>작은 동물</option>
        <option id='6' value='파충류'>파충류</option>
      </select><br>
      <input type='text' id='inputValue' value=''></input>
      <button>검색</button>
    </form>
  
  
  <button type="button" onclick="location.href='form'">새 상품</button>
  
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
    <a href='detail?no=${product.productNo}' class="btn bueno-btn">구매하기</a>
  </div>
</div>
</div>
</c:forEach> 
</div>
</div>

<jsp:include page="../footer.jsp"/>


  <script>
    var selectedOption = document.getElementById("species");
    var species = selectedOption.options[selectedOption.selectedIndex].value;
    var inputValue = document.getElementById("inputValue");
    inputValue.value=species;
  </script>

</body></html>
