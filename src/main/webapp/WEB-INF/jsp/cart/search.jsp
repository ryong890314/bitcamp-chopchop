<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>장바구니</title>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
  crossorigin="anonymous"></script>
  <link rel='stylesheet' href='/css/product/style.css'>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>

<body>

  <div id='cart'>
    <h1>장바구니</h1>

    <input type='button' onclick='check_all();' value='모두 선택' />
    <input type='button' onclick='uncheck_all();' value='모두 해제' />

    <table class='table table-hover'>
      <tr>
        <th>선택</th>
        <th>상품사진</th>
        <th>상품/옵션정보</th>
        <th>등록일</th>
        <th>판매가</th>
        <th>수량</th>
        <th>삭제</th>
    
      </tr>
      <c:forEach items="${carts}" var="cart">
        <tr>
          <td>
            <form>
              <input class="myChkbox" type="checkbox" name="chkbox" value="${cart.cartNo}">
            </form>
          </td>
          <td>
            <c:forEach items="${cart.files}" var="file" end="0">
              <img src='/upload/product/${file.filePath}' style="width: 100px; height: 100px;">
            </c:forEach>
          </td>
          <c:forEach items="${cart.products}" var="product">
            <td>${product.title}</td>
          </c:forEach>
          <td>${cart.createdDate}</td>
          <c:forEach items="${cart.products}" var="product">
            <td><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</td>
          </c:forEach>
          <td>
            <form action="update" method="POST">
            <div class="input-group input-number-group">
              <input class="input-number" name="quantity" type="number" style="text-align:center" value="${cart.quantity}" min="0" max="1000">
              <input type="hidden" name="cartNo" value="${cart.cartNo}">
              <button>적용</button>
            </div>
            </form>
          </td>
          <td>
            <button type="button" onclick="location.href='delete?no=${cart.cartNo}' ">삭제</button>
          </td>
        </tr>
      </c:forEach>
    </table>

    <hr class="my-4">
    
    <div style="float: right">
      <a1>상품금액 </a1><a>price</a>
      <a1>원 + 배송비 </a1><a>0</a>
      <a1>원 = 합계금액 </a1><a style="color:red">0</a>
      <a1>원</a1>
    </div>
    <td height="25">&nbsp;카트ID 합계:&nbsp;<input id="totalSum" name="total_sum" type="text" size="20" readonly></td>

    <hr class="my-4">

<div style="float: right">
<button class="btn bueno-btn" onclick='check_Del();'>선택삭제</button>
<button class="btn bueno-btn" onclick='check_Price();'>금액확인</button>
<a href='#' class="btn bueno-btn">선택구매</a>
<a href='#' class="btn bueno-btn">전체구매</a>
</div>

  </div>

  <script>
    // cartNo sum
    var myCheckBoxes = document.getElementsByClassName('myChkbox');
    for (var i = 0; i < myCheckBoxes.length; i++) {
      myCheckBoxes[i].addEventListener('change', function () {
        var sum = 0;
        var totalSum = document.getElementById('totalSum');
        for (var j = 0; j < myCheckBoxes.length; j++) {
          if (myCheckBoxes[j].checked) {
            sum += parseInt(myCheckBoxes[j].value);
          }
        }
        totalSum.value = sum;
      });
    }
  </script>

<script>
  // checkbox 전체 선택/해제
  var myCheckBoxes = document.getElementsByClassName('myChkbox');
    function check_all() {
      for(i=0; i < myCheckBoxes.length; i++) {
        myCheckBoxes[i].checked = true;
      }
    }
    function uncheck_all() {
      for(i=0; i < myCheckBoxes.length; i++) {
        myCheckBoxes[i].checked = false;
      }
    }
    </script>


<script>
    function check_Del() {
      var chkbox = "";
      $("input[name='chkbox']:checked").each(function () {
        chkbox = chkbox + $(this).val() + ",";
      });
      chkbox = chkbox.substring(0, chkbox.lastIndexOf(",")); //맨끝 콤마 지우기
  
      if (chkbox == '') {
        alert("삭제할 대상을 선택하세요.");
        return false;
      }
      console.log("### chkbox => {}" + chkbox);
  
      if (confirm("정보를 삭제 하시겠습니까?")) {
  
        //삭제처리 후 다시 불러올 리스트 url      
        location.href = "chkdelete?chkbox=" + chkbox;
      }
    }
  </script>

  <script>
    // 선택 상품금액
    function check_Price(){
      var myCheckBoxes = document.getElementsByClassName('myChkbox');
      for (var i = 0; i < myCheckBoxes.length; i++){
        if (myCheckBoxes[i].checked) {
          alert(parseInt(myCheckBoxes[i].value)); //

        }
      }
    }

  </script>

</body>

</html>