<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!-- 
 10.21
  1) 필드당 빈값, 정규식 체크
  2) 빈값, 정규식 체크 후 중복 체크 검사
  3) controll구현 안됨
   중복체크하면 임시로 중복체크한것으로 간주
  단점 : 하나 입력하고 테스트하고, 또 하나 입력하고 테스트하고,,, 사용자가 귀찮다.
   
 --> 
<!DOCTYPE html>
<html>
<head>
<title>CHOP CHOP 회원가입</title>
<link rel="stylesheet" href="/css/style_join.css">
<link rel="stylesheet" href="/css/style_footer.css">
<style type="text/css">
  .vali_chk {
    color: red;
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
      <form method="post" action="add" name="form" onsubmit="return checkAll()">
        <input type="text" id="email" name="email" placeholder="이메일" onchange="field_change('e')"/>
          <div id="email_chk" class="vali_chk"></div>
        <input type="button" value="중복체크" onclick="dup_check('e');" /> 
        <input type="password" id="password" name="password" placeholder="비밀번호" maxlength="20" /> 
          <div id="pw_chk" class="vali_chk"></div>
        <input type="password" id="password2" name="password2" placeholder="비밀번호 확인" maxlength="20" /> 
          <div id="pw2_chk" class="vali_chk"></div>
        <input type="text" id="nickname" name="nickname" placeholder="닉네임" onchange="field_change('n')" maxlength="10" /> 
         <div id="nickname_chk" class="vali_chk"></div>
        <input type="button" value="중복체크" onclick="dup_check('n');" /> 
          <input type="text" id="tel" name="tel" placeholder="핸드폰 번호     형식) 010-1234-5678" /> 
         <div id="tel_chk" class="vali_chk"></div>
          <input type="submit" class="btn" value="회원가입" />
      </form>
    </div>
  </div>
  <script type="text/javascript">
    // 중복체크 성공 실패 확인용 변수 
	  var dupEmailFlag = false;
	  var dupNicknameFlag = false;
	  
	  function checkAll() {
		    // 1) 각 필드마다 빈값 있는지, 정규식 맞는지 체크
	      if (!check_email()) {
	        return false;
	      }
	      if (!check_password()) {
	        return false;
	      }
	      if (!check_password2()) {
	        return false;
	      }
	      if (!check_nickname()) {
	        return false;
	      }
	      if (!check_tel()) {
	        return false;
	      }
	      
	      // 2) 중복체크까지 했는지 체크
	      if (!dupEmailFlag) {
	        document.getElementById("email_chk").innerHTML = "이메일 중복 체크를 해주세요.";
	        return false;
	      } else {
	        document.getElementById("email_chk").innerHTML = "";
	      }
	      
	      if (!dupNicknameFlag) {
	        document.getElementById("nickname_chk").innerHTML = "닉네임 중복 체크를 해주세요.";
	        return false;
	      } else {
	        document.getElementById("nickname_chk").innerHTML = "";
	      }
	      
	      return false;
	    }
	  
	  // 이메일, 닉네임 중복체크 컨트롤단 구현이 안되어 버튼 누르면 성공으로 임시처리
    function dup_check(param) {
      if (param == "e") {
    	  dupEmailFlag = true;
      } else {
    	  dupNicknameFlag = true;
      }
    }
	  
    /* 
		  사용자가 입력값을 변경할때 마다 다시 중복체크 하도록 flag값을 false로 초기화함
		  이 작업을 빼 놓으면 한번만 중복검사 성공하면, 그 뒤에는 중복검사를 안해도 가입이 된다. 
	  --> 자바단에서 오류가 나므로 여기서 막아주는것이 옳다. 
	  */
    function field_change(param) {
    	if (param == "e") {
    		dupEmailFlag = false;
      } else {
    	  dupNicknameFlag = false;
      }
    }
    
	  // ================================ 각 필드들의 빈값, 정규식 검사 시작
	  // 조건에  안맞으면 return false 
    function check_email() {
      if (form.email.value == "") {
        document.getElementById("email_chk").innerHTML = "이메일을 입력해주세요~";
        form.email.focus();
        return false;
      } else {
        document.getElementById("email_chk").innerHTML = "";
      }
      var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      if (!emailRegExp.test(form.email.value)) {
          document.getElementById("email_chk").innerHTML = "이메일 형식이 올바르지 않습니다!";
          form.email.focus();
          return false;
      } else {
        document.getElementById("email_chk").innerHTML = "";
      }
      return true;
    }
    
    function check_password() {
      if (form.password.value == "") {
        document.getElementById("pw_chk").innerHTML = "비밀번호를 입력해주세요~";
        form.password.focus();
        return false;
      } else {
        document.getElementById("pw_chk").innerHTML = "";
      }
      
      var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; //비밀번호 유효성 검사
      if (!passwordRegExp.test(form.password.value)) {
        document.getElementById("pw_chk").innerHTML = "비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!";
        form.password.focus();
        return false;
      } else{
        document.getElementById("pw_chk").innerHTML = "";
      }
      return true;
    }
      
    function check_password2() {
      if (form.password2.value == "") {
        document.getElementById("pw2_chk").innerHTML = "비밀번호 확인을 입력해주세요~";
        form.password2.focus();
        return false;
      } else {
        document.getElementById("pw2_chk").innerHTML = "";
      }
      
      if (form.password.value != form.password2.value) {
        document.getElementById("pw2_chk").innerHTML = "두 비밀번호가 맞지 않습니다.";
        form.password2.focus();
        return false;
      } else {
        document.getElementById("pw2_chk").innerHTML = "";
      }
        return true;
    }
    
    function check_nickname() {
      if (form.nickname.value == "") {
        document.getElementById("nickname_chk").innerHTML = "닉네임을 입력해주세요~";
        form.nickname.focus();
        return false;
      } else {
        document.getElementById("nickname_chk").innerHTML = "";
      }
      
      var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
      if (!nicknameRegExp.test(form.nickname.value)) {
          document.getElementById("nickname_chk").innerHTML = "닉네임의 형식이 올바르지 않습니다.";
          form.nickname.focus();
          return false;
      } else {
        document.getElementById("nickname_chk").innerHTML = "";
      }
      return true;
    }
    
    function check_tel() {
      if (form.tel.value == "") {
        document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력해주세요~";
        form.tel.focus();
        return false;
      } else {
        document.getElementById("tel_chk").innerHTML = "";
      }
      
      var telRegExp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
      if (!telRegExp.test(form.tel.value)) {
        document.getElementById("tel_chk").innerHTML = "전화번호의 형식이 올바르지 않습니다.";
        form.tel.focus();
        return false;
      } else {
        document.getElementById("tel_chk").innerHTML = "";
      }
      return true;
    }
 // ================================ 각 필드들의 빈값, 정규식 검사 끝
  </script>

  <jsp:include page="../footer.jsp" />
</body>
</html>














