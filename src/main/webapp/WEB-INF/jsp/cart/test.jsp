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
            <td>${product.title}</td>
          </c:forEach>
          <c:forEach items="${cart.products}" var="product">
            <td><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</td>
          </c:forEach>
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
      <a1>상품금액 </a1><a>price</a>
      <a1>원 + 배송비 </a1><a>0</a>
      <a1>원 = 합계금액 </a1><a style="color:red">0</a>
      <a1>원</a1>
    </div>

</div>

<script>
    var myCheckBoxes = document.getElementsByClassName('myChkbox');

    function check_price() {
    for (i = 0; i < myCheckBoxes.length; i++) {
      if (myCheckBoxes[i].checked) {
        alert(parseInt(myCheckBoxes[i].value));
          }
          
    }
  }
  </script>

<script>
  var myCheckBoxes = document.getElementsByClassName('myChkbox');
  function check_all() {
    for (i = 0; i < myCheckBoxes.length; i++) {
      myCheckBoxes[i].checked = true;
    }
  }
  function uncheck_all() {
    for (i = 0; i < myCheckBoxes.length; i++) {
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

</body>

</html>