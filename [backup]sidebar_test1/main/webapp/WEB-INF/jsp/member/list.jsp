<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
<link rel='stylesheet'
	href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="stylesheet" href="/css/member/style_contact.css">
</head>
<jsp:include page="../header.jsp" />
<body>


	<div id="content" style="width: 1100px;margin: 0 auto;">
		<h1>회원 목록</h1>
		<a href='form'>새 회원</a><br>
		<table class='table table-hover'>
			<tr>
				<th>번호</th>
				<th>이메일</th>
				<th>닉네임</th>
				<th>전화번호</th>
			</tr>
			<c:forEach items="${members}" var="member">
				<tr>
					<td><a href='detail?no=${member.memberNo}'>${member.memberNo}</a></td>
					<td>${member.email}</td>
					<td>${member.nickname}</td>
					<td>${member.tel}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/5dc15bc3e4c2fa4b6bda1100/default';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
	</script>
	<!--End of Tawk.to Script-->

</body>
<jsp:include page="../footer.jsp" />
</html>
