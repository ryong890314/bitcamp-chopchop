<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
    .photo {
      height: 120px;
    }
    </style>
    <title>Recipe List</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<h1>레시피 목록</h1>
<a href='form'>레시피 등록</a></br>

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

<form action='search'>
    FIND RECIPE : <input type='text' name='keyword'>
  <button>검색</button>
</form>
</table>

<script>

</script>

</body>
</html>