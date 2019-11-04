<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
  <title>상품 상세</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
  
  <style>
    #jumbotron.jumbotron-fluid {
      background-color:white;
      
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
      
    #qt {
      width: 162px;
      float: left;
      margin-right: 10px;
    }
      
  </style>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div>
<div id="productBody"> 
<a href="updateform?no=${product.productNo}">수정</a>
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
                <a class="post-title"><span style="text-decoration-line:line-through; color:gray; margin-right:50px;">${product.price}원</span><span id="totalPrice">${product.price * (100-product.discount)/100}</span>원</a>
                
                <div class="input-group input-number-group">수량
                </div>
                <div id="tq">
                    <form action="../order/form" method="post" id="qt">
                      <input type='hidden' name='no' value='${product.productNo}'>
                      <input class="input-number" name='quantity' type="number" value="1" min="0" max="1000">
                      <button class="btn bueno-btn">구매하기</button>
                    </form>
                </div>
                  <div id="tq">
                    <form action="../cart/add" method="post" id="qt">
                        <input type='hidden' name='no' value='${product.productNo}'>
                        <input type='text' name='optionNo' value='${productOtion.optionNo}'>
                        <input class="input-number" name='quantity' type="number" value="1" min="0" max="1000">
                      <button class="btn bueno-btn" style="margin-top:57px;">장바구니</button>
                    </form>
                  </div>
            </div>
        </div>
        <!-- Blog Content -->
        <div class="blog-content">
          <a class="post-tag">${product.category}</a>
          <a class="post-title">${product.title}</a>
          <a>조회수 ${product.viewCount} 회</a>
          <hr class="my-4">
          <a class="post-title">
            <span style="text-decoration-line:line-through; color:gray; margin-right:50px;">${product.price}원</span>
            <span id="totalPrice">${product.price * (100-product.discount)/100}</span>원
          </a>
          <div class="input-group input-number-group">수량
          </div>
          <div id="tq">
            <form action="../order/form" method="post" id="qt">
              <input type='hidden' name='no' value='${product.productNo}'>
              <input class="input-number" name='quantity' type="number" value="1" min="0" max="1000">
              <button class="btn bueno-btn">구매하기</button>
            </form>
          </div>
          <div id="tq">
            <form id="qt">
              <button class="btn bueno-btn" style="margin-top:57px;">장바구니</button>
            </form>
          </div>
        </div>
      <hr class="my-4">
      <h1 class="display-4">${product.title}</h1>
      <p class="lead">${product.detail}</p>
      <hr class="my-4">
      <p>
        <c:forEach items="${product.files}" var="file" begin="1">
          <img src="/upload/product/${file.filePath}" class="rounded mx-auto d-block" alt="...">
        </c:forEach>
      </p>
      <hr class="my-4">

      <jsp:include page="../comment/productCommentList.jsp"/>
      
      
<!--         <div class="post-a-comment-area mb-30"> -->
<!--           <h4 class="mb-50" style="margin-top:30px !important;">Leave a reply</h4> -->
<!--           <form action="..comment/add" method="post"> -->
<%--             <input type="hidden" name="productNo" id='productNo' value='${product.productNo}'> --%>
<!--             <input type='hidden' name='memberNo' value=1> -->
<!--             <div> -->
<!--               <input type="text" name='title' class="form-control" id="title" placeholder="title"> -->
<!--             </div> -->
<!--             <div> -->
<!--               <textarea name='content' class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea> -->
<!--             </div> -->
<!--             <div> -->
<!--               <button class="btn bueno-btn mt-30" type="submit">Submit Comment</button> -->
<!--             </div> -->
<!--           </form> -->
<!--         </div> -->

        
      <div class="post-a-comment-area mb-30">
        <h4 class="mb-50">Leave a reply</h4>
        <div class="contact-form-area">
          <form action="../comment/add" method="post">
            <div id="abc">
              <input type='hidden' name='productNo' id='productNo' value='${product.productNo}'>
              <input type='hidden' name='memberNo' value='${loginUser.memberNo}' readonly>
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
      </div>

  <jsp:include page="../footer.jsp"/>
  <script>
    var totalPrice = document.querySelector('#totalPrice');
    var resultPrice = parseInt(totalPrice.innerHTML);
    totalPrice.innerHTML = resultPrice;
    console.log(${comment.title})
    
//     var memberName = document.querySelector('#memberName');
//     console.log(!${memberName})
//     if(!${member}) {
//       memberName.innerText = "";
//     } else {
//       memberName.innerText = ${member.nickname}
//     }
  </script>
</body>
</html>