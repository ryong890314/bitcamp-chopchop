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
		<div class="py-5 text-center"><p>내 정보</p></div>
		<div class="row">
			<div class="col-md-4">
			   <img class="info_photo" src="/images/info_photo.jpg"/>
			   <input type="file" name='filePath' value="파일선택"/>
			</div>
			
			   <div class="col-md-8">
			   <div class="row">
				     <div class="col-12">
				             계정 이메일
				     </div>
				     <div class="col-12">
				       <input type="text" id="email" name="email" value="${myPage.email}" readonly="readonly"/>
			       </div>
		     </div>
		     
			   <div class="row">
			     <div class="col-md-12">
			          닉네임
			     </div>
			     <div class="col-md-8">
              <input type="text" id="nickname" name="nickname" value="${myPage.nickname}" onchange="nickChange();"/>
              <div id="nickname_chk" class="chk_cls"></div>
	         </div>
	         <div class="col-md-4">
              <input type="button" value="중복체크" onclick="dup_check()" />
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
              <input type="text" id="tel" name="tel" value="${myPage.tel}" onchange="telChange();"/>
              <div id="tel_chk" class="chk_cls"></div>
           </div>
         </div>
           
         <div class="col-md-12">
            <input type="submit" value="변경"/>
         </div>
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
		var flag = true;
		if (nChange == true) {
			if (form.nickname.value=="") {
		     document.getElementById("nickname_chk").innerHTML = "닉네임을 입력해주세요";
		     flag = false;
		    } 
			else {
	      var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,8}$/;
	       if (!nicknameRegExp.test(form.nickname.value)) {
	         document.getElementById("nickname_chk").innerHTML = "닉네임의 형식이 올바르지 않습니다.";
	         flag = false;
	       } else {
	         if (!nickFlag) {
	           document.getElementById("nickname_chk").innerHTML = "중복체크 해주세요";
	           flag = false;
	         } else {
	            document.getElementById("nickname_chk").innerHTML = "";
	         } 
	       }
	    }
		}
		
		if (tChange == true) {
			if (form.tel.value=="") {
	     document.getElementById("tel_chk").innerHTML = "전화번호를을 입력해주세요";
	     flag = false;
	    } 
			else {
	      var telRegExp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	      if (!telRegExp.test(form.tel.value)) {
	         document.getElementById("tel_chk").innerHTML = "전화번호의 형식이 올바르지 않습니다.";
	         flag = false;
	      } else {
	        document.getElementById("tel_chk").innerHTML = "";
	      }
	    }
		}
		
		return flag;
	}
	
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













