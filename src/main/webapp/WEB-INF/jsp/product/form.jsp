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
      상품상세: <textarea name='detail'></textarea><br>
      재고: <input type='text' name='stock'><br>
      할인율: <input type='text' name='discount'><br>
      상품분류: <select name='category'>
        <option id='category1' value='식품'>식품</option>
        <option id='category2' value='훈련'>훈련/장난감</option>
        <option id='category3' value='식기'>식기/집/이동장</option>
        <option id='category4' value='목욕'>목욕/미용/위생</option>
      </select><br>
      동물분류: <select name='species'>
        <option id='1' value='강아지'>강아지</option>
        <option id='2' value='고양이'>고양이</option>
        <option id='3' value='새'>새</option>
        <option id='4' value='물고기'>물고기</option>
        <option id='5' value='작은'>작은 동물</option>
        <option id='6' value='파충류'>파충류</option>
      </select><br>
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