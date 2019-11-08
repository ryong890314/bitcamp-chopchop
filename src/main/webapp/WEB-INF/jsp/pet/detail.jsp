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
		<a href='/app/pet/form?no=${member.memberNo}' class="tagA">펫 등록</a><br>
		<form action='/app/pet/update' method='post'>
			<c:forEach items="${pets}" var="pet">
				<div class="card mb-3" style="max-width: 540px;">
					<div class="row">
						<div class="col-md-4">
							<%-- <input class='pet-filePath' type='text' value='${pet.filePath}'> --%>
							<img src="/upload/pet/${pet.filePath}" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title age">
								${pet.name}
									(${pet.age}세,
									<c:if test="${pet.gender eq 0}">수컷</c:if>
									<c:if test="${pet.gender eq 1}">암컷</c:if>
									)
								</h5>
								<p class="card-text">등록일 : ${pet.createdDate}</p>
								등록번호 :
								<p class="card-text registerNo">${pet.registerNo}</p>
								<p class="card-text">
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary my-btn" onclick="window.location.href = '/app/pet/updateForm';">수정</button>

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
<%-- 	<div class="modal fade my-modal" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<div class="col-5">
						<div id='content'>

							<form action='update' method='post' name="form"
								enctype='multipart/form-data'">
								<div class="row">
									<div class="col-5">
										<div id='content'>
											<div>
												<input type="text" id="photo2" value="${pet.filePath}" /> <img
													id="petimgThumb" class="imgThumb my-pet-thumb">
											</div>
											<div style="display: none;">
												<input type='file' id="file" name='file' />
											</div>
											<label class="photoChange" id="label" for="file">사진
												변경</label>
										</div>
									</div>
									<div class="col-7">
										<input type='hidden' id='memberNo' name='memberNo'
											value='${pet.petNo}' readonly> <label for="name">My
											pet's name <input type='text' class='modal-petName'
											name='name' value='${pet.name}' onblur="nickname_check();">
										</label><br>
										<div id="nickname_chk" class="vali_check"></div>
										<label for="registerNo">Register Number <input
											class='modal-registerNo' type='text' name='age'
											value='${pet.registerNo}'></label><br>
										<div id="tel_chk" class="vali_check"></div>
										<label for="age">Age <input type='text' name='age'
											class="modal-age" value='${pet.age}' onblur="tel_check();"></label><br>
										<div id="tel_chk" class="vali_check"></div>
										<div>
											<c:if test="${pet.gender eq 0}">수컷</c:if>
											<c:if test="${pet.gender eq 1}">암컷</c:if>
											)
										</div>
									</div>
								</div>
							</form>

							<!-- 							<div style="display: none;">
								<input type='file' id="petFile" name='petFile' />
							</div>
							<label id="label" for="petFile">사진 변경</label> -->
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
	</div> --%>


	<script>
/* 		test();
		function test() {
			var petfilePath = $('.pet-filePath').val();
			$('.my-pet-thumb').attr('src', '/upload/pet/' + petfilePath);
		};

		$(document).on('click', '.my-btn', function(e) {
			console.log("수정버튼누름");
			var petName = $('.card-title').text();
			var registerNo = $('.registerNo').html();
			var age = $('.age').text();
			var test = $
			{
				pet.age
			}
			;

			console.log(test);
			// 모달에 넣고 싶은 데이터를 찾아서 변수에 담는다.
			// 					window.commentContent = $(
			// 							e.target.parentNode.parentNode.parentNode).find(
			// 							'.comment-content').text();
			// 					window.commentNo = $(
			// 							e.target.parentNode.parentNode.parentNode).find(
			// 							'.comment-no').val();

			// 모달 태그 안에  그 값을 넣는다.
			$('.modal-petName').val(petName); // modal 창에 값을 셋팅
			$('.modal-registerNo').val(registerNo);
			$('.modal-age').val(age);

			// 모달을  띄운다.
			$('#myModal').modal('show');
			return false;
		}); */
	</script>
</body>
</html>
