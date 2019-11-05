<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
  <title>주문 폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
  <link rel="stylesheet" href="/css/style_contact.css">
  <link rel="stylesheet" href="/css/style_footer.css">
  
</head>
<body>
  <jsp:include page="../header.jsp"/>
<!--   <div id='content'> -->
<!--     <h1>주문 폼</h1> -->
<!--     <form action='add' method='post' enctype='multipart/form-data'> -->
<!--       상품명: <input type='text' name='title'><br> -->
<%--       상품명: <input type='text' name='quantity' readonly>${quantity}개<br> --%>
<!--       가격: <input type='text' name='price'><br> -->
<!--       상품상세: <textarea name='detail'></textarea><br> -->
<!--       재고: <input type='text' name='stock'><br> -->
<!--       할인율: <input type='text' name='discount'><br> -->
<!--       <button>등록</button> -->
<!--     </form> -->
<!--   </div> -->
  
  ${product2.productNo}<br>
  ${product2.title}<br>
  ${product2.detail}<br>
  ${product2.price}<br>
  ${product2.stock}<br>
  ${product2.discount}<br>
  
  <jsp:include page="../footer.jsp"/>
</body>
</html>