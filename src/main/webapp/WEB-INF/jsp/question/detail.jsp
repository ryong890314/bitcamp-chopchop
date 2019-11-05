<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>문의게시판</title>
<!--   <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> -->
<!--   <link rel='stylesheet' href='/css/common.css'> -->
</head>
<body>

<jsp:include page="../header.jsp"/>
<div id='content'>
<h1>문의게시판</h1>
<hr>
<form action='update' method='post'>
  번호: <input type="text" name="no" value="${question.no}" readonly><br>
  이메일: <input type="email" id="email" name="emial" value="${question.email}" readonly/>
  제목: <input type="text" id="title" name="title" value="${question.title}"/><br>
  <textarea name='contents' rows='5' cols='50'>${question.contents}</textarea><br>
  조회수: ${question.viewCount}
  <button>변경</button>
  <a href="delete?no=${question.no}">게시글 삭제</a> 
</form>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>