<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>테스트</title>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <link rel='stylesheet' href='/css/product/style.css'>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>

<div id="cart">

  <body>
    <table class='table table-hover'>
      <tr>
        <th>선택</th>
        <th>장바구니ID</th>
        <th>상품명</th>
        <th>가격</th>
        <th>수량</th>
        <th>합계</th>
      </tr>
      <c:forEach items="${carts}" var="cart">
        <tr>
          <td>
            <form name="checkForm">
              <input class="myChkbox" type="checkbox" name="chkbox" value="${cart.cartNo}"><br>
            </form>
          </td>
          <td>${cart.cartNo}</td>
          <c:forEach items="${cart.products}" var="product">
            <td>${product.title}<br>${product.title}</td>

          </c:forEach>
          <c:forEach items="${cart.products}" var="product">
            <td><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</td>
            <input type="hidden" name="chkprice" value="${product.price}">
          </c:forEach>
          <td><input class="input-number" name = chkquantity value="${cart.quantity}"></td>
          <td></td>
        </tr>
        </tr>
      </c:forEach>
    </table>

    <hr class="my-4">

    <input type='button' onclick='check_all();' value='모두 선택' />
    <input type='button' onclick='uncheck_all();' value='모두 해제' />
    <input type='button' onclick='check_Del();' value='선택 삭제' />
    <input type='button' onclick='check_price();' value='금액 확인'' />

    <hr class="my-4">
    
    <div style="float: right">
      <a1>상품금액 </a1><a id="sumCheckPrice">0</a>
      <a1>원 + 배송비 </a1><a id="shipCheckPrice">0</a>
      <a1>원 = 합계금액 </a1><a id="totalCheckPrice" style="color: red">0</a>
      <fmt:formatNumber value="1989" pattern="#,###"/>
      <a1>원</a1>
    </div>

</div>

<script>
  var myCheckBoxes = document.getElementsByClassName('myChkbox');
  
  for (var i = 0; i < myCheckBoxes.length; i++) {
    myCheckBoxes[i].addEventListener('change', function () {
      reprice()
    });
  }
</script>

<script>
  myCheckBoxes = document.getElementsByClassName('myChkbox');
  function check_all() {
    for (i = 0; i < myCheckBoxes.length; i++) {
      myCheckBoxes[i].checked = true;
      reprice()
    }
  }
  function uncheck_all() {
    for (i = 0; i < myCheckBoxes.length; i++) {
      myCheckBoxes[i].checked = false;
      reprice()
    }
  }
</script>

<script>

function reprice() {
// 중복코드 제거용
  var myCheckPrice = document.getElementsByName('chkprice');
      var myCheckQuantity = document.getElementsByName('chkquantity');
      var checkPrice = 0;
      for (j = 0; j < myCheckBoxes.length; j++) {
        if (myCheckBoxes[j].checked) {
          checkPrice += parseInt(myCheckPrice[j].value) * parseInt(myCheckQuantity[j].value);
        }
      }
      sumCheckPrice.innerText = checkPrice; // 상품합계
      shipCheckPrice.innerText = 0; // 배송비
      totalCheckPrice.innerText = checkPrice + 0; // 합계
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

    if (confirm("정보를 삭제 하시겠습니까?")) {

      //삭제처리 후 다시 불러올 리스트 url      
      location.href = "chkdelete?chkbox=" + chkbox;
    }
  }
</script>

</body>

</html>