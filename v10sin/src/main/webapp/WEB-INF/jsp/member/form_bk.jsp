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
      // 카운트로 모든 값의 유효성을 계산 => checkCnt 값이 5면 회원가입 가능!
    	var checkCnt = 0; 
   	  if (form.email.value == "") { // 빈 값 검사
   		  document.getElementById("email_chk").innerHTML = "이메일을 입력하세요.";
   	  }
   	  
   	  if (form.password.value == "") {
   		  document.getElementById("password_chk").innerHTML = "비밀번호를 입력하세요.";
   	  } 
   	  
   	  if (form.password2.value == "") {
   		  document.getElementById("password2_chk").innerHTML = "비밀번호 확인을 입력하세요.";
   	  } 
   	  
   	  if (form.nickname.value == "") {
   		  document.getElementById("nickname_chk").innerHTML = "닉네임을 입력하세요.";
   	  } 
   	  
   	  if (form.tel.value == "") {
   		  document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력하세요.";
   	  } 
   	  
   	  // 이메일 값이 들어있다면 정규식 검사 
   	  var eRegPass = false;
   	  if (form.email.value != "") { 
	   		var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	      if (!emailRegExp.test(form.email.value)) {
	        document.getElementById("email_chk").innerHTML = "이메일 형식이 올바르지 않습니다!";
	      } else {
	    	  eRegPass = true;
	      }
   	  }
   	   
   	  // 이메일 중복체크
   	  if(eRegPass) {
   		  var xhr = new XMLHttpRequest();
   		  xhr.onreadystatechange = function() {
   			  if (xhr.readyState == 4) {
   				 if (xhr.status == 200) {
   				   if (xhr.responseText == "1") { // 0이면 가입 가능, 아니면 중복!
   					   document.getElementById("email_chk").innerHTML = "중복된 이메일입니다.";
   				   } else {
   					   document.getElementById("email_chk").innerHTML = "가입 가능한 이메일입니다. ";
   					   checkCnt++;
   				   }
   				 } else {
   					 alert("시스템 오류 발생!");
   				 }
   			  }
   		  };
   			xhr.open("GET", "dupE?email=" + form.email.value, false);
   			xhr.send();
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

      // 비밀번호 & 비밀번호 확인이 같은 값인지 검사 
   	  if (form.password2.value != "") {
   		  if (form.password.value != form.password2.value) {
   			  document.getElementById("password2_chk").innerHTML = "두 비밀번호가 다릅니다.";
   		  } else {
   			  document.getElementById("password2_chk").innerHTML = "";
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
      
      // 닉네임 중복체크
      if(nRegPass) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
          if (xhr.readyState == 4) {
           if (xhr.status == 200) {
             // 0이면 가입 가능, 아니면 중복!
             if (xhr.responseText == "1") {
               document.getElementById("nickname_chk").innerHTML = "중복된 닉네임입니다.";
             } else {
               document.getElementById("nickname_chk").innerHTML = "가입 가능한 닉네임입니다. ";
               checkCnt++;
             }
           } else {
             alert("시스템 오류 발생!");
           }
          }
        }
        // false는 동기식(Ajax 순서대로 진행하도록 동기식으로 )
        xhr.open("GET", "dupN?nickname=" + form.nickname.value, false);
        xhr.send();
      }
      
      // 핸드폰 번호 정규식 검사 
      if (form.tel.value != "") {
      	var telRegExp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
        if (!telRegExp.test(form.tel.value)) {
         document.getElementById("tel_chk").innerHTML = "전화번호의 형식이 올바르지 않습니다.";
        } else {
          document.getElementById("tel_chk").innerHTML = "";
          checkCnt++;
        }
      }
      
      // checkCnt 값이 5가 되면 실행!
      console.log("checkCnt => ", checkCnt,  checkCnt == 5 ? true : false);
      return checkCnt == 5 ? true : false;
     }
  </script>
<jsp:include page="../footer.jsp"/>
</body>
</html>















