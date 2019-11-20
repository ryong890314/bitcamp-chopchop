<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="stylesheet"
	href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
<title>My Review</title>

<style>
#orderBody {
	width: 1100px;
	padding-top: 10px;
	margin: 0 auto;
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
	width: 1100px;
	margin-left: auto;
	margin-right: auto;
}

.mInfo {
	border-bottom: 2px solid #404040;
}

.mypage-tagA {
	font-size: inherit;
	color: #404040;
}
</style>

</head>
<jsp:include page="../header.jsp" />
	<jsp:include page="../member/mypage_sidebar.jsp" />
<body>
	<div id="orderBody" style="max-width: 1200px;margin-left: 530px;margin-bottom: 310px;">
		<div
			class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
			<h3>My Review</h3>
			<span style="float: right; font-size: 14px;"> <a
				href="/app/member/myprofile" class="mypage-tagA">My Page</a>&nbsp>&nbspMy
				Review
			</span>
		</div>
		<table class='table table-hover'>
			<tr style="text-align: center;">
				<th style="width: 100px">번호</th>
				<th style="width: 240px">상품명</th>
				<th>내용</th>
				<th style="width: 160px">평점</th>
				<th style="width: 160px">작성일</th>
			</tr>

			<c:forEach items="${productReviews}" var="productReview"
				varStatus="status">
				<tr>
					<td><div>${status.count}</div></td>
					<td>
						<div>
							<a
								href="/app/product/detail?no=${productReview.products[0].productNo}"
								target="_blank"> ${productReview.products[0].title}</a>
						</div>
					</td>

					<td>
						<div>
							<p>
								<img src="/upload/productreview/${productReview.filePath}"
									style="width: 100px; margin-right: 16px;">
							</p>
							<div>
								<p>${productReview.content}</p>
							</div>
						</div>
					</td>

					<td style="color: red;"><c:if
							test="${productReview.rating == 1}">★☆☆☆☆</c:if> <c:if
							test="${productReview.rating == 2}">★★☆☆☆</c:if> <c:if
							test="${productReview.rating == 3}">★★★☆☆</c:if> <c:if
							test="${productReview.rating == 4}">★★★★☆</c:if> <c:if
							test="${productReview.rating == 5}">★★★★★</c:if></td>
					<td>${productReview.createdDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!--   <div class="modal fade bd-example-modal-lg" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" -->
	<!--     aria-hidden="true"> -->
	<!--     <div class="modal-dialog modal-lg"> -->
	<!--       <div class="modal-content"> -->
	<!--         <div class="modal-header"> -->
	<!--           <h5 class="modal-title" id="exampleModalLongTitle">상품후기 등록</h5> -->
	<!--           <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
	<!--             <span aria-hidden="true">&times;</span> -->
	<!--           </button> -->
	<!--         </div> -->
	<!--         <div class="modal-body"> -->

	<!--           <form action='../productreview/add' enctype='multipart/form-data' method='post'> -->
	<%--             <input type='text' name='productNo' id='productNo' value='${orderProduct.product.productNo}'><br> --%>
	<!--             <div class="row"> -->
	<!--                   <div class="col-md-4"> -->
	<!--                     <div> -->
	<%--               <input type="hidden" id="photo" value="${productReview.filePath}" /> --%>
	<!--               <img id="imgThumb" class="imgThumb" style="width: 250px; height: 250px; object-fit: cover"> -->
	<!--             </div> -->
	<!--               <input type='file' id='fileupload' name='file' /><br> -->
	<!--             </div> -->
	<!--             <div class="col-md-8"> -->
	<!--             <select class="custom-select" name='rating'> -->
	<!--                 <option selected value="5">★★★★★ [아주좋아요]</option> -->
	<!--                 <option value="4">★★★★☆ [맘에들어요]</option> -->
	<!--                 <option value="3">★★★☆☆ [보통이에요]</option> -->
	<!--                 <option value="2">★★☆☆☆ [그냥그래요]</option> -->
	<!--                 <option value="1">★☆☆☆☆ [별로에요]</option> -->
	<!--               </select> -->
	<!--               <hr> -->
	<!--               <textarea class="form-control" id="message-text" name="content" style="overflow:auto; height: 200px; resize: none;"></textarea> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--           <hr> -->
	<!--           <div style="text-align: right;"> -->
	<!--               <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
	<!--               <button type="submit" class="btn btn-primary">등록하기</button> -->
	<!--             </div> -->
	<!--           </form> -->

	<!--         </div> -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->

	<jsp:include page="../footer.jsp" />

	<script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>

	<script>
		//   $('#myAddModal').on('show.bs.modal', function (e) {
		//     formLoad();
		//   })

		//     var shipStatus=$('.ship-status');
		//     var reviewButton=$('.reviewBtn');
		//     for (var i=0; i<shipStatus.length; i++) {
		//       if (shipStatus[i].innerText == 1) {
		//         shipStatus[i].innerText="입금 전";
		//       } else if (shipStatus[i].innerText == 2) {
		//         shipStatus[i].innerText="입금 확인";
		//       } else if (shipStatus[i].innerText == 3) {
		//         shipStatus[i].innerText="발송";
		//       } else if (shipStatus[i].innerText == 4) {
		//         shipStatus[i].innerText="구매확정";
		//       }
		//     }

		//     for (var  i=0; i<shipStatus.length; i++) {
		//       if (shipStatus[i].innerText == '구매확정') {
		//         reviewButton[i].setAttribute('style', 'inline');
		//       } 
		//     }

		//     function formLoad() {
		//       if ($("#photo").val() == null || $("#photo").val() == "") {
		//         $("#imgThumb").attr("src", "/upload/productreview/info_photo.jpg");
		//       } else {
		//         $("#imgThumb").attr("src", "/upload/productreview/" + $("#photo").val());
		//       }
		//     }

		//     document.getElementById("fileupload").onchange = function () {
		//       var reader = new FileReader();
		//       reader.onload = function (e) {
		//         document.getElementById("imgThumb").src = e.target.result;
		//       };
		//       reader.readAsDataURL(this.files[0]);
		//     };
	</script>

</body>
</html>

























