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
  <form method="post">
  <h1>상품 상세</h1>
    번호 : ${product.productNo}<br>
    상품명 ${product.title}<br>
    가격 : ${product.price}<br>
    상품상세: ${product.detail}<br>
    재고: ${product.stock}<br>
    할인율: ${product.discount}<br>
    <p>
      <c:forEach items="${product.files}" var="file">
        <img src='/upload/product/${file.filePath}' class='photo2' >
      </c:forEach>
    </p>
    <a href='updateform?no=${product.productNo}'>수정</a>
    </form>
  </div>
    <jsp:include page="../footer.jsp"/>
</body>
</html>