<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>문의게시판</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>
<div id='content'>
<h1>문의게시판</h1>
<form action='update' method='post'>
  번호 : <input type="text" name="no" value="${question.no}" readonly><br>
  <label for="email">이메일</label>
  <input type="email" id="email" name="emial" value="${question.email}"/>
  
  <label for="title">제목</label>
  <input type="text" id="title" name="title" value="${question.title}"/>
  <textarea name='contents' rows='5' cols='50'>${question.contents}</textarea><br>
  <button>변경</button>
  <a href="delete?no=${question.no}">게시글 삭제</a> 
</form>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>