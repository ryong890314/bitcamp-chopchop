<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
<title>My Review</title>

<style>
#orderBody {
  width: 1100px;
}

.rInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.mypage-tagA {
  font-size: inherit;
  color:#404040;
}
  
.rInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.review-tr, .tr-test {
  text-align: center;
}

.review-tagP {
  text-align: left;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 320px;
  display: block;
}

.r-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 20px;
  font-weight: 600;
}

.recipe-h3 {
  font-family: 'Oswald' !important;
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}

span {
  color: #404040;
  font-size: 15px;
  line-height: 2;
  font-weight: 400;
}
</style>

</head>
<!-- mypage_sidebar start-->
<!-- Font Awesome -->
<link rel="stylesheet"
  href="/js/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
  href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- mypage_sidebar  end -->
<jsp:include page="../header.jsp" />
  <jsp:include page="../member/mypage_sidebar.jsp" />
<body>
  <div id="orderBody" style="margin: 0 auto; margin-bottom: 200px;">
    <div
      class="d-flex justify-content-between align-items-center py-0 mb-3 rInfo">
      <h3 class="recipe-h3">All Review</h3>
      <span class="mInfo-span">관리자페이지&nbsp;>&nbsp;전체리뷰목록</span>
    </div>
    <table class='table table-hover'>
      <tr class="review-tr">
        <th style="width: 70px">번호</th>
        <th style="width: 270px">상품명</th>
        <th>내용</th>
        <th style="width: 140px">평점</th>
        <th style="width: 140px">작성일</th>
      </tr>
      <c:forEach items="${productReviews}" var="productReview" varStatus="status">
        <tr class="tempTr" style="text-align: center;" data-toggle="modal" data-target="#myModal">
          <tr class="tr-test">
            <td><div style="vertical-align: middle;">${status.count}</div></td>
            <td>
              <div>
                <a href="/app/product/detail?no=${productReview.products[0].productNo}" target="_blank" class="r-tagA"> 
                ${productReview.products[0].title}</a><br>
                <c:if test="${not empty productReview.options[0].title}">
                  <span style="color:#7a7a7a;">[옵션] ${productReview.options[0].title}</span>
                </c:if>
              </div>
            </td>
            
            <td>
              <div>
                <p style="float: left;">
                <img src="/upload/productreview/${productReview.filePath}" style="width: 100px; margin-right: 22px;"></p>
                <div>
                  <p class="review-tagP">
                    ${productReview.content}</p>
                </div>
              </div>
            </td>
            
            
            <td style="color: red;">
              <c:if test="${productReview.rating == 1}">★☆☆☆☆</c:if> 
              <c:if test="${productReview.rating == 2}">★★☆☆☆</c:if> 
              <c:if test="${productReview.rating == 3}">★★★☆☆</c:if> 
              <c:if test="${productReview.rating == 4}">★★★★☆</c:if> 
              <c:if test="${productReview.rating == 5}">★★★★★</c:if>
            </td>
            <td>${productReview.createdDate}</td>
          </tr>
        </tr>
      </c:forEach>
    </table>
  </div>


  <jsp:include page="../footer.jsp" />

  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>

  
</body>
</html>

























