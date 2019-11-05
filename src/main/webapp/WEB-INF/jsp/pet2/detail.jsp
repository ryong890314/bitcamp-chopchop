<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>펫 보기</title>
<link rel='stylesheet'
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
	integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
	crossorigin='anonymous'>
  <style type="text/css">
    .tagA {
      color: #ffffff;
      background: #b0c364;
      font-size: 1.2em;
      padding: 0.3em 0.5em;
      margin-right: 0.1em;
    }
  </style>
</head>
<body>

	<div id='content' class="container">
		<h1>My Pet Information</h1>
		<a href='/app/pet2/form?no=${member.memberNo}' class="tagA">펫 등록</a><br>
		<form action='/app/pet2/update' method='post'>
			<c:forEach items="${pets}" var="pet">
				<div class="card mb-3" style="max-width: 540px;">
					<div class="row">
						<div class="col-md-4">
						  <%-- <input class='pet-filePath' type='text' value='${pet.filePath}'> --%>
							<img src="/upload/pet/${pet.filePath}" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">${pet.name}(${pet.age}세,
									<c:if test="${pet.gender eq 0}">수컷</c:if>
									<c:if test="${pet.gender eq 1}">암컷</c:if>
									)
								</h5>
								<p class="card-text">
									등록일 : ${pet.createdDate}<br>등록번호 : ${pet.registerNo}<br>
								</p>
								<p class="card-text">
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target=".my-modal">수정</button>

									<a href="/app/pet/delete?no=${pet.petNo}"> 삭제</a>
								</p>

							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</form>
	</div>

	<!-- Pet Modal -->
	<!-- Modal -->
	<div class="modal fade my-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Update My Pet</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<%--          <div class="col-md-4">
            <img src="/upload/pet/${pet.filePath}" class="card-img" alt="...">
          </div> --%>

					<div class="col-5">
						<div id='content'>
							<div>
								<input type="hidden" id="photo2" value="${pet.filePath}" /> 
								<img
									id="petimgThumb" class="imgThumb my-pet-thumb">
							</div>
							<div style="display: none;">
								<input type='file' id="petFile" name='petFile' />
							</div>
							<label id="label" for="petFile">사진 변경</label>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="">Save</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 사진 미리보기 
		document.getElementById("petFile").onchange = function() {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById("petimgThumb").src = e.target.result;
			};
			reader.readAsDataURL(this.files[0]);
		};
	</script>
	
	<script>
	test();
	function test(){
	var petfilePath =  $('.pet-filePath').val();
	$('.my-pet-thumb').attr('src', '/upload/pet/' + petfilePath);
	};
	</script>
</body>
</html>
