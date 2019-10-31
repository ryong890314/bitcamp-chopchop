<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <label for="petNo">펫 번호</label>
  <input type="text" id="petNo" name="petNo"/><br>
  <label for="memberNo">회원 번호</label>
  <input type="text" id="memberNo" name="memberNo"/><br>
  <label for="name">펫 이름</label>
  <input type="text" id="name" name="name"/><br>
  <label for="createdDate">등록일</label>
  <input type="text" id="createdDate" name="createdDate"/><br>
  <label for="registerNo">등록번호</label>
  <input type="text" id="registerNo" name="registerNo"/><br>
  <label for="age">펫 나이</label>
  <input type="text" id="age" name="age"/><br>
  성별<br> <label for="gender"><input type='radio' id='gender' name='gender' value='gender' />암컷</label>
  <label><input type='radio' name='gender' value='gender' />수컷</label><br>
  <label for="filePath">대표사진</label>
  <input type="file" id="filePath" name="filePath"/><br>
  <label for="breedId">품종</label>
  <input type="text" id="breedId" name="breedId"/><br>
<button>등록</button>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>