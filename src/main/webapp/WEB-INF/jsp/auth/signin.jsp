<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ChopChop 로그인</title>
<link rel='stylesheet'
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
	integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
	crossorigin='anonymous'>
<link rel='stylesheet' href='/css/member/signin.css'>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="bucket">
		<div class="buffer">social
			<div class="header">
				<div class="logo-area"></div>
			</div>
			<form method='POST' action='login' name="signinform"
				onsubmit="return checkAll();">
				<label for="email">이메일</label> <input type="email" name="email"
					value='${cookie.email.value}' onblur="email_check();" />
				<div id="email_chk" class="vali_check"></div>
				<label for="password">비밀번호</label> <input type="password"
					name="password" onblur="password_check();" />
				<div id="password_chk" class="vali_check"></div>
				<div id="emailPassword_chk" class="vali_check"></div>
				<input class="btn" type="submit" value="로그인" />
			</form>
			<input class="btnn" type="button"
				onclick="window.location.href = '/app/member/form';" value="회원가입" /> 
				<a href="/app/auth/findPassword" 
				onclick="window.open(this.href, '_blank', 'width=600px,height=600px,toolbars=no,scrollbars=no'); return false;">
				Forgot your password?</a>
		</div>
	</div>

	<script type="text/javascript">
		function email_check() {
			var eCheckFlag = false;
			console.log("email_check");
			if (signinform.email.value == "") { // 빈 값 검사
				document.getElementById("email_chk").innerHTML = "이메일을 입력하세요.";
			} else {
				document.getElementById("email_chk").innerHTML = "";
				eCheckFlag = true;
			}
			return eCheckFlag;
		}

		function password_check() {
			var pCheckFlag = false;
			console.log("password_check");
			if (signinform.password.value == "") {
				document.getElementById("password_chk").innerHTML = "비밀번호를 입력하세요.";
			} else {
				document.getElementById("password_chk").innerHTML = "";
				pCheckFlag = true;
			}

			return pCheckFlag;
		}

/* 		function emailPassword_check() {
			// 이메일 중복체크
			var ePCheckFlag = false;
			console.log("email_check");
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						if (xhr.responseText == "0") { // 0이면 가입 가능, 아니면 중복!
							document.getElementById("emailPassword_chk").innerHTML = "이메일혹은 패스워드가 잘못되었습니다.";
							ePCheckFlag = false;
						} else {
							document.getElementById("emailPassword_chk").innerHTML = "";
							ePCheckFlag = true;
						}
					} else {
						alert("시스템 오류 발생!");
					}
				}
			};
			xhr.open("GET", "signE?email=" + form.email.value, false);
			xhr.send();
			return ePCheckFlag;
		} */
		
		function checkAll() {
			var checkCnt = 0;
			if (email_check()) {
				checkCnt++;
			}
			if (password_check()) {
				checkCnt++;
			}

			return checkCnt == 2 ? true : false;
		}
	</script>
	<jsp:include page="../footer.jsp" />

</body>
</html>
