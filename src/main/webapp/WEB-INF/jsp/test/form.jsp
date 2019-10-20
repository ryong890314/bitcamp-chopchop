<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CHOP CHOP 회원가입</title>
<link rel="stylesheet" href="/css/style_join.css">
<link rel="stylesheet" href="/css/style_footer.css">
</head>
<body>
  <%--   <jsp:include page="../header.jsp" /> --%>
  <div class="bucket">
    <div class="buffer">
      <div class="header">
        <div class="logo-area"></div>
      </div>
      <form method="POST" action="add" name="form" onsubmit="return checkAll();">
        <input type="text" id="email" name="email" placeholder="이메일"/>
        <input type="button" value="중복체크" /> 
        <input type="password" id="password" name="password" placeholder="비밀번호"/> 
        <input type="password" id="password2" name="password2" placeholder="비밀번호 확인"/> 
        <input type="text" id="nickname" name="nickname" placeholder="닉네임"/> 
        <input type="text" id="tel" name="tel" placeholder="전화번호    예)010-123405678"/> 
        <input type="submit" class="btn" value="회원가입" />
      </form>
    </div>
  </div>
  <script type="text/javascript">
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
	  return true;
  }
  
  function emptyCheck(param, msg) {
	  if (param.value == "") {
		 alert(msg + " 입력해주세요~");
		 // check_focus(param);
		 return false;
	  }
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
          alert("이메일 형식이 올바르지 않습니다!");
          return false;
      }
      return true;
  }
  
  function check_password() {
	  if (!emptyCheck(form.password, "비밀번호")) {
		  return false;
	  }
	  
	  var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; //비밀번호 유효성 검사
      if (!passwordRegExp.test(form.password.value)) {
          alert("비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!");
          check_focus(form.password);
          return false;
      }
	  
	  if (!emptyCheck(form.password2, "비밀번호 확인")) {
		  return false;
	  }
      
      if (form.password.value != form.password2.value) {
          alert("두 비밀번호가 맞지 않습니다.");
          check_focus(form.password2);
          return false;
      }
      return true;
  }
  
  function check_nickname() {
	  if (!emptyCheck(form.nickname, "닉네임")) {
		  return false;
	  }
	  var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
      if (!nicknameRegExp.test(form.nickname.value)) {
          alert("닉네임의 형식이 올바르지 않습니다.");
          // check_focus(form.nickname);
          return false;
      }
      return true;
  }
  
  function check_tel() {
	  if (!emptyCheck(form.tel, "전화번호")) {
		  return false;
	  }
	  var telRegExp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
      if (!telRegExp.test(form.tel.value)) {
          alert("전화번호의 형식이 올바르지 않습니다.");
          return false;
      }
      return true;
  }
  </script>
<jsp:include page="../footer.jsp"/>
</body>
</html>















