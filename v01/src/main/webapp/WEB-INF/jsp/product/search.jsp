<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>상품 검색</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>검색 결과</h1>
<table class='table table-hover'>
<tr>
  <th>번호</th>
  <th>제목</th>
  <th>가격</th>
  <th>재고</th>
  <th>사진</th>
</tr>
<c:forEach items="${products}" var="product">
  <tr>
    <td>${product.productNo}</td>
    <td><a href='detail?productNo=${product.productNo}'>${product.title}</a></td>
    <td>${product.price}</td>
    <td>${product.stock}</td>
    <td>
  <p>
  <c:forEach items="${product.files}" var="file" end="0">
    <img src='/upload/product/${file.filePath}' class='photo2'> 
  </c:forEach>
  </p>
    </td>
  </tr>
</c:forEach> 
</table>
</div>

<jsp:include page="../footer.jsp"/>

</body></html>
