<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>주문 조회</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/style.css'>
  <style>

  #admin-content {
    width: 1100px;
    padding-top: 10px;
    margin: 0 auto;
  }

  #productBody {
    width: 1100px;
    margin: 0 auto;
    text-align: center;
    vertical-align: middle;
  }

  #productList {
    padding: 5px;
    margin: 5px;
    text-align: center;
    float: left;
  }

.oInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.admin-tagA {
  font-size: inherit;
  color:#404040;
}
  
.oInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.o-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 18px;
}

.order-h3 {
/*   font-family: 'Oswald' !important; */
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}

.tableList {
  text-align: center;
}
  </style>

</head>

<jsp:include page="../header.jsp"/>
<%-- <jsp:include page="admin_sidebar.jsp"/> --%>
<body>
  
  
<div id="admin-content">
<div class="d-flex justify-content-between align-items-center py-0 mb-3 oInfo">
      <h3 class="order-h3">주문 목록</h3>
      <span class="oInfo-span"> 
<!--       <a href="/app/member/myprofile" class="admin-tagA"> -->
      관리자페이지</a>&nbsp>&nbsp전체주문목록
      </span>
    </div>
  <div class="d-flex align-content-start flex-wrap">
      <table class='table table-hover tableList'>
      <tr>
        <th>주문번호</th>
        <th>회원이름</th>
        <th>우편번호</th>
        <th>기본주소</th>
        <th>상세주소</th>
        <th>결제일</th>
        <th>결제수단</th>
        <th>주문상태</th>
        <th>운송장</th>
      </tr>
<c:forEach items="${orders}" var="order">
<tr>
  <td>${order.orderNo}</td>
  <td>${order.memberNo}</td>
  <td>${order.postNo}</td>
  <td>${order.baseAddress}</td>
  <td>${order.detailAddress}</td>
  <td>${order.paymentDate}</td>
  <td>${order.paymentMethod}</td>
  <td>${order.shipStatus}</td>
  <td>${order.invoice}</td>
</tr>
</c:forEach>
</table>
</div>
</div>
<c:forEach items="${order.members}" var="member">
  ${member.nickname}<br>
  ${member.email}<br>
</c:forEach>
<jsp:include page="../footer.jsp"/>

</body></html>
