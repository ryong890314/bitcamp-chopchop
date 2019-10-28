<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='/css/rrecipe/common.css'>
<link rel='stylesheet' href='/css/rrecipe/style.css'>

<title>레시피 목록</title>
</head>
<body>

<div id='recipemain'>
<h1>레시피 목록</h1>
<a href='form'>레시피 등록</a>
<table class='table table-hover'>

<tr>
  <th>레시피번호</th>
  <th>제목</th>
  <th>썸네일</th>
</tr>
<c:forEach items="${rrecipes}" var="rrecipe">
  <tr>
    <td>${rrecipe.recipeNo}</td>
    <td><a href='detail?no=${rrecipe.recipeNo}'>${rrecipe.title}</a></td>
    <td><a href='detail?no=${rrecipe.recipeNo}'><img src='/upload/rrecipe/${rrecipe.thumbnail}' class='photo2' ></a><br></td>
  </tr>
</c:forEach>
</table>
</div>

</body>
</html>

