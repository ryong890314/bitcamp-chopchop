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
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <style>
    #jumbotron.jumbotron-fluid {
      background-color: white;

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

  <jsp:include page="../header.jsp" />

  <div>
    <div id="productBody">
      <a href="updateform?no=${product.productNo}">수정</a>


      <div class="row">
        <div class="col-md-7">
          <!-- Blog Thumbnail -->
          <div class="blog-thumbnail">
            <c:forEach items="${product.files}" var="file" end="0">
              <img src="/upload/product/${file.filePath}" style="width: 600px; height: 600px; object-fit: cover;">
            </c:forEach>
          </div>
        </div>
        <div class="col-md-5">
          <!-- Blog Content -->
          <div class="blog-content">
            <!-- <a class="post-tag">${product.category}</a> -->
            <a style="font-size: 30px;">${product.title}</a>
            <hr>

            <div class="row">
              <div class="col-md-4">
                <label for="exampleInput">상품금액</label>
              </div>
              <div class="col-md-8">
                <span style=" text-decoration:line-through">
                  <fmt:formatNumber value="${product.price}" pattern="#,###" /> 원</span>
              </div>
            </div>


            <div class="row">
              <div class="col-md-4">
                <label for="exampleInput">할인율</label>
              </div>
              <div class="col-md-8">
                <span>${product.discount} %</span>
              </div>
            </div>


            <div class="row">
              <div class="col-md-4">
                <label for="exampleInput">할인적용금액</label>
              </div>
              <div class="col-md-8">
                <span>
                  <fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="#,###" />
                  원</span>
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-md-4">
                <label for="exampleInput">조회수</label>
              </div>
              <div class="col-md-8">
                <span>${product.viewCount} 회</span>
              </div>
            </div>

            <form action="../order/form" method="post">
              <input type='hidden' name='no' value='${product.productNo}'>

              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInput">옵션</label>
                </div>
                <div class="col-md-8">

                  <div class="form-group">
                    <select class="form-control" id="optionNo" name='optionNo' onchange="addOption()">
                      <option>옵션을 선택해주세요</option>
                      <c:forEach items="${product.options}" var="productOption">
                        <option value="${productOption.optionNo}">${productOption.title}</option>
                      </c:forEach>
                    </select>
                  </div>

                  
                  <!-- <input type='text' name='optionNo' value='${productOption.optionNo}'> -->
                </div>
                      <div id="ingredient-block" class="block-content">
                      <!-- 재료 용량 들어가는 Div -->
                        </div>
              </div>

              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInput">수량</label>
                </div>
                <div class="col-md-8">
                  <input class="input-number" name='quantity' type="number" style="text-align:center;" value="1" min="0"
                    max="1000">
                </div>
              </div>

              <hr>

              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInput">주문금액</label>
                </div>
                <div class="col-md-8">
                  <span style="font-size: 20px; font-weight: 700; color:red">
                    <fmt:formatNumber value="${product.price}" pattern="#,###" /> 원</span>
                </div>
              </div>

              <hr>

              <button class="btn bueno-btn" style="margin-top:10px; width:215px;" formaction="../cart/add">장바구니</button>
              <button class="btn bueno-btn" style="margin-top:10px; width:215px;">구매하기</button>
            </form>

          </div>
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

      <jsp:include page="../comment/productCommentList.jsp" />

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
                <textarea name='content' class="form-control" id="message" cols="30" rows="10"
                  placeholder="Message"></textarea>
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

  <jsp:include page="../footer.jsp" />


  <!-- <script>
  
  function checkOption(){
    alert("나온나쫌");
  }
  </script> -->

<script id="t1" type="ingredientHtml">
  <div class='group-flex' style='width: 470px; padding: 0px 15px;' >
  <div class='form-group'><a value="${productOption.optionNo}">${productOption.title}</a></div>
  <div class="col-md-8">
      <input class="input-number" name='quantity' type="number" style="text-align:center;" value="1" min="0"
        max="1000"><a>${product.price}</a>
    </div>
  <div class='form-group'><button class='btn btn-secondary btn-sm' type='button' name='delIngredientBtn' onclick='delOption(event)'>삭제</button></div>
  </div>
  </script>
  
  <script> // 재료,용량 추가
   "use strict";
    function addOption() {
      console.log("추가버튼누름");
      var html = $('#t1').html();
      $('#ingredient-block').append(html);
    };
  </script>
  
  <script> // 재료, 용량 삭제
   "use strict";
    function delOption(event) {
      $(event.target.parentNode.parentNode).remove();
    };
  </script>

  <!-- 
  <script>
      var chkOptions = document.getElementsByClassName('chkOption');
      
      for (var i = 0; i < chkOptions.length; i++) {
        
        chkOptions[i].addEventListener('click', function () {
          var criteriaNode = document.getElementByClassName('chkOption');	// 기준이 되는 요소로 아이디가 "text"인 요소를 선택함.
          var newNode = document.createElement("p");			// 새로운 <p> 요소를 생성함.
          newNode.innerHTML = "새로운 단락입니다.";
          document.body.insertBefore(newNode, criteriaNode);	// 새로운 요소를 기준이 되는 요소 바로 앞에 추가함.
        });
      }
    </script> -->



  <script>
    // var totalPrice = document.querySelector('#totalPrice');
    // var resultPrice = parseInt(totalPrice.innerHTML);
    // totalPrice.innerHTML = resultPrice;

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