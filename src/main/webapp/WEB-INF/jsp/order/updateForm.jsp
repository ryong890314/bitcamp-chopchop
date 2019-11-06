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
<%--   <jsp:include page="../header.jsp"/> --%>
<!--   <div id="orderBody"> -->
<!--     <div class="d-flex align-content-start flex-wrap"> -->
<!--       <table class='table table-hover' style="text-align:center;"> -->
<!--         <tr> -->
<!--           <th>기본주소</th> -->
<!--           <th>상세주소</th> -->
<!--           <th>연락처</th> -->
<!--           <th></th> -->
<!--         </tr> -->
<!--           <tr> -->
<%--             <td><input type='text' name='baseAddress' value='${orderProduct.order.baseAddress}'></td> --%>
<%--             <td><input type='text' name='detailAddress' value='${orderProduct.order.detailAddress}'></td> --%>
<%--             <td><input type='text' name='tel' value='${member.tel}'></td> --%>
<%--             <td><button id="cancelBtn" onclick="location.href='delete?no=${orderProduct.orderNo}'">취소</button></td> --%>
<!--           </tr> -->
<!--       </table> -->
<!--     </div> -->
<!--   </div> -->
<%--   <jsp:include page="../footer.jsp"/> --%>
  
</body>
</html>

























