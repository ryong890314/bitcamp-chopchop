<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
</head>
<jsp:include page="../header.jsp" />
<body>
	<div id="my-content" style="width: 1100px;margin: 0 auto;">
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
</body>
<jsp:include page="../footer.jsp" />
</html>
