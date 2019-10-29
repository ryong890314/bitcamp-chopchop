<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
  목표 : 사용자가 회원가입을 눌렀을때 한필드씩 체크하는 것이 아니라 동시에 모든필드의 유효성을 체크하겠다.
 1. 사용자가 회원가입을 누르면 checkAll() 함수를 탄다.
   1-1) 모든 필드의 빈값을 먼저검사한다. 단, 위의 것이 빈값이더라도 return 하지 않는다.
        ex) 이메일입력 X -> return하면 아래 필드들은 무시된다.
   1-2) 모든 필드의 정규식 검사를 한다. 1-1과 같이 return 하지 않는다.
   1-3) 중복체크를 했는지 검한다.
        전역변수인 eFlag, nFlag 값으로 체크한다. (일단은 DB까지 만들지 말고, 중복체크 버튼 눌렀다면 임의로 true로 해주자)
     -  이메일 중복체크 -> dup_email() 함수에서 eFlag = true;
     -  닉네임 중복체크 -> dup_nick() 함수에서 nFlag = true;
   1-4) 중복체크를 했던 안했던, 사용자가 이메일 또는 닉네임변경시  eFlag, nFlag를 false로 변경해줘야한다.
     - onchange 이벤트에 change_email() 함수 생성. eFlag = false;
     - onchange 이벤트에 change_nick() 함수 생성. nFlag = false;
 -->
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
  <div class="bucket">
    <div class="buffer">
      <div class="header">
        <div class="logo-area"></div>
      </div>
      <form method="post" action="add" name="form" onsubmit="return checkAll();">
        <input type="text" id="email" name="email" placeholder="이메일" onchange="change_email();">
          <div id="email_chk" class="vali_chk"></div>
        <input type="button" value="중복체크" onclick="dup_email();"/> 
        <input type="password" id="password" name="password" placeholder="비밀번호" maxlength="20" /> 
          <div id="password_chk" class="vali_chk"></div>
        <input type="password" id="password2" name="password2" placeholder="비밀번호 확인" maxlength="20" /> 
          <div id="password2_chk" class="vali_chk"></div>
        <input type="text" id="nickname" name="nickname" placeholder="닉네임" maxlength="10" onchange="change_nickname();"/> 
         <div id="nickname_chk" class="vali_chk"></div>
        <input type="button" value="중복체크" onclick="dup_nickname();"/> 
          <input type="text" id="tel" name="tel" placeholder="핸드폰 번호     형식) 010-1234-5678" /> 
         <div id="tel_chk" class="vali_chk"></div>
          <input type="submit" class="btn" value="회원가입" />
      </form>
    </div>
  </div>
  <script type="text/javascript">
    var eFlag = false;
    var nFlag = false;
    //  1. 사용자가 회원가입을 누르면 checkAll() 함수를 탄다.
    function checkAll() {
    	var checkCnt = 5;
    	//성공 할때마다 하나씩 뺀다. 5개 다 성공하면 0. 0 초과면 실패
    	// 1-1) 모든 필드의 빈값을 먼저검사한다. 단, 위의 것이 빈값이더라도 return 하지 않는다.
    	if (form.email.value == "") {
    		document.getElementById("email_chk").innerHTML = "이메일을 입력해주세요.";
    	} else {
    		var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if (!emailRegExp.test(form.email.value)) {
            document.getElementById("email_chk").innerHTML = "이메일 형식이 올바르지 않습니다!";
        } else {
        	if (eFlag == false) {
            document.getElementById("email_chk").innerHTML = "이메일 중복 체크 해주세요.";
          } else {
        	  checkCnt--;
	          document.getElementById("email_chk").innerHTML = "";
          }
        }
    	}
    	
    	if (form.password.value == "") {
    		document.getElementById("password_chk").innerHTML = "비밀번호를 입력해주세요.";
    	} else {
    		var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; //비밀번호 유효성 검사
 	      if (!passwordRegExp.test(form.password.value)) {
 	        document.getElementById("password_chk").innerHTML = "비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!";
 	      } else{
 	    	  checkCnt--;
 	        document.getElementById("password_chk").innerHTML = "";
 	      }
    	}
    	
    	if (form.password2.value == "") {
    		document.getElementById("password2_chk").innerHTML = "비밀번호 확인을 입력해주세요.";
    	} else {
    		if (form.password.value != form.password2.value) {
 	        document.getElementById("password2_chk").innerHTML = "두 비밀번호가 맞지 않습니다.";
 	      } else {
 	    	  checkCnt--;
 	        document.getElementById("password2_chk").innerHTML = "";
 	      }
    	}
    	
    	if (form.nickname.value == "") {
    		document.getElementById("nickname_chk").innerHTML = "닉네임을 입력해주세요.";
    	} else {
    		var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
 	      if (!nicknameRegExp.test(form.nickname.value)) {
 	        document.getElementById("nickname_chk").innerHTML = "닉네임의 형식이 올바르지 않습니다.";
 	      } else {
 	    	 if (nFlag == false) {
	          document.getElementById("nickname_chk").innerHTML = "닉네임 중복 체크 해주세요.";
	        } else {
	        	checkCnt--;
	      	  document.getElementById("nickname_chk").innerHTML = "";
	        }
 	     	}
    	}
    	
    	if (form.tel.value == "") {
    		document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력해주세요.";
    	} else {
    		var telRegExp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
 	      if (!telRegExp.test(form.tel.value)) {
 	       document.getElementById("tel_chk").innerHTML = "전화번호의 형식이 올바르지 않습니다.";
 	      } else {
 	    	  checkCnt--;
 	        document.getElementById("tel_chk").innerHTML = "";
 	      }
    	}
    	console.log("현재 값은 >>> ", checkCnt);
    	return checkCnt > 0 ? false : true;
    }
    
    function dup_email() {
    	eFlag = true;
      document.getElementById("email_chk").innerHTML = "";
    }
    
    function dup_nickname() {
    	nFlag = true;
      document.getElementById("nickname_chk").innerHTML = "";
    }
    
    function change_email() {
    	eFlag = false;
    }
    
    function change_nickname() {
    	nFlag = false;
    }
  
  </script>

  <jsp:include page="../footer.jsp" />
</body>
</html>














