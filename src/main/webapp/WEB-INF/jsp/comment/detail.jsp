<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<title>상품문의</title>
<link rel='stylesheet'
  href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
  integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
  crossorigin='anonymous'>
<link rel='stylesheet' href='/css/common.css'>
</head>
<body>
  <div id='content'>
    <h6>상품문의</h6>
    <table class='table table-hover'>
      <tr>
        <th>상품번호</th>
        <th>회원번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성일</th>
      </tr>
      <c:forEach items="${comments}" var="comment">
        <tr>
          <td>${comment.commentNo}</td>
          <td>${comment.memberNo}</td>
          <td>${comment.title}</td>
          <td>${comment.content}</td>
          <td>${comment.createdDate}</td>
          <td>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>