<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>주문 목록</title>

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

    table {
      text-align: center;
    }
  </style>

</head>

<body>


  <jsp:include page="../header.jsp" />


  <div id="orderBody">
    <div class="d-flex align-content-start flex-wrap">
      <table class='table table-hover'>
        <tr>
          <th>주문번호</th>
          <th>결제일</th>
          <th>회원이름</th>
          <th>결제수단</th>
          <th>주문상태</th>
          <th>비고</th>
        </tr>
        <c:forEach items="${orders}" var="order">
          <tr>
            <td>${order.orderNo}</td>
            <td>${order.paymentDate}</td>
            <c:forEach items="${order.members}" var="member">
              <td>${member.nickname}</td>
            </c:forEach>
            <td>${order.paymentMethod}</td>
            <td class="ship-status">${order.shipStatus}</td>
            <td>

              <button type="button" class="btn btn-primary" data-toggle="modal"
                data-target=".bd-example-modal-lg">상세보기</button>
              
              </td>

            </tr>
        </c:forEach>
      </table>
    </div>
  </div>


  <div class="modal fade bd-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">주문상세</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div id="tempTable"></div>
          <!-- 여기에 뿌릴꺼 -->

        </div>
      </div>
    </div>
  </div>

  <jsp:include page="../footer.jsp" />

  <script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>

  <script>

    $(document).on("click", ".btn-primary", function () {

      console.log($(this)[0].parentElement.parentElement.cells[0].textContent);
      var tempOrderNo = $(this)[0].parentElement.parentElement.cells[0].textContent;
      
    })

      $('#myModal').on('show.bs.modal', function (e) {
        $('#tempTable').text("");

        $('#tempTable').append($('#t1').html());

    });

  </script>

<script id="t1" type="tableHtml">
<form action='/order/update' enctype='multipart/form-data' method='post'>
  <div class="row">
    <c:forEach items="${orders}" var="order">
        <c:forEach items="${order.members}" var="member">
          <c:if test="${order.orderNo == '11'}">
    <div class="col-md-2">
      <span>이름</span><br>
      <span>전화번호</span><br>
      <span>우편번호</span><br>
      <span>기본주소</span><br>
      <span>상세주소</span><br>
      <span>주문상태</span><br>
    </div>
    <div class="col-md-10">
      <span>${member.nickname}</span>  <br>
      <span>${order.tel}</span>  <br>
      <span>${order.postNo}</span>  <br>
      <span>${order.baseAddress} </span><br>
      <span>${order.detailAddress} </span> <br>
      <span class="ship-status">${order.shipStatus} </span> <br>
    </div>
  </c:if>
  </c:forEach>
  </c:forEach>
  </div>

  <hr>
  <div style="overflow:auto; height: 250px;">

    <table class='table table-hover'>
      <tr>
        <th>주문상품번호</th>
        <th>상품명</th>
        <th>옵션</th>
        <th>수량</th>
        <th>상품가격</th>
      </tr>
      <c:forEach items="${orders}" var="order">
        <c:forEach items="${order.orderProducts}" var="orderProduct">
            <c:if test="${order.orderNo == '11'}">
          <tr>
            <td>${orderProduct.orderProductNo}</td>
            <td>${orderProduct.productNo}</td>
            <td>${orderProduct.optionNo}</td>
            <td>${orderProduct.quantity}</td>
            <td>${orderProduct.discountPrice}</td>
          </tr>
          </c:if>
        </c:forEach>
      </c:forEach>
    </table>

  </div>

  <hr>

  <div style="text-align: right;">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
    <button type="submit" class="btn btn-primary">적용</button>
  </div>
</form>
</script>

  <script>
    function changeStatus() {
      var shipStatus = $('.ship-status');
      for (var i = 0; i < shipStatus.length; i++) {
        if (shipStatus[i].innerText == 1) {
          shipStatus[i].innerText = "입금 전";
        } else if (shipStatus[i].innerText == 2) {
          shipStatus[i].innerText = "입금 확인";
        } else if (shipStatus[i].innerText == 3) {
          shipStatus[i].innerText = "발송";
        } else if (shipStatus[i].innerText == 4) {
          shipStatus[i].innerText = "구매확정";
        }
      }
    }

    changeStatus();

  </script>
</body>

</html>