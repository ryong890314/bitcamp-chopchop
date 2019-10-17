<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>게시물 보기</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>
    
<div id='content'>
<h1>상품상세</h1>
<form action='update' method='post'>
번호 : <input type='text' name='no' value='${product.no}' readonly><br>
타이틀 : <input type='text' name='title' value='${product.title}' rows='1' cols='50'><br>
가격 : <input type='text' name='price' value='${product.price}' rows='1' cols='50'><br>
내용 : <input type='text' name='detail' value='${product.detail}' rows='5' cols='50'><br>
재고 : <input type='text' name='stock' value='${product.stock}' rows='1' cols='50'><br>
할인 : <input type='text' name='discount' value='${product.discount}' rows='1' cols='50'><br>
<button>변경</button>
<a href='delete?no=${product.no}'>삭제</a>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
