<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <title>테스트</title>
  <script type="text/JavaScript"
   src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <link rel='stylesheet' href='/css/product/style.css'>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  

</head>
<body>
<div id='productBody'>

    <button type='button' class="btn btn-default btn-sm" onclick='check_all();'>모두 선택</button>
    <button type='button' class="btn btn-default btn-sm" onclick='uncheck_all();'>모두 해제</button>

    <table class='table table-hover'>
      <tr style="text-align: center;">
        <th style="width: 80px">선택</th>
        <th style="width: 130px">상품사진</th>
        <th>상품/옵션정보</th>
        <th style="width: 80px">수량</th>
        <th>상품금액</th>
        <th style="width: 80px">할인율</th>
        <th>할인적용금액</th>
        <th style="width: 100px">배송비</th>
        <th style="width: 50px">주문</th>
    
      </tr>
      <c:forEach items="${carts}" var="cart">
        <tr style="text-align: center;">
          <td>
            <form>
              <input class="myChkbox" type="checkbox" name="chkbox" value="${cart.cartNo}">
            </form>
          </td>
          <td>
            <c:forEach items="${cart.files}" var="file" end="0">
              <img src='/upload/product/${file.filePath}' style="width: 100px; height: 100px;">
            </c:forEach>
          </td>
          <td style="text-align: left">
            <c:forEach items="${cart.products}" var="product">
              ${product.title}<br>
            </c:forEach>
              <hr>
              <c:forEach items="${cart.options}" var="productOption">
              ${productOption.title}<br>
              ${productOption.price}
            </c:forEach>
            </td>
          <td>



            <!-- <form action="update" method="POST">
            <div class="input-group input-number-group">
              <input class="input-number" name="quantity" type="number" style="text-align:center; width: 80px;" value="${cart.quantity}" min="0" max="1000">
              <input type="hidden" name="cartNo" value="${cart.cartNo}">
              <button class="btn btn-default btn-sm" style="width:80px">변경</button>
            </div>
            </form> -->


            <form>
                <input class="input-number" name="quantity" type="number" style="text-align:center; width: 80px;" value="${cart.quantity}" min="0" max="1000">
                <input type="hidden" name="cartNo" value="${cart.cartNo}">
              </form>
              <input type="button" id="button_${var.index }" name="button_${var.index }" value="Button">
              <!-- <button class="btn btn-default btn-sm" id="requestBtn" style="width:80px">변경</button> -->


          </td>
          <c:forEach items="${cart.products}" var="product">
            <td><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</td>
          </c:forEach>

          <c:forEach items="${cart.products}" var="product">
              <td>${product.discount}%</td>
            </c:forEach>

            <c:forEach items="${cart.products}" var="product">
                <td>
                    <a style=" text-decoration:line-through"><fmt:formatNumber value="${product.price * cart.quantity}" pattern="#,###"/>원</a><br>
                    <a style="color:red"><fmt:formatNumber value="${product.price * (100 - product.discount) / 100 * cart.quantity}" pattern="#,###"/>원</a><br>
                    <input type="hidden" name="chkprice" value="${product.price * (100 - product.discount) / 100 * cart.quantity}">
                  </td>
              </c:forEach>

              <td>
                <!-- <span class="tempShip" id="tempShipCheckPrice">[기본배송]<br>조건</span> -->
                <span data-toggle="tooltip" data-placement="top" title="주문금액이 50,000원 미만시 배송비 2,500원이 청구됩니다.">[기본배송]<br>조건</span>
              </td>

          <td>
            <button type="button" class="btn btn-default btn-sm">주문</button><br>
            <button type="button" class="btn btn-default btn-sm" onclick="location.href='delete?no=${cart.cartNo}' ">삭제</button>
          </td>
        </tr>
      </c:forEach>
    </table>

    <hr class="my-4">
    
    <div style="text-align: right;">
        <a1>상품금액 </a1><a id="sumCheckPrice">0</a>
        <a1>원 + 배송비 </a1><a id="shipCheckPrice">0</a>
        <a1>원 = 합계금액 </a1><a id="totalCheckPrice" style="color: red">0</a>
        <a1>원</a1>
      </div>
      

    <hr class="my-4">

