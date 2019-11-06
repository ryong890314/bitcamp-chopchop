<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>댓글 목록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
</head>
<body>

<div id='content'>
<h1>댓글 목록</h1>
<a href='form'>새 글</a><br>
<table class='table table-hover'>
<tr>
  <th>번호</th>
  <th>회원번호</th>
  <th>내용</th>
  <th>등록일</th>
</tr>
<c:forEach items="${recipeComments}" var="recipeComment">
  <tr>
    <td>${recipeComment.commentNo}</td>
    <td>${recipeComment.memberNo}</td>
    <td><a href='detail?no=${recipeComment.commentNo}'>${recipeComment.content}</a></td>
    <td>${recipeComment.createdDate}</td>
  </tr>
</c:forEach>  
</table>
</div>

</body>
</html>
