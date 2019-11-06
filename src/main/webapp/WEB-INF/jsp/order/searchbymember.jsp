<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>주문 목록</title>
  <link rel='stylesheet' href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/member/style_contact.css">
  <link rel="stylesheet" href="/css/member/style_footer.css">
  <style>

  #orderBody {
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
      <table class='table table-hover' style="text-align:center;">
        <tr>
          <th>주문번호</th>
          <th>상품이름</th>
          <th>옵션번호</th>
          <th>수량</th>
          <th>최종가격</th>
          <th>주문일</th>
          <th>상태</th>
          <th></th>
        </tr>
        <c:forEach items="${orderProducts}" var="orderProduct">
          <tr>
            <td>${orderProduct.orderNo}</td>
            <td>${orderProduct.product.title}</td>
            <td>${orderProduct.optionNo}</td>
            <td>${orderProduct.quantity}</td>
            <td>${orderProduct.discountPrice}원</td>
            <td>${orderProduct.order.paymentDate}</td>
            <td>${orderProduct.order.shipDate}</td>
            <td>
              <button id="cancelBtn" onclick="location.href='delete?no=${orderProduct.orderNo}'">취소</button>
              <button id="updateBtn" onclick="location.href='updateform?no=${orderProduct.order.orderNo}'">변경</button>
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
  </div>
  <jsp:include page="../footer.jsp"/>
  <script>
    "use strict"
    $('#updateBtn').on('click', function( {
      
      
    }))
  </script>
  
</body>
</html>

























