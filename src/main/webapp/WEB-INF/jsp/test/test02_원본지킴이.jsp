<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
  목표 : 사용자가 회원가입을 눌렀을때 한필드씩 체크하는 것이 아니라 동시에 모든필드의 유효성을 체크하겠다.
 1. 사용자가 회원가입을 누르면 checkAll() 함수를 탄다.
   1-1) 모든 필드의 빈값을 먼저검사한다. 단, 위의 것이 빈값이더라도 return 하지 않는다.
        ex) 이메일입력 X -> return하면 아래 필드들은 무시된다.
   1-2) 모든 필드의 정규식 검사를 한다. 1-1과 같이 return 하지 않는다.
   
   ----------------------------- 2버전 변경사항 중복체크 실제 DB에서 체크해서 오기 -------------------------------------
     중복체크시 화면전환이 안되어야 하므로 비동기 방식인 ajax를 사용한다.
     이메일 중복검사 시 필요한 파라미터는 email, 닉네임 중복검사시 필요한 파라미터는 nickname 
     이 두개는 get방식으로 처리한다
     
   1-3) 중복체크를 했는지 검한다.
        전역변수인 eFlag, nFlag 값으로 체크한다. (일단은 DB까지 만들지 말고, 중복체크 버튼 눌렀다면 임의로 true로 해주자)
     -  이메일 중복체크 -> dup_email() 함수에서 eFlag = true;
     -  닉네임 중복체크 -> dup_nick() 함수에서 nFlag = true;
   1-4) 중복체크를 했던 안했던, 사용자가 이메일 또는 닉네임변경시  eFlag, nFlag를 false로 변경해줘야한다.
     - onchange 이벤트에 change_email() 함수 생성. eFlag = false;
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
    // 중복검사 시도 여부만 알수있다.
    var eFlag = false;
    var nFlag = false;
    
    //  1. 사용자가 회원가입을 누르면 checkAll() 함수를 탄다.
    function checkAll() {
    	var checkCnt = 4;
    	// 1-1) 모든 필드의 빈값을 먼저검사한다. 단, 위의 것이 빈값이더라도 return 하지 않는다.
    	if (checkEmail()){
    		checkCnt--;
    	}
    	if (checkPassword()){
            checkCnt--;
        }
    	if (checkNickname()){
            checkCnt--;
        }
    	if (checkTel()){
            checkCnt--;
        }
    	
    	console.log("현재 값은 >>> ", checkCnt);
    	return checkCnt > 0 ? false : true;
    }
    
    function dup_email() {
    	if(checkEmail()){
    		// XMLHttpRequest 객체의 생성
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() { // 요청에 대한 콜백
          if (xhr.readyState === xhr.DONE) { // 요청이 완료되면
            if (xhr.status === 200 || xhr.status === 201) { // 성공
               console.log(xhr.responseText, typeof xhr.responseText); // 컨트롤 단에서 뱉어준 값이 들어있다.
               // 1이면 수정 불가, 0 또는 1보다 작은경우는 
               // if (xhr.responseText == "1") {
               if (Number(xhr.responseText) == 1) {
                 console.log("가입불가!!");
                 document.getElementById("email_chk").innerHTML = "중복된 이메일입니다.";
               } else {
                 console.log("가입가능~!!");
                 document.getElementById("email_chk").innerHTML = "사용할 수 있는 아이디";
               }
            } else { // 얘는 완전히 자바단 또는 쿼리에서 맛탱이 간경우, 프로그램 작살난경우
              alert("시스템 오류 발생");
            }
          }
        };
        // 비동기 방식으로 Request를 오픈한다
        xhr.open("GET", 'dup?email=' + form.email.value);
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
            if (eFlag == false) {
              document.getElementById("email_chk").innerHTML = "이메일 중복 체크 해주세요.";
            } else {
              document.getElementById("email_chk").innerHTML = "";
              flag = true;
            }
          }
        }
    	return flag;
     }
    
      function checkPassword(){
        var flagCnt = 0;
    	  if (form.password.value == "") {
           document.getElementById("password_chk").innerHTML = "비밀번호를 입력해주세요.";
         } else {
           var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; //비밀번호 유효성 검사
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
      function checkNickname(){
    	  var flag = false; 
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
               document.getElementById("nickname_chk").innerHTML = "";
               flag = true;
             }
           }
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














