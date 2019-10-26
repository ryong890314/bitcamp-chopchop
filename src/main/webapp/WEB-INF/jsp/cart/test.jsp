<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>테스트</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>

<div id="cart">
<body>
    <table class='table table-hover'>
        <tr>
          <th>선택</th>
      
        </tr>
        <c:forEach items="${carts}" var="cart">
          <tr>
            <td>
              <form name="checkForm">
                <input class="myChkbox" type="checkbox" name="chkbox" value="${cart.cartNo}"><br>
              </form>
            </td>
          </tr>
        </c:forEach>
      </table>

      <input type='button' onclick='check_all();' value='모두 선택' />
      <input type='button' onclick='uncheck_all();' value='모두 해제' />
      <input type='button' onclick='check_Del();' value='선택 삭제' />

</div>

<script>
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
  // 선택삭제
  function check_Del() {
    var myCheckBoxes = document.getElementsByClassName('myChkbox');
    for (var i = 0; i < myCheckBoxes.length; i++) {
      location.href = "delete?no=" + parseInt(myCheckBoxes[i].value);
    }
  }
</script>


</body>

</html>