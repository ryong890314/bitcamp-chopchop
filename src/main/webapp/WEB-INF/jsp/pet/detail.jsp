<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>펫 보기</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
</head>
<body>

<jsp:include page="../header.jsp"/>
    
<div id='content'>
<h1>my pet</h1>
<form action='update' method='post' enctype='multipart/form-data'>
<img src='/upload/pet/${pet.photo}' class='photo1'><br> 

<input type='file' name='file'><br>
번호: <input type='text' name='no' value='${pet.petNo}' readonly><br>
펫 이름: ${pet.name}
등록 번호: <input type='text' name='password' value='${pet.registerNo}'><br>
가입일: ${pet.createdDate}<br>
Breed: <input type='text' name='breed' value='${pet.breeds.breed}' readonly><br>

<button>변경</button>
<a href='delete?no=${pet.petNo}'>삭제</a>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
