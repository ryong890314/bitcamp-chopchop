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
  <div class="bucket">
    <div class="buffer">
      <div class="header">
        <div class="logo-area"></div>
      </div>
      <form method="POST" action="add" name="form" onsubmit="return checkAll();">
        <input type="email" id="email" name="email" placeholder="이메일" />
          <div id="email_chk" class="vali_check"></div>
        <input type="password" id="password" name="password" placeholder="비밀번호" maxlength="20"/> 
          <div id="password_chk" class="vali_check"></div>
        <input type="password" id="password2" name="password2" placeholder="비밀번호 확인" maxlength="20"/> 
          <div id="password2_chk" class="vali_check"></div>
        <input type="text" id="nickname" name="nickname" placeholder="닉네임" maxlength="8"/>
          <div id="nickname_chk" class="vali_check"></div>
        <input type="tel" id="tel" name="tel" placeholder="핸드폰 번호    예)01012305678" maxlength="13"/> 
          <div id="tel_chk" class="vali_check"></div>
        <input type="submit" class="btn" value="회원가입" />
      </form>
      <br>
    </div>
  </div>
  <script type="text/javascript">

    function checkAll() {
      // 빈 칸 검사 
      if (form.email.value == "") {
        document.getElementById("email_chk").innerHTML = "이메일을 입력하세요";
      } 
      
      if (form.password.value == "") {
        document.getElementById("password_chk").innerHTML = "이메일을 입력하세요";
      } 

      if (form.password2.value == "") {
        document.getElementById("password2_chk").innerHTML = "이메일을 입력하세요";
      } 

      if (form.nickname.value == "") {
        document.getElementById("nickname_chk").innerHTML = "이메일을 입력하세요";
      } 

      if (form.tel.value == "") {
        document.getElementById("tel_chk").innerHTML = "이메일을 입력하세요";
      } 

      // 이메일 유효성 검사 
      if (form.email.value != "") {
        var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if (!emailRegExp.test(form.email.value)) {
          document.getElementById("email_chk").innerHTML = "이메일 형식이 맞지 않습니다!";
        } else {
          document.getElementById("email_chk").innerHTML = "";
        }
      }

      // 비밀번호 정규식 검사 
      if (form.password.value != "") {
   		  var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; 
   	    if (!passwordRegExp.test(form.password.value)) {
   	      document.getElementById("password_chk").innerHTML = "비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!";
   	    } else{
   	      document.getElementById("password_chk").innerHTML = "";
   	      checkCnt++;
   	    }
       }
       
       // 닉네임 정규식 검사 
     	var nRegPass = false;
      if (form.nickname.value != "") {
      	var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
        if (!nicknameRegExp.test(form.nickname.value)) {
            document.getElementById("nickname_chk").innerHTML = "닉네임 형식이 올바르지 않습니다!";
        } else {
      	  nRegPass = true;
        }
      }

      // 핸드폰 번호 정규식 검사 
      if (form.tel.value != "") {
      	var telRegExp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
        if (!telRegExp.test(form.tel.value)) {
         document.getElementById("tel_chk").innerHTML = "전화번호의 형식이 올바르지 않습니다.";
        } else {
          document.getElementById("tel_chk").innerHTML = "";
          checkCnt++;
        }
      }

      return true;

    }
  </script>
<jsp:include page="../footer.jsp"/>
</body>
</html>















