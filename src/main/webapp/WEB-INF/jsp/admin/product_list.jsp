<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <title>상품 목록</title>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <style>

#admin-content {
  width: 1100px;
  margin: 0 auto;
}

.pInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.admin-tagA {
  font-size: inherit;
  color:#404040;
}
  
.pInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.product-h3 {
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
<body>

<jsp:include page="../header.jsp"/>


  <div id="admin-content">
    <div class="d-flex justify-content-between align-items-center py-0 mb-3 pInfo">
      <h3 class="product-h3">상품 목록</h3>
      <span class="pInfo-span"> 
<!--         <a href="/app/member/myprofile" class="admin-tagA"> -->
        관리자페이지</a>&nbsp;>&nbsp;전체상품목록
      </span>
    </div>
    
    <div>
      <div style="margin-bottom: 5px;float: left;">
        <button type='button' class="btn btn-secondary btn-sm"
          onclick='check_all();'>모두 선택</button>
        <button type='button' class="btn btn-secondary btn-sm"
          onclick='uncheck_all();'>모두 해제</button>
      </div>
      <div style="float: right;" >
        <select name='productCategory'>
            <option value="" selected="selected">전체</option>
            <option value="">강아지</option>
            <option value="">고양이</option>
            <option value="">작은친구들</option>
          </select>
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/app/product/form'">상품등록</button>
      </div>
    </div>
    
    <table class='table table-hover tableList'>
      <tr>
        <th>선택</th>
        <th>상품번호</th>
        <th>상품명</th>
        <th>상품금액</th>
        <th>할인율</th>
        <th>할인적용금액</th>
        <th>조회수</th>
      </tr>
      <c:forEach items="${products}" var="product">
        <tr>
        <td class="check-td">
          <input class="myChkbox" type="checkbox" name="chkbox" value="${product.productNo}">
        </td>
          <td>${product.productNo}</td>
          <td><a href='/app/product/detail?no=${product.productNo}' target="_blank" class="r-tagA">
          <div>
                <p style="float: left;">
                <img src="/upload/product/${product.files[0].filePath}" style="width: 100px; margin-right: 22px;"></p>
                <div>
                  <p class="review-tagP">${product.title}</p>
                </div>
              </div></a><br>
          </td>
          <td>
            <span style=" text-decoration:line-through">
            <fmt:formatNumber value="${product.price}" pattern="#,###" /> 원</span>
          </td>
          <td>${product.discount}</td>
          <td><span>
            <span id='product-price'><fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="#,###" /></span>
            원</span>
            </td>
          <td>${product.viewCount}</td>
        </tr>
      </c:forEach>
    </table>
    
  </div>


<jsp:include page="../footer.jsp"/>

<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="../js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="../js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="../js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="../js/active.js"></script>

 <script>
      myCheckBoxes = document.getElementsByClassName('myChkbox');
      function check_all() {
        for (i = 0; i < myCheckBoxes.length; i++) {
          myCheckBoxes[i].checked = true;
        }
      }
      function uncheck_all() {
        for (i = 0; i < myCheckBoxes.length; i++) {
          myCheckBoxes[i].checked = false;
        }
      }
    </script>
</body>
</html>
