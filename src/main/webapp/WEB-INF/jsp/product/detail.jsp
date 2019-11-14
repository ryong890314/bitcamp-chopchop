<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
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
                  <span id='product-price'><fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="#,###" /></span>
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

            <!-- <form action="../order/form" method="post"> -->
            <form>
              <input type='hidden' name='no' value='${product.productNo}'>
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInput">옵션</label>
                </div>
                <div class="col-md-8">

                  <div class="form-group">
                    <select id="product-option" class="form-control optionselect" id="optionNo" name='optionNo'>
                      <option selected disabled>옵션을 선택해주세요</option>

                      <c:forEach items="${product.options}" var="productOption">
                        <option value="${productOption.optionNo}" 
                          id="${productOption.title}">${productOption.title}
                          (+${productOption.price}원)
                        </option>
                      </c:forEach>
                    </select>

                  </div>

                </div>
                <div id="selected-option-div" class="block-content">
                  <!-- 상품옵션 들어가는 Div -->
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInput">주문금액</label>
                </div>
                <div class="col-md-8" style="text-align: right;">
                  <span id="total-check-price" style="color: red; margin: 10px; font-size: 20px;">0</span><span style="font-size: 20px;">원</span>
                </div>
              </div>

              <hr>

              <button id="cart-btn" type="button" class="btn bueno-btn" style="margin-top:10px; width:215px;">장바구니</button>
              <button type="button" class="btn bueno-btn" style="margin-top:10px; width:215px;">구매하기</button>
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
<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

<script id="option-template" type="text/x-handlebars-template">
<div class='selected-option' style='width: 440px; border-style: solid; border-color: rgba(0, 0, 0, 0.1); border-width: 1px; margin: 5px 15px; padding: 0px 15px 10px 15px;'>
  <div>
    <span class='closeIcon'>&times;</span>
  </div>
  <div style='padding: 10px 22px 10px 0;'>
    <input type='hidden' class='option-no' value="{{no}}">
    {{title}}
  </div>
  <input class='option-quantity' type='number' style='text-align:center; width: 60px; vertical-align: top;' value='1' min='1' max='1000'>
  <input class='option-price' type='hidden' type='number' value="{{price}}">
  <span style='float: right; padding-top: 5px;' class=''><span class='option-price-sum'>{{price}}</span>원</span>

</div>
</script>

<script>
  var productPrice = parseInt(${product.price * (100 - product.discount) / 100});
  
  // 제품 옵션 데이터 준비
  var options = [];
<c:forEach items="${product.options}" var="productOption">
  options.push({'no': ${productOption.optionNo}, 'title': '${productOption.title}', 'price': productPrice + ${productOption.price}});
</c:forEach>
    
  function getOption(no) {
    for (var option of options) {
      if (no == option.no) {
        return option;
      }
    }
    return null;
  }
    
  var optionTemplate = Handlebars.compile($('#option-template').html());
  
  calculatePrice();
  
  // 선택한 옵션 등록하기
  $('#product-option').change(function(e) {
    var selectedOption = getOption($(this).val());
    if ($('#selected-option-div .option-no[value=' + selectedOption.no +']').length > 0) 
      return;
    console.log(selectedOption)
    $('#selected-option-div').append(optionTemplate(selectedOption));
    calculatePrice();
  })
    

  // 옵션 변경
  $('#selected-option-div').on('change', '.option-quantity', function (e) {
    var productPrice = parseInt(${product.price * (100 - product.discount) / 100});
    var optionQuantity = parseInt($(this).val());
    var optionPrice = parseInt($(this.parentNode).find('.option-price').val());
    $(this.parentNode).find('.option-price-sum').html(optionPrice * optionQuantity);
    calculatePrice();
  });

  $('#selected-option-div').on('click', '.closeIcon', function (e) {
    $(this.parentNode.parentNode).remove();
    calculatePrice();
  });
  
  // 주문 가격 재계산
  function calculatePrice() {
    var optionPrices = $('#selected-option-div .option-price-sum');
    var checkPrice = 0;
    for (i = 0; i < optionPrices.length; i++) {
      checkPrice += parseInt(optionPrices[i].innerText);
    }
    $('#total-check-price').html(Number(checkPrice).toLocaleString('en'));
  }
  
  // 장바구니 담기
  $('#cart-btn').click(function(e) {
    if (!confirm("장바구니에 담겠습니까?"))
      return;
    
    var data = {
      'no': ${product.productNo},
      'options': []
    };
    
    var selectedOptions = $('#selected-option-div .selected-option');
    for (var i = 0; i < selectedOptions.length; i++) {
      var selectedOption = selectedOptions[i];
      data['options'].push({
        'no': $(selectedOption).find('.option-no').val(),
        'quantity': $(selectedOption).find('.option-quantity').val()
      });
    }
    console.log(data);
    $.ajax({
      url: '/app/cart/add', 
      method: 'post',
      data: JSON.stringify(data), 
      dataType: 'json',
      contentType: 'application/json',
      success: function(response) {
        alert("장바구니에 상품을 담았습니다.");
      }
    });
  });
  </script>
</body>

</html>