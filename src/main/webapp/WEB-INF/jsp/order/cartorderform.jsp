<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
  <title>주문 폼</title>
  <link rel='stylesheet' href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <style>
    #textbox {
      width: 500px;
    }
    
    #radio-button {
      width:40px;
    }
    
    #orderForm {
      width:1100px; 
      display: table; 
      margin-left: auto; 
      margin-right: auto; 
    }
  </style>
</head>
<body>
  <jsp:include page="../header.jsp"/>
  
  <form action="addfromcart" method="post" id="orderForm">
      <input type="hidden" name="memberNo" value="${loginUser.memberNo}">
      <table class='table table-bordered' style="width:1100px; display: table; margin-left: auto; margin-right:auto;">
    <tr>
      <td>상품</td>
      <td>상품 가격</td>
      <td>수량</td>
<!--       <td>할인률</td> -->
      <td>결제 금액</td>
    </tr>
    <c:forEach items="${selected}" var="cart">
      <tr>
        <td>${cart.product.title}</td>
        <td>${cart.product.price}원</td>
        <td class="cartQuantity">${cart.quantity}개</td>
        <td><span class="totalPrice">${cart.product.price * cart.quantity * (100-cart.product.discount)/100}</span>원</td>
      </tr>
    </c:forEach>
    <tr>
      <td>총 주문금액</td>
      <td><span id="resultPrice"></span>원</td>
    </tr>
  </table>
<!--     <div style="display: table; margin-left: auto; margin-right:auto;"> -->
      <div class="row">
      <div class="col-md-6">
        <label for="exampleInput">주문자 이름</label>
        <input type="text" id="customerName" class="form-control" value="${loginUser.nickname}">
      </div>
      <div class="col-md-6">
        <label for="exampleInput">수령인 이름</label>
        <input type="text" id="recipientName" class="form-control" name="name" value="" placeholder="이름을 입력하세요." required="required">
        <div id="nameCheck" style="color:red;"> </div>
      </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">주문자 연락처</label>
          <input type="text" id="customerTel" class="form-control" name="" value="${loginUser.tel}">
        </div>
        <div class="col-md-6">      
          <label for="exampleInput">수령인 연락처</label>
          <input type="text" id="recipientTel" class="form-control" name="tel" value="" placeholder="연락처를 입력하세요." required="required">
          <div id="telCheck" style="color:red;"></div>
          </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">우편번호</label>
          <input type="text" id="customerPostNo" class="form-control" name="" value="${loginUser.postNo}">
        </div>
        <div class="col-md-6">      
          <label for="exampleInput">수령인 우편번호</label>
          <input type="text" id="recipientPostNo" class="form-control" name="postNo" value="" placeholder="우편번호를 입력하세요." required="required">
          <div id="postNoCheck" style="color:red;"></div>
          </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">기본주소</label>
          <input type="text" id="customerBaseAddress" class="form-control" name="" value="${loginUser.baseAddress}">
        </div>
        <div class="col-md-6">      
          <label for="exampleInput">수령인 기본주소</label>
          <input type="text" id="recipientBaseAddress" class="form-control" name="baseAddress" value="" placeholder="기본주소를 입력하세요." required="required"><div id="baseAddressCheck" style="color:red;"></div>
          </div>
          
      </div>
      <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">상세주소</label>
          <input type="text" id="customerDetailAddress" class="form-control" name="" value="${loginUser.detailAddress}">
        </div>
        <div class="col-md-6">
          <label for="exampleInput">수령인 상세주소</label>
          <input type="text" id="recipientDetailAddress" class="form-control" name="detailAddress" value="" placeholder="상세주소를 입력하세요." required="required">
          <div id="detailAddressCheck" style="color:red;"></div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">      
          <label for="exampleInput">주문자 이메일</label>
          <input type="text" id="customerEmail" class="form-control" name="" value="${loginUser.email}">
        </div>
      </div>
      
      <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">결제수단</label>
          <input type="radio" id="radio-button" name="paymentMethod" value="신용카드">신용카드
          <input type="radio" id="radio-button" name="paymentMethod" value="무통장 입금">무통장 입금
          <input type="radio" id="radio-button" name="paymentMethod" value="간편결제">간편결제
          <div id="paymentMethodCheck" style="color:red;"></div>
        </div>
        <div class="col-md-6">      
          <label for="exampleInput">주문자 정보와 동일<input type="checkbox" id="checkBox" style="width:30px;" disabled></label>
        </div>
      </div>
      <br><br>
      <hr>
      <br><br>
      관리자<br><br>
      <div class="row">
      <div class="col-md-6">
      <label for="exampleInput">주문상태</label>
      <select id="selectBox" name="shipDate" class="form-control" required="required">
        <option value="1">입금 전</option>
        <option value="2">입금 확인</option>
        <option value="3">발송</option>
        <option value="4">배송완료</option>
      </select>
      </div>
      </div>
      <div>
        <input type="hidden" id="textbox" name="no" value="${product.productNo}">
        <input type="hidden" id="textbox" name="discount" value="${product.discount}">
        <button type="button" id="orderButton" class="btn btn-success" data-toggle="modal" data-target="#orderModal">주문</button>
        <a href="../product/list" class="btn btn-danger" style="margin-left:30px;">취소</a>
      </div>
      <input type="hidden" name="optionNo" value=1>
      <input type="hidden" name="quantity" value="${quantity}">
      <input type="hidden" id="discountPrice" name="discountPrice" value="${cart.product.price * cart.quantity * (100-cart.product.discount)/100}">
