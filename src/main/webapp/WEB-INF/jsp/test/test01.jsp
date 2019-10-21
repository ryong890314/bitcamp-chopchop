<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
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
        <input type="text" id="email" name="email" placeholder="이메일" onchange="emailChange();"/>
          <div id="email_chk" class="vali_chk"></div>
        <input type="button" value="중복체크" onclick="dup_check('e');" /> 
        <input type="password" id="password" name="password" placeholder="비밀번호" maxlength="20" /> 
          <div id="pw_chk" class="vali_chk"></div>
        <input type="password" id="password2" name="password2" placeholder="비밀번호 확인" maxlength="20" /> 
          <div id="pw2_chk" class="vali_chk"></div>
        <input type="text" id="nickname" name="nickname" placeholder="닉네임" onchange="nicknameChange();" maxlength="10" /> 
         <div id="nickname_chk" class="vali_chk"></div>
        <input type="button" value="중복체크" onclick="dup_check('n');" /> 
          <input type="text" id="tel" name="tel" placeholder="핸드폰 번호     형식) 010-1234-5678" /> 
         <div id="tel_chk" class="vali_chk"></div>
          <input type="submit" class="btn" value="회원가입" />
      </form>
    </div>
  </div>
  <script type="text/javascript">
    function dup_check(param) {
      if (param == "e") {
        
      } else {
        
      }
    }
  
  
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

    function checkAll() {
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
      
      if (dupEmailFlag) {
        document.getElementById("email_chk").innerHTML = "이메일 중복 체크를 해주세요.";
        return false;
      } else {
        document.getElementById("email_chk").innerHTML = "";
      }
      
      if (dupNicknameFlag) {
        document.getElementById("nickname_chk").innerHTML = "닉네임 중복 체크를 해주세요.";
        return false;
      } else {
        document.getElementById("nickname_chk").innerHTML = "";
      }
      
      return false;
    }
    
    
    
    
    
    
    
    
//  function emptyCheck(param, msg) {
//  if (param.value == "") {
//    document.getElementById(param.id+"_chk").innerHTML = msg + " 입력해주세요~";
//    return false;
//  } else {
//    document.getElementById(param.id+"_chk").innerHTML = "";
//  }
//  return true;
//}

//function check_email() {
//  if (!emptyCheck(form.email, "이메일")) {
//    return false;
//  } 
//}

//function check_password() {
//  if (!emptyCheck(form.password, "비밀번호")) {
//    return false;
//  }
//  return true;
//}

//function check_password2() {
//  if (!emptyCheck(form.password2, "비밀번호 확인")) {
//    return false;
//  }
//  return true;
//}

//function check_nickname() {
//  if (!emptyCheck(form.nickname, "닉네임")) {
//    return false;
//  }
//  return true;
//}

//function check_tel() {
//  if (!emptyCheck(form.tel, "핸드폰 번호")) {
//    return false;
//  }
//  return true;
//}

//       if (!check_email()) {
//    check_focus(form.email);
//  }

//function emptyCheck(param, msg) {
//  if (param.value == "") {
//    document.getElementById(param + "_chk").innerHTML = msg + "을 입력해주세요.";
//    return false;
//  } else {
//    document.getElementById(param + "_chk").innerHTML = "";
//  }
//  return true;
//}

//function check_focus(param) {
//  param.value = "";
//  param.focus();
//}

//function check_email() {
//  if (!emptyCheck(form.email, "이메일")) {
//    return false;
//  }
 
//  var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
//  if (!emailRegExp.test(form.email.value)) {
//    document.getElementById().innerHTML = "이메일 형식이 다릅니다.";
//    return false;
//  } else {
//    document.getElementById().innerHTML = "";
//  }
//  return true;
//}


//function pw_email() {
//  if (document.getElementById("password").value == "") {
//    document.getElementById("pw_chk").innerHTML = "비밀번호를 입력해주세요.";
//  }
//}
//function pw2_email() {
//  if (document.getElementById("password2").value == "") {
//    document.getElementById("pw2_chk").innerHTML = "비밀번호 확인을 입력해주세요.";
//  }
//}
//function nickname_email() {
//  if (document.getElementById("nickname").value == "") {
//    document.getElementById("nickname_chk").innerHTML = "닉네임을 입력해주세요.";
//  }
//}
//function tel_email() {
//  if (document.getElementById("tel").value == "") {
//    document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력해주세요.";
//  }
//}


  </script>

  <jsp:include page="../footer.jsp" />
</body>
</html>














