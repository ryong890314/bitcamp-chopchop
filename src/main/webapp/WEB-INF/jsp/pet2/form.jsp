<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>마이펫 등록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <!-- <link rel='stylesheet' href='/css/common.css'> -->
</head>
<body>

<jsp:include page="../header.jsp"/>
    
<div id='content'>
<h1>마이펫 등록</h1>
<form action='add' method='post' enctype='multipart/form-data'>
  <label for="memberNo">회원 번호</label>
  <input type="text" id="memberNo" name="memberNo" value="${memberNo}" readonly/>
  <label for="name">펫 이름</label>
  <input type="text" id="name" name="name"/>
 
  <label for="registerNo">등록번호</label>
  <input type="text" id="registerNo" name="registerNo"/>
  <label for="age">펫 나이</label><br> 
  <input type="text" id="age" name="age"/><br>
  
  <label for="gender">
  <input type='radio' id='gender' name='gender' value=0 />암컷</label>
  <label>
  <input type='radio' name='gender' value=1 />수컷</label><br>
  <label for="filePath">대표사진</label>
  <input type="file" id="file" name="file"/><br>
<button>등록</button>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>