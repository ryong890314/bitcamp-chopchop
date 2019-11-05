<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>마이펫 등록</title>
<link rel="stylesheet" href="/css/pet/form.css">
</head>
<body>

	<jsp:include page="../header.jsp" />

	<div class='content'>
		<h1>마이펫 등록</h1>
		<form action='add' method='post' enctype='multipart/form-data'>
			<label for="filePath">대표사진</label> <input type="file" id="file"
				name="file" /><br> <label for="memberNo">회원 번호</label> <input
				type="text" id="memberNo" name="memberNo" value="${memberNo}"
				readonly /> <label for="name">펫 이름</label> <input type="text"
				id="name" name="name" /> <label for="registerNo">등록번호</label> <input
				type="text" id="registerNo" name="registerNo" /> <label for="age">펫
				나이</label><br> <input type="text" id="age" name="age" /><br>
			<div class="radio-box">
				<input id="male" type="radio" name="gender" value="0"
					checked="checked" /> <label for="male">Male</label> <input
					id="female" type="radio" name="gender" value="1" /> <label
					for="female">Female</label>
			</div>
			<button>등록</button>
		</form>
	</div>

	<jsp:include page="../footer.jsp" />

</body>
</html>