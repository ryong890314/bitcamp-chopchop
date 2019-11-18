<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
  <title>주문 성공</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel="stylesheet" href="/css/member/style_contact.css">
  <link rel="stylesheet" href="/css/member/style_footer.css">
  
</head>
<body>
  <jsp:include page="../header.jsp"/>
    제품<br>${product.title}<br>
    가격<br>${product.price}원<br>
    회원 번호<br>${loginUser.memberNo}<br>
    이름<br>${order.name}<br>
    이메일<br>${loginUser.email}<br>
    연락처<br>${order.tel}<br>
    우편번호<br>${order.postNo}<br>
    기본주소<br>${order.baseAddress}<br>
    상세주소<br>${order.detailAddress}<br>
    결제수단<br>${order.paymentMethod}<br><br><hr>
    관리자<br>
    입금일<br>${order.paymentDate}<br>
    주문상태<br>${order.shipDate}<br>
  <jsp:include page="../footer.jsp"/>
</body>
</html>