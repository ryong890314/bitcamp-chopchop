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
      <form method="post" action="add" name="form" onsubmit="return checkAll()">
        <input type="text" id="email" name="email" placeholder="이메일" />
        <input type="button" onclick="aaa();" value="중복체크" /> 
        <input type="password" id="password" name="password" placeholder="비밀번호" maxlength="20" /> 
        <input type="password" id="password2" name="password2" placeholder="비밀번호 확인" maxlength="20" /> 
        <input type="text" id="nickname" name="nickname" placeholder="닉네임" maxlength="10" /> 
          <input type="text" id="tel" name="tel" placeholder="전화번호 형식) 010-1234-5678" /> 
          <input type="submit" class="btn" value="회원가입" />
      </form>
    </div>
  </div>
  <script type="text/javascript">
  function aaa() {

    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function() {

      if (this.readyState == 4 && this.status == 200) {
        console.log("성공");
        console.log(httpRequest.responseText);
      }
    };

    xhttp.open("GET", "check?email="+form.email.value, true);
    xhttp.send();

  }

     
	   function checkAll() {
        if (!checkEmail(form.email.value)) {
            return false;
        }
        
        if (!checkPassword(form.password.value, form.password2.value)) {
            return false;
        }
        
        if (!checkNickname(form.nickname.value)) {
            return false;
        }
        
        return true;
     }
	   
	   function checkEmptyData(value, dataName) {
       if (value == "") {
           alert(dataName + " 입력해주세요!");
           return false;
       }
        return true;
     }
	   
	   function checkEmail(email) {
        //mail이 입력되었는지 확인하기
        if (!checkEmptyData(email, "이메일을"))
            return false;
        
        var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if (!emailRegExp.test(email)) {
            alert("이메일 형식이 올바르지 않습니다!");
            form.email.value = "";
            form.email.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
	   
	   
	   function checkPassword(password, password2) {
	        //비밀번호가 입력되었는지 확인하기
	        if (!checkEmptyData(password, "비밀번호를"))
	            return false;
	        
	        //비밀번호 확인이 입력되었는지 확인하기
	        if (!checkEmptyData(password2, "비밀번호 확인을"))
	            return false;
	        
	        var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; //비밀번호 유효성 검사
	        if (!passwordRegExp.test(password)) {
	            alert("비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!");
	            form.password.value = "";
	            form.password.focus();
	            return false;
	        }
	        //비밀번호와 비밀번호 확인이 맞지 않다면..
	        if (password != password2) {
	            alert("두 비밀번호가 맞지 않습니다.");
	            form.password.value = "";
	            form.password2.value = "";
	            form.password2.focus();
	            return false;
	        }
	        return true;
	   }
	   
	   function checkNickname(nickname) {
	     alert(nickname + " / " + checkEmptyData(nickname, "닉네임을"));
        if (!checkEmptyData(nickname, "닉네임을"))
            return false;
 
        var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
        if (!nicknameRegExp.test(nickname)) {
            alert("닉네임의 형식이 올바르지 않습니다.");
            form.nickname.value = "";
            form.nickname.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }

	</script>

  <jsp:include page="../footer.jsp" />
</body>
</html>
