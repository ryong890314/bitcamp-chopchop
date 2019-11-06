<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>댓글 등록폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
</head>
<body>

<div id='content'>
<h1>댓글 등록폼</h1>
<form action='add' method='post'>
 작성자 : <input type='text' name='nickname' value='${loginUser.nickname}'>
  내용 : <textarea name='content' rows='5' cols='50'></textarea><br>
  <button>등록</button>
</form>
</div>

</body>
</html>
