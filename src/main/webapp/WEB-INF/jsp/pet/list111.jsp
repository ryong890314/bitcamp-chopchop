<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>마이펫 정보</title>
  <link rel="stylesheet" href="/css/member/style_detail.css">
  <link rel="stylesheet" href="/node_modules/jquery-ui-dist/jquery-ui.css">
  <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
<style type="text/css">
  .petInfo {
    margin: 0 auto;
  }
  .photo1 { 
    width: 200px; 
    height: 200px; 
  } 
</style>
</head>
<body>

<hr> 

<div class="container"> 
<h1>My Pet 정보</h1>
<a href='form'>펫 등록</a><br>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <c:forEach items="${pets}" var="pet" >
    <div class="carousel-item active">
      <img src="/upload/pet/${pet.filePath}" class="d-block">
    </div>
    
  </c:forEach>
  <c:forEach items="${pets}" var="pet">
    <div class="carousel-item">
      <img src="/upload/member/${pet.filePath}" class="d-block" alt="...">
    </div>
  </c:forEach>
  <c:forEach items="${pets}" var="pet">
    <div class="carousel-item">
      <img src="/upload/member/${pet.filePath}" class="d-block" alt="...">
    </div>
  </c:forEach>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class="petInfo">
<c:forEach items="${pets}" var="pet">
  <ul>
    <li>펫 번호: <a href='detail?no=${pet.petNo}'>${pet.petNo}</a></li>
    <li>회원 번호: ${pet.memberNo}</li>
    <li>펫 이름: ${pet.name}</li>
    <li>등록일: ${pet.createdDate}</li>
    <li>등록번호: ${pet.registerNo}</li>
    <li>펫 나이: ${pet.age}</li>
    <li>성별: ${pet.gender}</li>
  </ul>
</c:forEach>
</div>

</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/node_modules/jquery-ui-dist/jquery-ui.min.js"></script>
<script src="/node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>


</body>
</html>