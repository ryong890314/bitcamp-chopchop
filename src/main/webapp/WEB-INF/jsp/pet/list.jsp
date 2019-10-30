<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>펫 목록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel="stylesheet" href="/css/member/style_contact.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>펫 목록</h1>
<a href='form'>새 회원</a><br>
<table class='table table-hover'>
<tr>
  <th>번호</th>
  <th>이름</th>
  <th>나이</th>
  <th>성별</th>
</tr>
<c:forEach items="${pets}" var="pet">
  <tr>
    <td><a href='detail?no=${pet.petNo}'>${pet.petNo}</a></td>
    <td>${pet.name}</td>
    <td>${pet.age}</td>
    <td>${pet.gender}</td>
    <c:forEach items="${pet.breeds}" var="breed">
    </c:forEach>
  </tr>
</c:forEach>
</table>
</div>
<jsp:include page="../footer.jsp"/>

</body>
</html>
