<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CHOP CHOP 회원가입</title>
<link rel="stylesheet" href="/css/style_join.css">
<link rel="stylesheet" href="/css/style_footer.css">
<style type="text/css">
	.vali_check {
		color : red;
	}

</style>
</head>
<body>
  <%--   <jsp:include page="../header.jsp" /> --%>
  <div class="bucket">
    <div class="buffer">
      <div class="header">
        <div class="logo-area"></div>
      </div>
      <form method="POST" action="add" name="form" onsubmit="return checkAll();">
        <input type="text" id="email" name="email" placeholder="이메일" onchange="emailChange();"/>
        	<div id="email_chk" class="vali_check"></div>
        <input type="button" value="중복체크" onclick="dup_check('e');" /> 
        <input type="password" id="password" name="password" placeholder="비밀번호"/> 
        	<div id="password_chk" class="vali_check"></div>
        <input type="password" id="password2" name="password2" placeholder="비밀번호 확인" /> 
        	<div id="password2_chk" class="vali_check"></div>
        <input type="text" id="nickname" name="nickname" placeholder="닉네임" onchange="nicknameChange();"/>
        	<div id="nickname_chk" class="vali_check"></div>
        <input type="button" value="중복체크" onclick="dup_check('n');" /> 
        <input type="text" id="tel" name="tel" placeholder="핸드폰 번호    예)010-123-5678"/> 
        	<div id="tel_chk" class="vali_check"></div>
        <input type="submit" class="btn" value="회원가입" />
      </form>
      <br>
      <a href="../mypage/info?email=kim1@test.com">마이페이지</a>
    </div>
  </div>
  <script type="text/javascript">
  
  var dupNicknameFlag = false;
  function nicknameChange() {
	  dupNicknameFlag = false;
  }
  
  var dupEmailFlag = false;
  //아이디 변경했으면 false로 바꿔서 다시 중복체크 하도록 한다.
  function emailChange() {
	  dupEmailFlag = false;
  }
  
  function dup_check (param) {
	if (param == "e") {// 이메일
		if (!check_email()) {
			  check_focus(form.email);
			  return false;
		  }
		
	} else { // 닉네임
		if (!check_nickname()) {
			  check_focus(form.nickname);
			  return false;
		  }
	}
	
	// XMLHttpRequest 객체의 생성
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() { // 요청에 대한 콜백
	  if (xhr.readyState === xhr.DONE) { // 요청이 완료되면
	    if (xhr.status === 200 || xhr.status === 201) {
	      if (xhr.responseText == 1) {
	    	  if (param == "e") {
		    	  dupEmailFlag = false;
		    	  document.getElementById("email_chk").innerHTML = "이미 가입되어있는 이메일 입니다.";
	    	  } else {
		    	  dupNicknameFlag = false;
		    	  document.getElementById("nickname_chk").innerHTML = "이미 가입되어있는 닉네임 입니다.";
	    	  }
	      } else {
	    	  if (param == "e") {
		    	  dupEmailFlag = true;
		    	  document.getElementById("email_chk").innerHTML = "가입 가능한 이메일 입니다.";
	    	  } else {
		    	  dupNicknameFlag = true;
		    	  document.getElementById("nickname_chk").innerHTML = "가입 가능한 닉네임 입니다.";
	    	  }
	      }
	    } else {
	      alert("시스템 오류 발생");
	    }
	  }
	};
	// 비동기 방식으로 Request를 오픈한다
	xhr.open("GET", 'dup?nickname=' + form.nickname.value + '&email=' + form.email.value + '&gbn='+param);
	xhr.send();
  }
  
  function checkAll() {
	  if (!check_email()) {
		  check_focus(form.email);
		  return false;
	  }
	  
	  if (!check_password()) {
		  return false;
	  }
	  
	  if (!check_nickname()) {
		  check_focus(form.nickname);
		  return false;
	  }
	  
	  if (!check_tel()) {
		  check_focus(form.tel);
		  return false;
	  }
	  
	  if (!dupEmailFlag) {
		  document.getElementById("email_chk").innerHTML = "이메일 중복검사하세요";
		  return false;
	  } else {
		  document.getElementById("email_chk").innerHTML = "";
	  }
	  
	  if (!dupNicknameFlag) {
		  document.getElementById("nickname_chk").innerHTML = "닉네임 중복검사하세요";
		  return false;
	  } else {
		  document.getElementById("nickname_chk").innerHTML = "";
	  }
	  return true;
  }
  
  function emptyCheck(param, msg) {
	  if (param.value == "") {
		  document.getElementById(param.id+"_chk").innerHTML = msg + " 입력해주세요~";
		  return false;
	  } else {
		  document.getElementById(param.id+"_chk").innerHTML = "";
	  }
// 	  if (param.value == "") {
// 		 if(param.id == "email") {
// 		 	document.getElementById("email_chk").innerHTML = msg + " 입력해주세요~";
// 		 } else if(param.id == "password") {
// 		 	document.getElementById("password_chk").innerHTML = msg + " 입력해주세요~";
// 		 } else if(param.id == "password2") {
// 		 	document.getElementById("password2_chk").innerHTML = msg + " 입력해주세요~";
// 		 } else if(param.id == "nickname") {
// 		 	document.getElementById("nickname_chk").innerHTML = msg + " 입력해주세요~";
// 		 } else if(param.id == "tel") {
// 		 	document.getElementById("tel_chk").innerHTML = msg + " 입력해주세요~";
// 		 }
// 		 return false;
// 	  }
	  return true;
  }
  
  function check_focus(param) {
	  param.value = "";
      param.focus();
  }
  
  function check_email() {
	  // flag = true면 아래를 진행, false면 리턴
	  if(!emptyCheck(form.email, "이메일")) {
		  return false;
	  }
	  
	  var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      if (!emailRegExp.test(form.email.value)) {
          document.getElementById("email_chk").innerHTML = "이메일 형식이 올바르지 않습니다!";
          return false;
      } else {
    	  document.getElementById("email_chk").innerHTML = "";
      }
      return true;
  }
  
  function check_password() {
	  if (!emptyCheck(form.password, "비밀번호")) {
		  return false;
	  }
	  
	  var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; //비밀번호 유효성 검사
      if (!passwordRegExp.test(form.password.value)) {
          document.getElementById("password_chk").innerHTML = "비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!";
          check_focus(form.password);
          return false;
      } else{
    	  document.getElementById("password_chk").innerHTML = "";
      }
	  
	  if (!emptyCheck(form.password2, "비밀번호 확인")) {
		  return false;
	  }
      
      if (form.password.value != form.password2.value) {
          document.getElementById("password2_chk").innerHTML = "두 비밀번호가 맞지 않습니다.";
          check_focus(form.password2);
          return false;
      } else {
    	  document.getElementById("password2_chk").innerHTML = "";
      }
      return true;
  }
  
  function check_nickname() {
	  if (!emptyCheck(form.nickname, "닉네임")) {
		  return false;
	  }
	  var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
      if (!nicknameRegExp.test(form.nickname.value)) {
          document.getElementById("nickname_chk").innerHTML = "닉네임의 형식이 올바르지 않습니다.";
          check_focus(form.nickname);
          return false;
      } else {
    	  document.getElementById("nickname_chk").innerHTML = "";
      }
      return true;
  }
  
  function check_tel() {
	  if (!emptyCheck(form.tel, "전화번호")) {
		  return false;
	  }
	  var telRegExp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
      if (!telRegExp.test(form.tel.value)) {
    	  document.getElementById("tel_chk").innerHTML = "전화번호의 형식이 올바르지 않습니다.";
          return false;
      } else {
    	  document.getElementById("tel_chk").innerHTML = "";
      }
      return true;
  }
  
  /**
  
  function dupCheck() {
	  if (!check_email()) {
		  check_focus(form.email);
		  return false;
	  }
	// XMLHttpRequest 객체의 생성
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() { // 요청에 대한 콜백
	  if (xhr.readyState === xhr.DONE) { // 요청이 완료되면
	    if (xhr.status === 200 || xhr.status === 201) {
	      if (xhr.responseText == 1) {
	    	  alert("이미 가입되어있습니다.");
	    	  dupEmailFlag = false;
	      } else {
	    	  alert("가입 가능한 이메일입니다.");
	    	  dupEmailFlag = true;
	      }
	    } else {
	      alert("시스템 오류 발생");
	    }
	  }
	};
	// 비동기 방식으로 Request를 오픈한다
	xhr.open('GET', 'dup?email=' + form.email.value);
	xhr.send();
  }
  
  function dupCheck2() {
	  if (!check_nickname()) {
		  check_focus(form.nickname);
		  return false;
	  }
	  var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
		  if (xhr.readyState === xhr.DONE) { // 요청이 완료되면
		    if (xhr.status === 200 || xhr.status === 201) {
		      if (xhr.responseText == 1) {
		    	  alert("이미 등록 되어있습니다.");
		    	  dupNicknameFlag = false;
		      } else {
		    	  alert("등록 가능한 닉네임입니다.");
		    	  dupNicknameFlag = true;
		      }
		    } else {
		      alert("시스템 오류 발생");
		    }
		  }
		};
	  xhr.open("GET", "dup2?nickname=" + form.nickname.value);
	  xhr.send();
  }
  */
  
  
  </script>
<jsp:include page="../footer.jsp"/>
</body>
</html>















