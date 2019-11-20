<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>

<head>
  <title>주문 성공</title>
  <style>
    #resultForm {
      width: 1100px;
      display: table;
      margin-left: auto;
      margin-right: auto;
    }
  </style>
</head>

<body>
  <jsp:include page="../header.jsp" />


  <div class="jumbotron" id="resultForm" style="padding-bottom: 20px;">
    <h1 class="display-4">고객님 주문이 완료되었습니다!</h1>
    <p class="lead">주문내역 및 배송에 관한 안내는 주문조회를 통하여 확인 가능합니다.</p>
    <hr class="my-4">
    <label>배송지 정보</label>
    <div class="row">
      <div class="col-md-6">
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" style="width: 100px;">이름</span>
          </div>
          <input type="text" class="form-control" value="${order.name}" readonly>
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" style="width: 100px;">기본주소</span>
          </div>
          <input type="text" class="form-control" value="${order.baseAddress}" readonly>
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" style="width: 100px; ">상세주소</span>
          </div>
          <input type="text" class="form-control" value="${order.detailAddress}" readonly>
        </div>
      </div>

      <div class="col-md-6">
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" style="width: 100px; ">연락처</span>
          </div>
          <input type="text" class="form-control" value="${order.tel}" readonly>
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" style="width: 100px; ">우편번호</span>
          </div>
          <input type="text" class="form-control" value="${order.postNo}" readonly>
        </div>
      </div>
    </div>

    <label>결제 정보</label>
    <div class="row">
      <div class="col-md-6">
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" style="width: 100px; ">결제수단</span>
          </div>
          <input type="text" class="form-control" value="${order.paymentMethod}" readonly>
        </div>
      </div>
    </div>

    <hr class="my-4">

    <div style="float: right;">
    <a class="btn btn-danger" href="/app/order/searchbymember" role="button">주문조회</a>
    <a class="btn btn-secondary" href="/app/product/list" role="button">쇼핑계속하기</a>
  </div>

  </div>

  <jsp:include page="../footer.jsp" />
</body>

</html>