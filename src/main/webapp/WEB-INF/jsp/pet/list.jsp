<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Pet List</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>My Pet List</h1>

<a href='form'>Add My Pet</a><br>

<table class='table table-hover'>
<tr>
  <th>Pet No</th>
  <th>Pet Name</th>
  <th>Create Date</th>
  <th>Register No</th>
</tr>
<c:forEach items="${pets}" var="pet">
  <tr>
    <td>${pet.petNo}</td>
    <td><a href='detail?no=${pet.petNo}'>${pet.name}</a></td>
    <td>${pet.createdDate}</td>
    <td>${pet.registerNo}</td>
  </tr>
</c:forEach> 
</table>
</div>

<jsp:include page="../footer.jsp"/>

</body></html>
