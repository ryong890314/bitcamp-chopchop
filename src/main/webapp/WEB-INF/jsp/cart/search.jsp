<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>장바구니</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<div id='cart'>
<h1>장바구니</h1>
<table class='table table-hover'>
<tr>
  <th>상품사진</th>
  <th>상품정보</th>
  <th>등록일</th>
  <th>판매가</th>
  <th>수량</th>
  <th>삭제</th>

</tr>
<c:forEach items="${carts}" var="cart">
  <tr>
    <td>${cart.cartNo}</td>
    <td>
      
      ${cart.products}.var="title"

    </td>
    <td>${cart.createdDate}</td>
    <td>${cart.cartNo}</td>
    <td>${cart.quantity}</td>
  </tr>
</c:forEach> 
</table>
</div>

</body></html>
