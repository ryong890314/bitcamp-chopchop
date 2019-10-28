<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>주문 목록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/style.css'>
  <style>

  #content {
    width: 1100px;
    padding-top: 10px;
    margin: auto auto;
  }

  #productBody {
    width: 1100px;
    margin: auto auto;
    text-align: center;
    vertical-align: middle;
  }

  #productList {
    padding: 5px;
    margin: 5px;
    text-align: center;
    float: left;
  }
  </style>

</head>
<body>
  <jsp:include page="../header.jsp"/>
  <div id="orderBody">
    <div class="d-flex align-content-start flex-wrap">
      <table class='table table-hover'>
        <tr>
          <th>주문번호</th>
          <th>결제일</th>
          <th>결제수단</th>
          <th>주문상태</th>
          <th>운송장</th>
        </tr>
        <c:forEach items="${orders}" var="order">
          <c:if test="${loginUser.memberNo eq order.memberNo}">
          <tr>
            <td>${order.orderNo}</td>
            <td>${order.paymentDate}</td>
            <td>${order.paymentMethod}</td>
            <td>${order.shipDate}</td>
            <td>${order.invoice}</td>
          </tr>
          </c:if>
        </c:forEach>
      </table>
    </div>
  </div>
  <jsp:include page="../footer.jsp"/>
</body></html>
