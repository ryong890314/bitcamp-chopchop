<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
</head>
<body>
<h1>아이디 확인</h1>
<h2>당신의 비밀번호는 ${findId.id}
<c:if test="${empty findId.id}">없습니다</c:if>
<c:if test="${not empty findId.id}">입니다</c:if>
</h2>
<a href="../auth/form">다시 로그인하러가기</a>
</body>
</html>