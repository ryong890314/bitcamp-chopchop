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

    .closeIcon {
      float: right;
      /* display: inline-block; */
      font-weight: 500;
      text-shadow: 0 1px 0 #fff;
      font-size: 25px;
      /* vertical-align: top; */
    }

    .closeIcon:hover {
      border: 0;
      cursor: pointer;
      opacity: .75;
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
                    <select class="form-control optionselect" id="optionNo" name='optionNo'>
                      <option selected disabled>옵션을 선택해주세요</option>
                      
                      <c:forEach items="${product.options}" var="productOption">
                      <option value="${productOption.optionNo}" name="${productOption.price}" id="${productOption.title}">${productOption.title}
                        (+${productOption.price}원)
                      </option>
                      </c:forEach>
                    </select>

                  </div>

                </div>
                <div id="ingredient-block" class="block-content">
                  <!-- 상품옵션 들어가는 Div -->
                </div>
              </div>

              <hr>

              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInput">주문금액</label>
                </div>
                <div class="col-md-8" style="text-align: right;">
                  <a id="totalCheckPrice" style="color: red; margin: 10px; font-size: 20px;">0</a><a
                    style="font-size: 20px;">원</a>
                </div>
              </div>

              <hr>

              <div>
                  <a id="quantityCheckTest" style="color: red; margin: 10px; font-size: 20px;">0</a><a
                    style="font-size: 20px;">수량</a>
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

  <script>
    // 선택한 옵션 등록하기
    var count = 1;
    $(document).on("change", ".optionselect", function () {
      var addOptionCheck = document.querySelector('[id^="addOptionNo"]') !== null;
      var tempAddOptionNo = $(this).val();
      var tempAddOptionTitle = $(this).find(":selected").attr("id");
      if (addOptionCheck == false) {
        addOption(tempAddOptionNo, tempAddOptionTitle);
      } else {
        var addOptionCheckNum = document.getElementsByClassName('addOptionNo');
        for (var i = 0; i < addOptionCheckNum.length; i++) {
          if (addOptionCheckNum[i].value == $(this).val()) {
            alert("이미 등록된 옵션인디");
            return false;
            break;
          }
        }
        addOption(tempAddOptionNo, tempAddOptionTitle);
      }
      reprice();
    })
  </script>

  <script>
    // 중복코드 제거
    function addOption(tempAddOptionNo, tempAddOptionTitle) {
      var html = "";
      html += "<div style='width: 440px; border-style: solid; border-color: rgba(0, 0, 0, 0.1); border-width: 1px; margin: 5px 15px; padding: 0px 15px 10px 15px;'>";
      html += "<div><span class='closeIcon' name='delIngredientBtn' onclick='delOption(event)'>&times;</span></div>"
      html += "<div style='padding: 10px 22px 10px 0;'>";
      html += "<input type='hidden' class='addOptionNo' id='addOptionNo" + count + "' value=" + tempAddOptionNo + ">" + tempAddOptionTitle;
      html += "</div>"
      html += "<input class='input-number' name='quantity' id='addQuantityNo" + count + "' type='number' style='text-align:center; width: 60px; vertical-align: top;' value='1' min='0' max='1000'>";
      html += "<input class='input' type='hidden' id='addOptionPriceNo" + count + "' value='1234'>"
      
      var tempAddQuantityNo = "addQuantityNo" + count;
      var tempAddOptionPriceNo = "addOptionPriceNo" + count;
      var tempRequantity = 1;
      var tempQuantity = tempRequantity;
      html += "<c:forEach items='${product.options}' var='productOption'>"
      
      if ('${productOption.optionNo}' == tempAddOptionNo) {
        
        var tempAddOptionPriceUnit = parseInt("${((product.price) * (100 - product.discount) / 100 + productOption.price)}");
        var tempAddOptionPrice = tempAddOptionPriceUnit * tempQuantity;
      }

      html += "</c:forEach>"
      html += "<a style='float: right; padding-top: 5px;' class='optionReprice' value=" + tempAddOptionPrice+ "> " + Number(tempAddOptionPrice).toLocaleString('en') + " 원</a>"
      html += "<input type='hidden' name='chkprice' value=" + tempAddOptionPrice + ">"
      html += "</div>"
      count++;
      $('#ingredient-block').append(html);
    }
  </script>

  <script>
    // 옵션 삭제
    "use strict";
    function delOption(event) {
      $(event.target.parentNode.parentNode).remove();
      reprice();
    };
  </script>

  <script>
    // 옵션 변경
    $(document).on("change", ".input-number", function (tempAddQuantityNo) {
      console.log(tempAddQuantityNo)
      console.log(tempAddQuantityNo.target.value)
      
      tempRequantity = tempAddQuantityNo.target.value;  
      var e= $(this).parent().children(".optionReprice").value()
      console.log(e);
      reprice();
      $(".optionReprice").html();
    });
  </script>

  <script>
    function reprice() {
      var myCheckPrice = document.getElementsByName('chkprice');
      var checkPrice = 0;
      for (j = 0; j < myCheckPrice.length; j++) {
        checkPrice += parseInt(myCheckPrice[j].value);
      }
      totalCheckPrice.innerHTML = Number(checkPrice).toLocaleString('en');
      //연습
      quantityCheckTest.innerHTML = document.getElementById("addQuantityNo1").value;
    }
  </script>

</body>

</html>