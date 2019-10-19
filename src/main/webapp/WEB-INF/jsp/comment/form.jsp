<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
  <title>상품 등록폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>
  <div id='content'>
    <h1>상품 등록폼</h1>
    <form action='add' method='post'>
      상품번호: <input type='text' name=productNo value=1 readonly/><br>
      제목: <input type='text' name='title'/><br>
      내용: <input type='text' name='content'/><br>
      <input type='hidden' name='memberNo' value=1 readonly><br>
      <button>등록</button>
    </form>
  </div>
</body>
</html>