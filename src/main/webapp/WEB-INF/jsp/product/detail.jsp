<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>    
<html>
<head>
<style>
  #abc {
    background-color:#B0C364;
    color: #ffffff;
  }
</style>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  
  <!-- Title -->
  <title>상품 상세</title>

  <!-- Favicon -->
  <link rel="icon" href="img/core-img/favicon.ico">

  <!-- Stylesheet -->
  <link rel="stylesheet" href="/css/product/style.css">
</head>
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
</body>
</html>