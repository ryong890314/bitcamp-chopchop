<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  div {
    border: 1px solid black;
  }
  
  .photo {
    height: 120px;
  }
</style>
<title>레시피 검색</title>
</head>
<body>

<h1>레시피 검색</h1>
 
 <table>
<tr>
  <th>번호</th>
  <th>제목</th>
  <th>대표사진</th>
</tr>
 <c:forEach items="${recipes}" var="recipe">
  <tr>
    <td>${recipe.no}</td>
    <td><a href='detail?no=${recipe.no}'>${recipe.title}</a></td>
    <td><img src='/upload/recipe/${recipe.thumbnail}' class='photo'></td>
  </tr>
</c:forEach>

</table>

</body>
</html>