<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.get-password-page {
	width: 550px;
	text-align: center;
	overflow-x: hidden;
	margin: 11% auto;
	vertical-align: middle;
}

.get-password-header {
	text-align: left;
	margin: 60px 75px 0 75px;
	padding-bottom: 10px;
	font-size: 16pt;
	border-bottom: 3px solid #b0c364;
}

.get-password-content {
	margin: 30px 0 20px 85px;
	text-align: left;
}

.get-password-div {
	margin-bottom: 15px;
}

.get-password-div span {
	font-size: 14pt;
	color: #b0c364;
}

.get-password-content input[type=text] {
	width: 380px;
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 14pt;
	padding-left: 10px;
	color: #b0c364;
}

.passwordRequest {
	height: 25px;
	background-color: #b0c364;
	border: none;
	color: white;
	padding-left: 20px;
	padding-right: 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}
</style>
</head>
<div class="get-password-page">
	<div class="get-password-header">My Password</div>
	<div class="get-password-content">
		<div class="get-password-div">
			<span>내 비밀 번호</span>
		</div>
		<!-- <c:if test="${empty loginUser}">
			<a class='classy-btn login-area'>${password}</a>
		</c:if>
		-->
	</div>
	<div class="get-password-button">
		<Input type=button onclick="self.close()" class="passwordRequest"
			value="창닫기">
	</div>
</div>

<script type="text/javascript">
	
</script>

</html>