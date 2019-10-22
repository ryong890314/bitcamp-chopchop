<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>게시물 목록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>상품 목록</h1>
<a href='form'>새 상품</a><br>
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

<!-- 검색기능 추가 시작 -->
<form action='search'>

  	<select name="searchOption" id="searchOption">
			<option value="all" selected> 전체 (제목+내용) </option>
			<option value="title"> 제목 </option>
			<option value="detail"> 내용 </option>
		</select>
  
  <input type='text' name='keyword'>
  <button>검색</button>
</form>
<!-- 검색기능 추가 끝 -->

</div>

<jsp:include page="../footer.jsp"/>

</body></html>
