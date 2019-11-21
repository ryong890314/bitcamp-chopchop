<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
  <link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
  <title>주문 목록</title>

  <style>
   #orderBody { 
     width: 1100px; 
   } 

/*   #productBody { */
/*     width: 1100px; */
/*     margin: auto auto; */
/*     text-align: center; */
/*     vertical-align: middle; */
/*   } */

/*   #productList { */
/*     padding: 5px; */
/*     margin: 5px; */
/*     text-align: center; */
/*     float: left; */
/*   } */
  
  
  #orderBody {
    width:1100px;
    margin-left:auto;
    margin-right:auto;
  }
  
  .mInfo {
    border-bottom: 2px solid #404040;
  }
  
  .mypage-tagA {
    font-size: inherit;
    color:#404040;
  }
  
  .recipe-h3 {
  font-family: 'Oswald' !important;
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}

.rInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
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
  <div class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
      <h3 class="recipe-h3">My Order</h3>
       <span class="rInfo-span">
       <a href="/app/member/myprofile" class="mypage-tagA">My Page</a>&nbsp>&nbspMy Order</span> 
    </div>
    <div class="d-flex align-content-start flex-wrap">
      <table class='table table-hover' style="text-align:center;">
        <tr>
          <th>상품이름</th>
          <th>옵션번호</th>
          <th>수량</th>
          <th>최종가격</th>
          <th>주문일</th>
          <th>상태</th>
        </tr>
        <c:forEach items="${orderProducts2}" var="orderProduct">
          <tr>
            <td>${orderProduct.product.title}</td>
            <td>${orderProduct.optionNo}</td>
            <td>${orderProduct.quantity}</td>
            <td>${orderProduct.discountPrice}원</td>
            <td>${orderProduct.order.paymentDate}</td>
            <td><span class="ship-status">${orderProduct.order.shipStatus}</span></td>
            <td>
              <button id="cancelBtn" onclick="location.href='delete?no=${orderProduct.orderNo}'">취소</button>
              <button id="updateBtn" onclick="location.href='updateform?no=${orderProduct.order.orderNo}'">변경</button>
              <button type="button" class="reviewBtn" style="display:none;" data-toggle="modal" data-target=".bd-example-modal-lg">후기작성</button>
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
  </div>
  
  <div class="modal fade bd-example-modal-lg" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">상품후기 등록</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
  
          <form action='../productreview/add' enctype='multipart/form-data' method='post'>
            <input type='text' name='productNo' id='productNo' value='${orderProduct.product.productNo}'><br>
            <div class="row">
                  <div class="col-md-4">
                    <div>
              <input type="hidden" id="photo" value="${productReview.filePath}" />
              <img id="imgThumb" class="imgThumb" style="width: 250px; height: 250px; object-fit: cover">
            </div>
              <input type='file' id='fileupload' name='file' /><br>
            </div>
            <div class="col-md-8">
            <select class="custom-select" name='rating'>
                <option selected value="5">★★★★★ [아주좋아요]</option>
                <option value="4">★★★★☆ [맘에들어요]</option>
                <option value="3">★★★☆☆ [보통이에요]</option>
                <option value="2">★★☆☆☆ [그냥그래요]</option>
                <option value="1">★☆☆☆☆ [별로에요]</option>
              </select>
              <hr>
              <textarea class="form-control" id="message-text" name="content" style="overflow:auto; height: 200px; resize: none;"></textarea>
          </div>
        </div>
          <hr>
          <div style="text-align: right;">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
              <button type="submit" class="btn btn-primary">등록하기</button>
            </div>
          </form>
  
        </div>
      </div>
    </div>
  </div>
  
  
    
  <jsp:include page="../footer.jsp"/>
  
  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  
  <script>
  $('#myAddModal').on('show.bs.modal', function (e) {
    formLoad();
  })

  
  
    var shipStatus=$('.ship-status');
    var reviewButton=$('.reviewBtn');
    for (var i=0; i<shipStatus.length; i++) {
      if (shipStatus[i].innerText == 1) {
        shipStatus[i].innerText="입금 전";
      } else if (shipStatus[i].innerText == 2) {
        shipStatus[i].innerText="입금 확인";
      } else if (shipStatus[i].innerText == 3) {
        shipStatus[i].innerText="발송";
      } else if (shipStatus[i].innerText == 4) {
        shipStatus[i].innerText="구매확정";
      }
    }
    
    for (var  i=0; i<shipStatus.length; i++) {
      if (shipStatus[i].innerText == '구매확정') {
        reviewButton[i].setAttribute('style', 'inline');
      } 
    }
    
    function formLoad() {
      if ($("#photo").val() == null || $("#photo").val() == "") {
        $("#imgThumb").attr("src", "/upload/productreview/info_photo.jpg");
      } else {
        $("#imgThumb").attr("src", "/upload/productreview/" + $("#photo").val());
      }
    }

    document.getElementById("fileupload").onchange = function () {
      var reader = new FileReader();
      reader.onload = function (e) {
        document.getElementById("imgThumb").src = e.target.result;
      };
      reader.readAsDataURL(this.files[0]);
    };

  </script>
  
</body>



</html>

























