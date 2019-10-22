<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>상품 수정폼</title>
<link rel='stylesheet'
  href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
  integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
  crossorigin='anonymous'>
<link rel='stylesheet' href='/css/common.css'>
</head>
<body>
  <jsp:include page="../header.jsp" />
  <div id='content'>
    <h1>상품 수정폼</h1>
    <form action='update' method='post' enctype='multipart/form-data'>
      번호: <input type='text' name='productNo' value='${product.productNo}' readonly><br>
      상품명: <input type='text' name='title' value='${product.title}'><br>
      가격: <input type='text' name='price' value='${product.price}'><br>
      상품상세: <input type='text' name='detail' value='${product.detail}'><br>
      재고: <input type='text' name='stock' value='${product.stock}'><br>
      할인율: <input type='text' name='discount' value='${product.discount}'><br>
      상품분류: <select name='category'>
        <option id='category1' value='food'>식품</option>
        <option id='category2' value='train'>훈련/장난감</option>
        <option id='category3' value='house'>식기/집/이동장</option>
        <option id='category4' value='sanitary'>목욕/미용/위생</option>
      </select><br>
      동물분류: <select name='species'>
        <option id='1' value='dog'>강아지</option>
        <option id='2' value='cat'>고양이</option>
        <option id='3' value='bird'>새</option>
        <option id='4' value='fish'>물고기</option>
        <option id='5' value='smallAnimal'>작은 동물</option>
        <option id='6' value='reptile'>파충류</option>
      </select><br>
      <c:forEach items="${product.files}" var="file">
        <img src='/upload/product/${file.filePath}' width=200>
      </c:forEach><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      <button>수정</button>
      <a href='delete?no=${product.productNo}'>삭제</a>
    </form>
  </div>
  <jsp:include page="../footer.jsp" />
</body>
</html>  