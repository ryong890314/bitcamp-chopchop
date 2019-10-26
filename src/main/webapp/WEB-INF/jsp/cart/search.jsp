<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>장바구니</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




</head>

<body>

  <div id='cart'>
    <h1>장바구니</h1>
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
            <form name="form">
              <input class="myChkbox" type="checkbox" name="chkbox" value="${cart.cartNo}"><br>
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
<div>합계금액</div>
<td height="25">&nbsp;합계:&nbsp;<input id="totalSum" name="total_sum" type="text" size="20" readonly></td>
<hr class="my-4">

<a href='#' class="btn bueno-btn">선택삭제</a>
<a href='#' class="btn bueno-btn">선택구매</a>
<a href='#' class="btn bueno-btn">전체구매</a>

  </div>

  <script>

    var myCheckBoxes = document.getElementsByClassName('myChkbox');

    for (var i = 0; i < myCheckBoxes.length; i++) {
      myCheckBoxes[i].addEventListener('change', function() {
        
        var sum = 0;
        var totalSum = document.getElementById('totalSum');

        for(var j = 0; j < myCheckBoxes.length; j++){
          if (myCheckBoxes[j].checked) {
            sum += parseInt(myCheckBoxes[j].value);
          }
        }
        totalSum.value = sum;
      });

    }

    
    </script>

</body>

</html>