<div style="text-align: right">
<button class="btn bueno-btn" onclick='check_Del();'>선택삭제</button>
<button href='#' class="btn bueno-btn">선택구매</button>
<button href='#' class="btn bueno-btn">전체구매</button>
</div>

</div>

  <jsp:include page="../footer.jsp"/>

  <!-- 한개만 -->
  <!-- <script>
      $("#requestBtn").click(function() {
        var ajxCartNo = document.getElementsByName("cartNo");
        var ajxQuantity = document.getElementsByName("quantity");
    
          $.ajax({
    
            url:"update",
            type:"post",
            data : "quantity=" + ajxQuantity[0].value + "&cartNo=" + ajxCartNo[0].value,
            success: function(data){
                alert("수량이 변경 되었습니다.");
            },
            error: function() {
                alert("error");
            }
          });
    });
    </script> -->
<!--
    $("input[name^='button']").on("click", function(e) {
      // 동작할 기능
      function($(this));
    });
-->

<!-- 반복문 실패 -->
<script>
   $("input[name^='button']").on("click", function(e) {
    var ajxCartNo = document.getElementsByName("cartNo")[$(this.Number)].value;
    var ajxQuantity = document.getElementsByName("quantity")[$(this.Number)].value;
    
    alert(ajxCartNo + ", " + ajxQuantity)
    
    // for (var i = 0; i < ajxCartNo.length; i++) {
    //   $.ajax({

    //     url:"update",
    //     type:"post",
    //     data : "quantity=" + ajxQuantity[i].value + "&cartNo=" + ajxCartNo[i].value,
    //     success: function(data){
    //         // alert("수량이 변경 되었습니다.");
    //     },
    //     error: function() {
    //         alert("error");
    //     }
    //   });
    // }

});
</script>

  <script>
      var myCheckBoxes = document.getElementsByClassName('myChkbox');
      
      for (var i = 0; i < myCheckBoxes.length; i++) {
        myCheckBoxes[i].addEventListener('change', function () {
          reprice()
        });
      }
    </script>
    
    <script>
      myCheckBoxes = document.getElementsByClassName('myChkbox');
      function check_all() {
        for (i = 0; i < myCheckBoxes.length; i++) {
          myCheckBoxes[i].checked = true;
          reprice()
        }
      }
      function uncheck_all() {
        for (i = 0; i < myCheckBoxes.length; i++) {
          myCheckBoxes[i].checked = false;
          reprice()
        }
      }
    </script>
    
    <script>
      function reprice() {
        // 중복코드 제거용
        var myCheckPrice = document.getElementsByName('chkprice');
        var myCheckQuantity = document.getElementsByName('quantity');
        var checkPrice = 0;
        for (j = 0; j < myCheckBoxes.length; j++) {
          if (myCheckBoxes[j].checked) {
            checkPrice += parseInt(myCheckPrice[j].value);
          }
        }
        sumCheckPrice.innerHTML = Number(checkPrice).toLocaleString('en'); // 상품합계
        shipCheckPrice.innerHTML = Number(checkPrice >= 50000 || checkPrice == 0 ? 0 : 2500).toLocaleString('en'); // 배송비
        totalCheckPrice.innerHTML = Number(checkPrice + parseInt(checkPrice >= 50000 || checkPrice == 0 ? 0 : 2500)).toLocaleString('en'); // 합계
      }
    </script>


<script>
    function check_Del() {
      var chkbox = "";
      $("input[name='chkbox']:checked").each(function () {
        chkbox = chkbox + $(this).val() + ",";
      });
      chkbox = chkbox.substring(0, chkbox.lastIndexOf(",")); //맨끝 콤마 지우기
  
      if (chkbox == '') {
        alert("삭제할 상품을 선택하세요.");
        return false;
      }
      console.log("### chkbox => {}" + chkbox);
  
      if (confirm("삭제 하시겠습니까?")) {
  
        location.href = "chkdelete?chkbox=" + chkbox;
      }
    }
  </script>

  <script>
    // 선택 상품금액
    function check_Price(){
      var myCheckBoxes = document.getElementsByClassName('myChkbox');
      for (var i = 0; i < myCheckBoxes.length; i++){
        if (myCheckBoxes[i].checked) {
          alert(parseInt(myCheckBoxes[i].value)); //

        }
      }
    }
  </script>

</body>

</html>