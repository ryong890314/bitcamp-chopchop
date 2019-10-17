<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>상품 등록폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>
    
<div id='content'>
<h1>상품 등록폼</h1>
<form action='add' method='post'>
  타이틀 : <textarea name='title' rows='1' cols='50'></textarea><br>
  가격 : <textarea name='price' rows='1' cols='50'></textarea><br>
  내용 : <textarea name='detail' rows='1' cols='50'></textarea><br>
  재고 : <textarea name='stock' rows='1' cols='50'></textarea><br>
  할인 : <textarea name='discount' rows='1' cols='50'></textarea><br>
  <button>등록</button>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
