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
          <th>장바구니ID</th>
      
        </tr>
        <c:forEach items="${carts}" var="cart">
          <tr>
            <td>
              <form name="checkForm">
                <input class="myChkbox" type="checkbox" name="chkbox" value="${cart.cartNo}"><br>
              </form>
            </td>
            <td>${cart.cartNo}</td>
          </tr>
        </c:forEach>
      </table>

      <input type='button' onclick='check_all();' value='모두 선택' />
      <input type='button' onclick='uncheck_all();' value='모두 해제' />
      <input type='button' onclick='check_Del();' value='선택 삭제' />

</div>

<h1>요소 노드의 생성</h1>
	<p id="text">새로운 단락을 생성하여 이 단락 앞에 추가할 것입니다.</p>
	<button onclick="createNode()">요소 노드 생성!</button>

	<script>
		function createNode() {
			var criteriaNode = document.getElementById("text");	// 기준이 되는 요소로 아이디가 "text"인 요소를 선택함.
			var newNode = document.createElement("p");			// 새로운 <p> 요소를 생성함.
			newNode.innerHTML = "새로운 단락입니다.";
			document.body.insertBefore(newNode, criteriaNode);	// 새로운 요소를 기준이 되는 요소 바로 앞에 추가함.
		}
	</script>
	

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