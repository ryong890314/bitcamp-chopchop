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
<link rel='stylesheet' href='/css/signin.css'>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="bucket">
		<div class="buffer">
			<div class="header">
				<div class="logo-area"></div>
			</div>
			<form method='POST' action='login' name="form"
				onsubmit="return checkAll();">
				<label for="email">이메일</label> <input type="text" name="email"
					value='${cookie.email.value}' onblur="email_check();" />
				<div id="email_chk" class="vali_check"></div>
				<label for="password">비밀번호</label> <input type="password"
					name="password" required />
				<div id="password_chk" class="vali_check"></div>
				<div id="email_chk" class="vali_check"></div>
			</form>
			<input class="btn" type="submit" value="로그인" /> <input class="btnn"
				type="button" onclick="window.location.href = '/app/member/form';"
				value="회원가입" />
		</div>
	</div>
	<script type="text/javascript">
		function email_check() {
			var eCheckFlag = false;
			console.log("email_check");
			if (form.email.value == "") { // 빈 값 검사
				document.getElementById("email_chk").innerHTML = "이메일을 입력하세요.";
			}
			// 이메일 중복체크
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						if (xhr.responseText == "1") { // 0이면 가입 가능, 아니면 중복!
							document.getElementById("email_chk").innerHTML = "아이디 찾음";
						} else {
							document.getElementById("email_chk").innerHTML = "이메일혹은 패스워드가 잘못되었습니다.";
							eCheckFlag = false;
						}
					} else {
						alert("시스템 오류 발생!");
					}
				}
			};
			xhr.open("GET", "signE?email=" + form.email.value, false);
			xhr.send();
			return eCheckFlag;
		}

		function password_check() {
			var pCheckFlag = false;
			if (form.password.value == "") {
				document.getElementById("password_chk").innerHTML = "비밀번호를 입력하세요.";
			}

			return pCheckFlag;
		}

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