<!--     </div> -->
  <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">주문 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-6">제품명</div>
          <div class="col-md-6">가격</div>
        </div>
        <div class="row">
          <c:forEach items="${selected}" var="products">
            <div class="col-md-6">
              <div id="modalProduct">${products.product.title}</div>
            </div>
            <div class="col-md-6">
              <div id="modalPrice">${products.product.price}원</div>
            </div>
          </c:forEach>
        </div>
        <div class="row">
          <div class="col-md-4" id="finalPrice"></div>
        </div>
        
        <hr>
        수령인: <span id="modalName"></span><br>
        수령인 연락처: <span id="modalTel"></span><br>
        수령인 우편번호: <span id="modalPostNo"></span><br>
        수령인 기본주소: <span id="modalbaseAddress"></span><br>
        수령인 상세주소: <span id="modalDetailAddress"></span><br>
        주문자 이메일: <span id="modalEmail">${loginUser.email}</span><br>
        결제 수단: <span id="modalPayment"></span>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary">결제</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</form>
  <jsp:include page="../footer.jsp"/>

  <script>
    var totalPrice = $('.totalPrice');
    var temp = 0;
    for(var i of totalPrice){
      i.innerText = parseInt(i.innerText);
      temp += parseInt(i.innerText);
      console.log(temp);
    }
    
    var result = document.querySelector('#resultPrice');
    
    if(temp < 50000) {
      temp += 2500;
      console.log('배송비 더해서 ' + temp);
    }
    
    result.innerText = temp;
    
  </script>
  
  <script> // 주문자와 동일 체크
    var checkBox = document.querySelector('#checkBox');
    if(!(${loginUser.memberNo} == 0)) {
      checkBox.removeAttribute("disabled")
    }

    checkBox.addEventListener('change', function(){
      if(checkBox.checked) {
        document.querySelector('#recipientName').value = document.querySelector('#customerName').value;
        document.querySelector('#recipientTel').value = document.querySelector('#customerTel').value;
        document.querySelector('#recipientPostNo').value = document.querySelector('#customerPostNo').value;
        document.querySelector('#recipientBaseAddress').value = document.querySelector('#customerBaseAddress').value;
        document.querySelector('#recipientDetailAddress').value = document.querySelector('#customerDetailAddress').value;
        $('#nameCheck').text('');
        $('#telCheck').text('');
        $('#postNoCheck').text('');
        $('#baseAddressCheck').text('');
        $('#detailAddressCheck').text('');
      } else {
        document.querySelector('#recipientName').value = "";
        document.querySelector('#recipientTel').value =  "";
        document.querySelector('#recipientPostNo').value =  "";
        document.querySelector('#recipientBaseAddress').value =  "";
        document.querySelector('#recipientDetailAddress').value =  "";
      }
    })
  </script>
  
  <script> // 모달 값 넣어주는 스크립트
    var chooseRadio = $("[name=paymentMethod]");
    var chooseCard = chooseRadio[0];
    var chooseAccount = chooseRadio[1];
    var chooseEasy = chooseRadio[2];

