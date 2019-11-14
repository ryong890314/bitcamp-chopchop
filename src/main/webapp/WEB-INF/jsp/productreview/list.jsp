<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
  <title>상품후기</title>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <link rel='stylesheet' href='/css/common/bootstrap.min.css'>
</head>

<body>
  <div id='productReview'>
    <table class='table table-hover'>
      <tr>
        <th>상품후기번호</th>
        <th>상품번호</th>
        <th>작성자</th>
        <th>사진</th>
        <th>내용</th>
        <th>평점</th>
        <th>등록일</th>
      </tr>
      <c:forEach items="${productReviews}" var="productReview">
        <tr>
          <td>${productReview.productReviewNo}</td>
          <td>${productReview.productNo}</td>
          <td>${productReview.memberNo}</td>
          <td style=><img src='/upload/productreview/${productReview.filePath}' style="width: 100px; height: 100px; object-fit: cover"></td>
          <td>${productReview.content}</td>
          <td>${productReview.rating}</td>
          <td>${productReview.createdDate}</td>
        </tr>
      </c:forEach>
    </table>
  </div>

</body>

</html>