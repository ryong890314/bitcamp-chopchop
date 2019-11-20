<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이펫</title>
<link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="stylesheet" href="/css/member/style_contact.css">
<style type="text/css">
  .photo1 {
    width: 200px;
    height: 200px;
  }
</style>
</head>
<body>
<div id='content'>
<h1>펫 목록</h1>
<a href='form'>펫 등록</a><br>
<table class='table table-hover'>
<tr>
  <th>대표사진</th>
  <th>펫 이름</th>
  <th>펫 나이</th>
  <th>성별</th>
  <th>펫 번호</th>
  <th>회원 번호</th>
  <th>등록일</th>
  <th>등록번호</th>
</tr>
<c:forEach items="${pets}" var="pet">
  <tr>
    <td><img src="/upload/pet/${pet.filePath}" class="photo1"></td>
    <td>${pet.name}</td>
    <td>${pet.age}</td>
    <td>${pet.gender}</td>
    <td><a href='detail?no=${pet.petNo}'>${pet.petNo}</a></td>
    <td>${pet.memberNo}</td>
    <td>${pet.createdDate}</td>
    <td>${pet.registerNo}</td>
  </tr>
</c:forEach>
</table>
</div>
</body>
</html>