//     var name = $('#recipientName').val();
//     console.log(name);
    
//     document.querySelector('#modalName').innerText = document.querySelector('#recipientName').value;
    
    
    var isChecked = false;
    
    $('#orderButton').on('click', function(e){
      if($('#recipientName').val() == "") {
        $('#nameCheck').text('이름을 입력해주세요.');
        isChecked = false;
        console.log(isChecked);
      } else {
        $('#nameCheck').text('');
        isChecked = true;
      }
      
      if($('#recipientTel').val() == "") {
        $('#telCheck').text('전화번호를 입력해주세요.');
        isChecked = false;
      } else {
        $('#telCheck').text('');
        isChecked = true;
      }
      
      if($('#recipientPostNo').val() == "") {
        $('#postNoCheck').text('우편번호를 입력해주세요.');
        isChecked = false;
      } else {
        $('#postNoCheck').text('');
        isChecked = true;
      }
      
      if($('#recipientBaseAddress').val() == "") {
        $('#baseAddressCheck').text('주소를 입력해주세요.');
        isChecked = false;
      } else {
        $('#baseAddressCheck').text('');
        isChecked = true;
      }
      
      if($('#recipientDetailAddress').val() == "") {
        $('#detailAddressCheck').text('상세주소를 입력해주세요.');
        isChecked = false;
      } else {
        $('#detailAddressCheck').text('');
        isChecked = true;
      }
      
      var radioCheck = $('input[type="radio"]');
      console.log(radioCheck);
      if(!radioCheck[0].checked && !radioCheck[1].checked && !radioCheck[2].checked) {
        $('#paymentMethodCheck').text('결제 수단을 선택해주세요.')
        isChecked = false;
      } else {
        $('#paymentMethodCheck').text('');
//         isChecked = true;
      }
      
      if(isChecked) {
        $('#orderModal').on('show.bs.modal', function (e) {
          $('#modalProduct').text('${product.title}');
          $('#modalPrice').text($('#totalPrice').text());
          $('#modalName').text($('#recipientName').val());
          $('#modalTel').text($('#recipientTel').val());
          $('#modalPostNo').text($('#recipientPostNo').val());
          $('#modalbaseAddress').text($('#recipientBaseAddress').val());
          $('#modalDetailAddress').text($('#recipientDetailAddress').val());
          $('#modalEmail').text($('#customerEmail').val());
          if(chooseCard.checked) {
            $('#modalPayment').text(chooseCard.value);
          } else if(chooseAccount.checked) {
            $('#modalPayment').text(chooseAccount.value);
          } else if(chooseEasy.checked) {
            $('#modalPayment').text(chooseEasy.value);
          }
          $('#finalPrice').text(temp + "원");
        })
      } else {
        return false;
      }
      
    });
  
  </script>
  
  <script>
  "use strict";
    $('#orderModal').modal({ // modal 속성 설정
      backdrop: 'static',
      keyboard: false,
      show: false
    });
    
  </script>
  
  <script> // 빈 입력값 체크
    $('#recipientName').on('blur', function(event){
      if($('#recipientName').val() == '') {
        $('#nameCheck').text('이름을 입력해주세요.');
      } else {
        $('#nameCheck').text('');
      }
    });
  
    $('#recipientTel').on('blur', function(event){
      if($('#recipientTel').val() == '') {
        $('#telCheck').text('전화번호를 입력해주세요.');
      } else {
        $('#telCheck').text('');
      }
    });
    
    $('#recipientPostNo').on('blur', function(event){
      if($('#recipientPostNo').val() == '') {
        $('#postNoCheck').text('우편번호를 입력해주세요.');
      } else {
        $('#postNoCheck').text('');
      }
    });
    
    $('#recipientBaseAddress').on('blur', function(event){
      if($('#recipientBaseAddress').val() == '') {
        $('#baseAddressCheck').text('주소를 입력해주세요.');
      } else {
        $('#baseAddressCheck').text('');
      }
    });
    
    $('#recipientDetailAddress').on('blur', function(event){
      if($('#recipientDetailAddress').val() == '') {
        $('#detailAddressCheck').text('상세주소를 입력해주세요.');
      } else {
        $('#detailAddressCheck').text('');
      }
    });
  </script>
  
  
  
</body>
</html>