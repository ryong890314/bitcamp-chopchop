<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>주문 목록</title>
<!--   <link rel='stylesheet' href="/node_modules/bootstrap/dist/css/bootstrap.min.css"> -->
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
  
  .mInfo {
    border-bottom: 2px solid #404040;
  }
  
  .sInfo-font {
    font-family: 'Sunflower', sans-serif;
  }
  
  .mypage-tagA {
    font-size: inherit;
    color:#404040;
  }
  </style>

</head>
<body>
  <jsp:include page="../header.jsp"/>
  <jsp:include page="../member/mypage_sidebar.jsp" />
  <div id="orderBody">
  <div class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
      <h3>My Order</h3>
       <span style="float: right;font-size: 14px;">
       <a href="/app/member/myprofile" class="mypage-tagA">My Page</a>&nbsp>&nbspMy Order</a></span> 
    </div>
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
        <c:forEach items="${orderProducts2}" var="orderProduct">
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
</body>
</html>

























