<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>장바구니</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>

<body>

  <div id='cart'>
    <h1>장바구니</h1>
    <table class='table table-hover'>
      <tr>
        <th>선택</th>
        <th>상품사진</th>
        <th>상품정보</th>
        <th>등록일</th>
        <th>판매가</th>
        <th>수량</th>
        <th>삭제</th>
    
      </tr>
      <c:forEach items="${carts}" var="cart">
        <tr>
          <td>
            <form>
              <input type="checkbox" name="lecture" value="html"><br>
            </form>
          </td>
          <td>
            <c:forEach items="${cart.files}" var="file" end="0">
              <img src='/upload/product/${file.filePath}' style="width: 100px; height: 100px;">
            </c:forEach>
          </td>
          <c:forEach items="${cart.products}" var="product">
            <td>${product.title}</td>
          </c:forEach>
          <td>${cart.createdDate}</td>
          <c:forEach items="${cart.products}" var="product">
            <td><fmt:formatNumber value="${product.price}" pattern="#,###"/></td>
          </c:forEach>
          <td>
            <form action="update" method="POST">
            <div class="input-group input-number-group">
              <input class="input-number" type="number" style="text-align:center" value="${cart.quantity}" min="0" max="1000">
              <button class="btn btn-default pull-right" style="margin-left: 5px; padding: 0px 5px 0px 5px" type="submit">적용</button>
            </div>
            </form>
          </td>
          <td>
            <a href="delete?no=${cart.cartNo}">삭제</a>
          </td>
        </tr>
      </c:forEach>
    </table>

<hr class="my-4">
<div><label class="label"></label>합계금액</label></div>
<hr class="my-4">

<a href='#' class="btn bueno-btn">선택삭제</a>
<a href='#' class="btn bueno-btn">선택구매</a>
<a href='#' class="btn bueno-btn">전체구매</a>

  </div>

</body>

</html>