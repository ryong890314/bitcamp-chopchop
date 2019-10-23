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
  <div class="bucket">
    <div class="buffer">
      <div class="header">
        <div class="logo-area"></div>
      </div>
      <form method="post" action="add" name="form" onsubmit="return checkAll();">
        <input type="text" id="email" name="email" placeholder="이메일     예)xxxx@xxx.xxx" onchange="change_email();">
          <div id="email_chk" class="vali_chk" value=""></div>
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
          <input type="submit" id="submit" class="btn" value="회원가입" disabled=""/>
      </form>
    </div>
  </div>
  <script type="text/javascript">
  
  document.getElementById("email").blur() = function() {
    console.log("sadasdasd");
    document.getElementById("email_chk").innerHTML = "글씨";
  }

    // 중복검사 시도 여부만 알수있다.
    var eFlag = false;
    var nFlag = false;
    
    var ePass = true;
    function checkAll() {
    	var checkCnt = 4;
    	// 1-1) 모든 필드의 빈 값을 먼저 검사한다. 
    	// checkEmail 필수값과 정규식
    	// checkDupEmail 정규식
    	if (checkEmail() && checkDupEmail()){
    		checkCnt--;
    	}
    	if (checkPassword()){
          checkCnt--;
      }
    	if (checkNickname() && checkDupNickname()){
          checkCnt--;
      }
    	if (checkTel()){
          checkCnt--;
      }
    	
    	console.log("현재 값은 >>> ", checkCnt);
    	return checkCnt > 0 ? false : true;
    }
    
    function dup_email() {
    	eFlag = true;
    	if(checkEmail()){
    		// XMLHttpRequest 객체의 생성
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() { // 요청에 대한 콜백
          if (xhr.readyState == 4) { // 요청이 완료되면
            if (xhr.status == 200) { // 성공
               console.log(xhr.responseText, typeof xhr.responseText); 
               // 1이면 수정 불가, 0 또는 1보다 작은경우는 가능
               if (xhr.responseText == "1") {
                 console.log("가입불가!!");
                 ePass = false;
                 document.getElementById("email_chk").innerHTML = "중복된 이메일입니다.";
                 eflag = false;
                 var ele = document.getElementById("submit"); // 비활성화 코드
                 ele.disabled = true;
               } else {
                 console.log("가입가능~!!");
                 ePass = true;
                 document.getElementById("email_chk").innerHTML = "사용할 수 있는 아이디입니다.";
                 var el = document.getElementById("submit");
                 el.disabled = false;
               }
            } else { 
              alert("시스템 오류 발생");
            }
          }
        };
        // 비동기 방식으로 Request를 오픈한다
        xhr.open("GET", "dupE?email=" + form.email.value);
        xhr.send();
    	}
    }
    
    function checkEmail(){
      var flag = false;
    	if (form.email.value == "") {
          document.getElementById("email_chk").innerHTML = "이메일을 입력해주세요.";
        } else {
          var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
          if (!emailRegExp.test(form.email.value)) {
              document.getElementById("email_chk").innerHTML = "이메일 형식이 올바르지 않습니다!";
          } else {
        	  flag = true;
          }
        }
    	return flag;
     }
    
    function checkDupEmail () {
    	var flag = false;
    	if (eFlag == false) {
         document.getElementById("email_chk").innerHTML = "이메일 중복 체크 해주세요.";
       } else {
         document.getElementById("email_chk").innerHTML = "";
         flag = true;
       }
    	return flag;
    }
    
      function checkPassword(){
        var flagCnt = 0;
    	  if (form.password.value == "") {
           document.getElementById("password_chk").innerHTML = "비밀번호를 입력해주세요.";
         } else {
           var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; 
           if (!passwordRegExp.test(form.password.value)) {
             document.getElementById("password_chk").innerHTML = "비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!";
           } else{
             document.getElementById("password_chk").innerHTML = "";
             flagCnt++;
           }
         }
         
         if (form.password2.value == "") {
           document.getElementById("password2_chk").innerHTML = "비밀번호 확인을 입력해주세요.";
         } else {
           if (form.password.value != form.password2.value) {
             document.getElementById("password2_chk").innerHTML = "두 비밀번호가 맞지 않습니다.";
           } else {
             document.getElementById("password2_chk").innerHTML = "";
             flagCnt++;
           }
         }
         return flagCnt == 2 ? true : false;
      }
      
      function dup_nickname() {
        eFlag = true;
        if(checkNickname()){
          // XMLHttpRequest 객체의 생성
          var xhr = new XMLHttpRequest();
          xhr.onreadystatechange = function() { // 요청에 대한 콜백
            if (xhr.readyState == 4) { // 요청이 완료되면
              if (xhr.status == 200) { // 성공
                 console.log(xhr.responseText, typeof xhr.responseText); 
                 // 1이면 수정 불가, 0 또는 1보다 작은경우는 가능
                 if (xhr.responseText == "1") {
                   console.log("가입불가!!");
                   ePass = false;
                   document.getElementById("nickname_chk").innerHTML = "중복된 닉네임입니다.";
                   eflag = false;
                   var ele = document.getElementById("submit"); // 비활성화 코드
                   ele.disabled = true;
                 } else {
                   console.log("가입가능~!!");
                   ePass = true;
                   document.getElementById("nickname_chk").innerHTML = "사용할 수 있는 닉네임입니다.";
                   var el = document.getElementById("submit");
                   el.disabled = false;
                 }
              } else { 
                alert("시스템 오류 발생");
              }
            }
          };
          // 비동기 방식으로 Request를 오픈한다
          xhr.open("GET", "dupN?nickname=" + form.nickname.value);
          xhr.send();
        }
      }
      
      function checkNickname(){
        var flag = false;
        if (form.nickname.value == "") {
            document.getElementById("nickname_chk").innerHTML = "닉네임을 입력해주세요.";
          } else {
            var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
            if (!nicknameRegExp.test(form.nickname.value)) {
                document.getElementById("nickname_chk").innerHTML = "닉네임 형식이 올바르지 않습니다!";
            } else {
              flag = true;
            }
          }
        return flag;
       }
      
      function checkDupNickname() {
        var flag = false;
        if (eFlag == false) {
           document.getElementById("nickname_chk").innerHTML = "닉네임 중복 체크 해주세요.";
         } else {
           document.getElementById("nickname_chk").innerHTML = "";
           flag = true;
         }
        return flag;
      }
      
      
      function checkTel(){
    	  var flag = false;    	  
        if (form.tel.value == "") {
          document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력해주세요.";
        } else {
          var telRegExp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
          if (!telRegExp.test(form.tel.value)) {
           document.getElementById("tel_chk").innerHTML = "전화번호의 형식이 올바르지 않습니다.";
          } else {
            document.getElementById("tel_chk").innerHTML = "";
            flag = true;
          }
        }
        return flag;
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














