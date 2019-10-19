<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="bitcamp.chopchop.domain.PhotoFile"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<title>상품 목록</title>
<link rel='stylesheet'
  href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
  integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
  crossorigin='anonymous'>
<link rel='stylesheet' href='/css/common.css'>
</head>
<body>
  <div id='content'>
    <h1>상품 목록</h1>
    <a href='form'>상품 등록</a><br>
    <table class='table table-hover'>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성자</th>
      </tr>
      <c:forEach items="${comments}" var="comment">
        <tr>
          <td>${comment.commentNo}</td>
          <td>${comment.title}</td>
          <td>${comment.content}</td>
          <td>
<%--             <c:set var="member" property='${member}'></c:set> --%>
<%--             ${member.nickname} --%>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>