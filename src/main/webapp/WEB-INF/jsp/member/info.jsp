<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>내정보</title>
<link rel="stylesheet" href="/css/style_join.css">
<link rel="stylesheet" href="/css/style_footer.css">
<style type="text/css">
  .info_photo {
  width: 250px;
  height: 250px;
  }
  .chk_cls {
    color: red;
  }
</style>
</head>
<body>
<form method="post" action="update" name="form" enctype="multipart/form-data" onsubmit="return updateAll();">
	<div class="container">
		<div class="py-5 text-center">내 정보</div>
		<div class="row">
			<div class="col-md-4">
			   <img src="/images/info_photo.jpg" class="info_photo" />
			   <input type="file" name='filePath' value="파일선택"/>
			</div>
			   <div class="col-md-8">
			   <div class="row">
				     <div class="col-12">
				      계정 이메일
				     </div>
				     <div class="col-12">
				      <input type="email" id="email" name="email" value="${myPage.email}" readonly="readonly"/>
			       </div>
		     </div>
			   <div class="row">
			     <div class="col-md-12">
			        닉네임
			     </div>
			     <div class="col-md-8">
              <input type="text" id="nickname" name="nickname" value="${myPage.nickname}" onblur="nicknameCheck();" onchange="nickChange();" maxlength="8"/>
              <div id="nickname_chk" class="chk_cls"></div>
	         </div>
			   </div>
			   <div class="row">
			     <div class="col-md-8">
			          비밀번호 변경
			     </div>
	         <div class="col-md-4">
              <input type="button" value="변경" onclick="popup();" />
	         </div>
			   </div>
			   <div class="row">
           <div class="col-md-12">
                핸드폰 번호 
           </div>
           <div class="col-md-12">
              <input type="tel" id="tel" name="tel" value="${myPage.tel}" onblur="telcheck();" onchange="telChange();" maxlength="11"/>
              <div id="tel_chk" class="chk_cls"></div>
           </div>
         </div>
           
         <div class="col-md-12">
            <input type="submit" value="변경"/>
				 </div>
				 <a href="delete?no=${mypage.memberNo}">삭제</a>
			</div>
		</div>
		<hr>
	</div>
</form>
<jsp:include page="../footer.jsp"/>
	<script type="text/javascript">
	
	
	var nickFlag = false;
	var nChange = false;
	var tChange = false;
	
	function updateAll() {
		if(!checkAll()) {
			return false;
		}
		return true;
	}

	function dup_check() {
		nickFlag = true;
	}
	
	function nickChange() {
		nChange = true;
	}
	
	function telChange() {
		tChange = true;
	}
	
	function checkAll() {
		var checkCnt = 0;
		if (nicknameCheck()) {
			checkCnt++;
		}
		if (telCheck()) {
			checkCnt++;
		}
		return checkCnt == 2 ? true : false;
	}
	
	function nicknameCheck() {
		var nCheckFlag = false;
		if (form.nickname.value == '') {
			document.getElementById('nickname_chk').innerHTML = '닉네임을 입력해주세요.';
		}
	
		var nRegPass = false;
		if (form.nickname.value != '') {
			var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
			 if (!nicknameRegExp.test(form.nickname.value)) {
				document.getElementById('nickname_chk').innerHTML = '닉네임의 형식이 올바르지 않습니다.';
		} else {
			nRegPass = true;
		}
	}
	
		if (nRegPass) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						if (xhr.responseText == '1') {
							document.getElementById('nickname_chk').innerHTML = '이미 사용중인 닉네임입니다.';
						} else {
							document.getElementById('nickname_chk').innerHTML = '사용 가능한 닉네임입니다.';
							nCheckFlag = true;
						}
					} else {
						alert('시스템 오류 발생!');
					}
				}
			}
			xhr.open = ('GET', "dupN=nickname=" + form.nickname.value, true);
			xhr.send();
		}
		return nCheckFlag;
	}
	
	function telCheck() {
		var tCheckFlag = false;
		if (form.tel.value == '') {
			document.getElementById('tel_chk').innerHTML = '핸드폰 번호를 입력해주세요.';
		}

		if (form.tel.value != '') {
			var telRegExp =  /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
			if (!telRegExp.test(form.tel.value)) {
				document.getElementById('tel_chk').innerHTML = '핸드폰 번호의 형식이 올바르지 않습니다.';
			} else {
				document.getElementById('tel_chk').innerHTML = '';
				tCheckFlag = true;
			}
		}
		return tCheckFlag;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 	function checkAll() {
// 		var flag = true;
// 		if (nChange == true) {
// 			if (form.nickname.value=="") {
// 		     document.getElementById("nickname_chk").innerHTML = "닉네임을 입력해주세요";
// 		     flag = false;
// 		    } 
// 			else {
// 	      var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
// 	       if (!nicknameRegExp.test(form.nickname.value)) {
// 	         document.getElementById("nickname_chk").innerHTML = "닉네임의 형식이 올바르지 않습니다.";
// 	         flag = false;
// 	       } else {
// 	         if (!nickFlag) {
// 	           document.getElementById("nickname_chk").innerHTML = "중복체크 해주세요";
// 	           flag = false;
// 	         } else {
// 	            document.getElementById("nickname_chk").innerHTML = "";
// 	         } 
// 	       }
// 	    }
// 		}
		
// 		if (tChange == true) {
// 			if (form.tel.value=="") {
// 	     document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력해주세요";
// 	     flag = false;
// 	    } 
// 			else {
// 	      var telRegExp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
// 	      if (!telRegExp.test(form.tel.value)) {
// 	         document.getElementById("tel_chk").innerHTML = "핸드폰 번호의 형식이 올바르지 않습니다.";
// 	         flag = false;
// 	      } else {
// 	        document.getElementById("tel_chk").innerHTML = "";
// 	      }
// 	    }
// 		}
		
// 		return flag;
// 	}
	
	/*
	function checkAll(value, msg) {
	    if (value == "") {
	       alert(msg + "를 입력해주세요.");
	        return false;     
	    }
	    return true;
	  }
	
	function updateAll() {
		if (!checkAll(form.nickname.value, "닉네임")) {
			return false;
		}
		
		if (!checkAll(form.tel.value, "핸드폰 번호")) {
			  return false;	
		}	
	}
	*/
	
	function popup() {
	  window.open("pwUpdate.html", "pwupdate", "width=500, height=500, top=100, left=850");
	}
	
	</script>
</body>
</html>













