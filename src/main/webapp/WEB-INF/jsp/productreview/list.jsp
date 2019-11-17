<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<style>
  .txt_post {
    font-size: 16px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 4;
    /* 라인수 */
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    line-height: 1.5em;
    height: 6.0em;
    /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
  }

  #myModal {
    top: 50%;
    margin-top: -325px;
  }
</style>

<body>

  <div>
    <h4 class="mb-50">상품 후기</h4>

    <div class="row">
      <div class="col-md-5">
        <c:set var="total" value="0" />
        <c:forEach items="${productReviews}" var="productReview" varStatus="status">
          <input type="hidden" value="${productReview.rating}" />
          <input type="hidden" value="${status.count}" />
          <c:set var="count" value="${status.count}" />
          <c:set var="total" value="${total + productReview.rating}" />
          <c:set var="avg" value="${total / count}" />
        </c:forEach>
        <p
          style="color:red; margin-bottom: 25; font-size: 25px; font-weight: 5000px; vertical-align: middle; text-align: right;">
          <c:if test="${avg >= 0 && avg < 1}">☆☆☆☆☆</c:if>
          <c:if test="${avg >= 1 && avg < 2}">★☆☆☆☆</c:if>
          <c:if test="${avg >= 2 && avg < 3}">★★☆☆☆</c:if>
          <c:if test="${avg >= 3 && avg < 4}">★★★☆☆</c:if>
          <c:if test="${avg >= 4 && avg < 5}">★★★★☆</c:if>
          <c:if test="${avg == 5}">★★★★★</c:if>
        </p>
      </div>
      <div class="col-md-1">
        <p style="color:red; margin-bottom: 25; font-size: 25px; font-weight: 5000px; vertical-align: middle;">
          ${Math.round(avg*10)/10}
        </p>
      </div>
      <div class="col-md-1">
        <p style="color:gray; margin-bottom: 25; font-size: 25px; font-weight: 5000px; vertical-align: middle;">│</p>
      </div>
      <div class="col-md-5">
        <p style="color:black; margin-bottom: 25; font-size: 25px; font-weight: 5000px; vertical-align: middle;">
          ${count} REVIEWS
        </p>
      </div>
    </div>
    <table class='table table-hover'>
      <tr style="text-align: center;">
        <th style="width: 130px">사진</th>
        <th>내용</th>
        <th style="width: 150px">작성자</th>
        <th style="width: 150px">평점</th>
        <th style="width: 150px">등록일</th>
      </tr>
      <c:forEach items="${productReviews}" var="productReview">
        <tr class="tempTr" style="text-align: center;" data-toggle="modal" data-target="#myModal">
          <td style="width: 100px; height: 100px; object-fit: cover"><img src='/upload/productreview/${productReview.filePath}'></td>
          <td style="text-align: left"><span class="txt_post">${productReview.content}</span></td>
          <td>${productReview.memberNo}</td>
          <td style='color: red;' value='${productReview.rating}'>
            <c:if test="${productReview.rating == 1}">★☆☆☆☆</c:if>
            <c:if test="${productReview.rating == 2}">★★☆☆☆</c:if>
            <c:if test="${productReview.rating == 3}">★★★☆☆</c:if>
            <c:if test="${productReview.rating == 4}">★★★★☆</c:if>
            <c:if test="${productReview.rating == 5}">★★★★★</c:if>
          </td>
          <td>${productReview.createdDate}
          </td>
        </tr>
      </c:forEach>
    </table>
    
  </div>

  <!-- Modal -->

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">상품 후기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
              <div class="col-md-8">
                <span id="tempImg" style="width: 500px; height: 500px; object-fit: cover">이미지</span>
              </div>
              <div class="col-md-4" style="padding-left: 0px;">
                <div style="height: 67px; text-align: center;">
                  <div style='color: red; font-size: 25px;'>
                  <span id="tempStar">별점</span>
                  </div>
                  <span id="tempId">아이디</span>
                  <span id="tempDate">날짜</span>
                </div>
                <hr>
                <div style="overflow:auto; height: 400px;">
                  <span id="tempCont">내용</span>
                </div>
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>

 $(document).on("click", ".tempTr", function () {
   tempImg.innerHTML = $(this)[0].cells[0].innerHTML;
   tempCont.innerText = $(this)[0].cells[1].innerText;
   tempId.innerText = $(this)[0].cells[2].innerText;
   tempStar.innerText = $(this)[0].cells[3].innerText;
   tempDate.innerText = $(this)[0].cells[4].innerText;
});

  </script>

</body>

</html>