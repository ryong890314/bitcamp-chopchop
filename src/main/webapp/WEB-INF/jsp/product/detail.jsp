<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>    
<html>
<body>
  <jsp:include page="../header.jsp"/>
  <div id='content'>
  <form method="post">
  <h1>상품 상세</h1>
    번호 : ${product.productNo}<br>
    상품명: ${product.title}<br>
    가격 : ${product.price}<br>
    상품상세: ${product.detail}<br>
    재고: ${product.stock}<br>
    할인율: ${product.discount}<br>
    분류: ${product.category}<br>
    분류: ${product.species}<br>
    <p>
      <c:forEach items="${product.files}" var="file">
        <img src='/upload/product/${file.filePath}' class='photo2' width=200>
      </c:forEach>
    </p>
    <a href='updateform?no=${product.productNo}'>상품 수정</a>
    </form>
  </div>
  
  



<!DOCTYPE html>
<html>
<head>
  <title>상품 상세</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
  <style>
    #abc {
      background-color:#B0C364;
      color: #ffffff;
    }

    #header {
      width: 1100px;
      margin: 0 auto;
    }

    #productBody {
      width: 1100px;
      padding-top: 10px;
      margin: auto auto;
      /*
      text-align: center;
      vertical-align: middle;
      */ 
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
                      <h1>상품 상세</h1>
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
    
<div>
<div id="productBody"> 
        <div class="single-blog-post style-1 d-flex flex-wrap mb-30">
            <!-- Blog Thumbnail -->
            <div class="blog-thumbnail">
                  <c:forEach items="${product.files}" var="file" end="0">
    <img src="/upload/product/${file.filePath}"> 
  </c:forEach>
            </div>
            <!-- Blog Content -->
            <div class="blog-content">
                <a class="post-tag">${product.category}</a>
                <a class="post-title">${product.title}</a>
                <a>조회수 ${product.viewCount} 회</a>
                <hr class="my-4">
                <a class="post-title">판매가 ${product.price} 원</a>
                
                <div class="input-group input-number-group"><a class="post-title">수량
                  <input class="input-number" type="number" value="1" min="0" max="1000">
                </a>
                </div>

                  <div style="position: absolute; right: 0px; bottom: 0px;">
                      <a href='#' class="btn bueno-btn">장바구니</a>
                      <a href='#' class="btn bueno-btn">구매하기</a>
                    </div>
                      
            </div>
        </div>
        
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">${product.title}</h1>
    <p class="lead">${product.detail}</p>
    <hr class="my-4">
  <p>
    <c:forEach items="${product.files}" var="file">
      <img src="/upload/product/${file.filePath}" class="rounded mx-auto d-block" alt="...">
    </c:forEach>
  </p>
  </div>
</div>
      </div>

<div class="col-12 col-lg-8 col-xl-9">
      <!-- Comment Area Start -->
      <div class="comment_area clearfix mb-100">
        <h4 class="mb-50" id='abc'>상품 문의</h4>
        <c:forEach items="${product.comments}" var = "comment">
          <ol>
            <!-- Single Comment Area -->
            <li class="single_comment_area">
              <!-- Comment Content -->
              <div class="comment-content d-flex">
                  <!-- Comment Author -->
                  <div class="comment-author">
                      <img src="img/bg-img/32.jpg" alt="author">
                  </div>
                  <!-- Comment Meta -->
                  <div class="comment-meta">
                      <div class="d-flex">
                          <a href="#" class="post-author">${comment.title}</a>
                          <a href="#" class="post-date">${comment.createdDate}</a>
                          <a href="#" class="reply">Reply  |</a>
                          <a href="../comment/updateform?no=${comment.commentNo}" class="reply">수정</a>
                      </div>
                      <p>${comment.content}</p>
                  </div>
              </div>
            </li>
          </ol>
        </c:forEach>
      </div>

      <div class="post-a-comment-area mb-30 clearfix">
          <h4 class="mb-50">Leave a reply</h4>
          <!-- Reply Form -->
          <div class="contact-form-area">
            <form action="../comment/add" method="post">
              <div class="row">
                <input type='hidden' name='productNo' id='productNo' value='${product.productNo}'>
                <input type='hidden' name='memberNo' value=1 readonly>
                <div class="col-12 col-lg-6">
                  <input type="text" name='title' class="form-control" id="title" placeholder="title">
                </div>
                <div class="col-12">
                  <textarea name='content' class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                </div>
                <div class="col-12">
                  <button class="btn bueno-btn mt-30" type="submit">Submit Comment</button>
                </div>
              </div>
            </form>
          </div>
      </div>
  </div>
  <jsp:include page="../footer.jsp"/>




<form action='update' method='post' enctype='multipart/form-data'>

<p>====관리자 모드=====</p>

번호 : <input type='text' name='productNo' value='${product.productNo}' readonly><br>
타이틀 : <input type='text' name='title' value='${product.title}'><br>
가격 : <input type='text' name='price' value='${product.price}'><br>
내용 : <input type='text' name='detail' value='${product.detail}'><br>
재고 : <input type='text' name='stock' value='${product.stock}'><br>
할인 : <input type='text' name='discount' value='${product.discount}'><br>
카테고리 : <input type='text' name='category'' value='${product.category}'><br>

조회수 : ${product.viewCount}<br>
<!--

<p>
  <c:forEach items="${product.files}" var="file">
    <img src='/upload/product/${file.filePath}' class='photo2'> 
  </c:forEach>
  </p>

  -->

  <c:forEach begin="1" end="5">
    사진: <input type='file' name='filePath'><br>
  </c:forEach>

<button>변경</button>
<button type="button" onclick="location.href='delete?productNo=${product.productNo}'">삭제</button>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>