<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>    
<html>
<head>
  <title>상품 상세</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' 
    integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>
  <jsp:include page="../header.jsp"/>
  <div id='content'>
  <h1>상품 상세</h1>
  <form action='update' method='post' enctype='multipart/form-data'>
    번호 : <input type='text' name='productNo' value='${product.productNo}' readonly><br>
    상품명 : <input type='text' name='title' value='${product.title}'><br>
    가격 : <input type='text' name='price' value='${product.price}'><br>
    상품상세: <input type='text' name='detail' value='${product.detail}'><br>
    재고: <input type='text' name='stock' value='${product.stock}'><br>
    할인율: <input type='text' name='discount' value='${product.discount}'><br>
    <p>
      <c:forEach items="${product.files}" var="file">
        <img src='/upload/product/${file.filePath}' class='photo2' >
      </c:forEach>
    </p>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    사진: <input type='file' name='filePath'><br>
    <button>변경</button>
    <a href='delete?no=${product.productNo}'>삭제</a>
  </form>
  </div>
    <jsp:include page="../footer.jsp"/>
</body>
</html>