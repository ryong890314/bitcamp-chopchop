<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <form action='add' method='post' enctype='multipart/form-data'>
    상품명: <input type='text' name='title'><br>
    가격: <input type='text' name='price'><br>
    상품상세: <input type='text' name='detail'><br>
    재고: <input type='text' name='stock'><br>
    할인율: <input type='text' name='discount'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    <button>등록</button>
    </form>
  </div>
  <jsp:include page="../footer.jsp"/>
</body>
</html>