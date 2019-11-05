<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Insert title here</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>
<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>CHOPCHOP 문의게시판</h1>
<a href='form'>문의하기</a><br>
<table class='table table-hover'>
<tr>
  <th>NO</th>
  <th>제목</th>
  <th>작성자</th>
  <th>등록일</th>
</tr>
<c:forEach items="${questions}" var="question">
  <tr>
    <td>${question.no}</td>
    <td><a href='detail?no=${question.no}'>${question.title}</a></td>
    <td>${question.email}</td>
    <td>${question.enterDate}</td>
  </tr>
</c:forEach>
</table>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>