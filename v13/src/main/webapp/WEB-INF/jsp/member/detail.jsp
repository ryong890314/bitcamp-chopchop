<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Page</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/js/jquery/jquery-2.2.4.min.js"></script>
  <style>
    .vali_check {
      color: red;
    }
    /*
    .photo1 {
	     width: auto; height: auto;
	     max-width: 100px;
	     max-height: 100px;
    }
    */
    .profile_photo {
	    position: relative;
	    width: 100px;
	    height: 100px;
    }
    
    .profile_photo .mask {
	    position: absolute;
	    z-index: 10;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    width: 100px;
      height: 100px;
	    background: url(/upload/member/my_photo.png) 0 0;
	 }
	 .imgThumb {
	   width: 100px;
	   height: 100px;
	 }
   
   .container {
     margin-bottom: 10px;
   }
	 
  </style>

</head>
<body onload="formLoad();">
<jsp:include page="../header.jsp"/>
<div class="container"> 
<h1>내정보</h1>
<form action='update' method='post' name="form" enctype='multipart/form-data' onsubmit="return checkAll();">
  <div class="row"> 
    <div class="col-4">
		    <div id='content'>
				  <div class="profile_photo">
				    <input type="hidden" id="photo2" value="${member.photo}" />
            <img id="imgThumb" class="imgThumb">
				    <span class="mask"></span>
				  </div>
				  <input type='file' id="file" name='file'><br>
	    </div>
    </div> 
    <div class="col-1"></div>
    <div class="col-7">
        번호 <input type='text' id='memberNo' name='memberNo' value='${member.memberNo}' readonly><br>
		    이메일 <input type='text' id='email' name='email' value='${member.email}' readonly><br>
		    비밀번호 <input type="button" name="pwUpdate" value="비밀번호 변경" data-toggle="modal" data-target="#exampleModal"/><br>
		    닉네임 <input type='text' name='nickname' value='${member.nickname}' maxlength="12" onblur="nickname_check();"><br>
		    <div id="nickname_chk" class="vali_check"></div>
		    핸드폰 번호 <input type='tel' name='tel' value='${member.tel}' maxlength="11" onblur="tel_check();"><br>
		    <div id="tel_chk" class="vali_check"></div>
		    우편번호 <input type='text' id="postNo" name='postNo' value='${member.postNo}'>
		  <input type="button" name="post_search" value="우편번호 찾기" onclick="myPostcode();"/><br>
		    기본주소 <input type='text' id="baseAddress" name='baseAddress' value='${member.baseAddress}'><br>
		    상세주소 <input type='text' id="detailAddress" name='detailAddress' value='${member.detailAddress}'><br>
		  <input type="hidden" id="nickname1" value="${member.nickname}"/> <!-- 원래 닉네임값  -->
		  <button>변경</button>
		  <a href="delete?no=${member.memberNo}" onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>
		</div>
  </div>
</form>
</div> 

<hr> 

<div class="container"> 
      <h1>My Pet 정보</h1>
  <div class="row"> 
    <div class="col-4">
      <div class="card" style="width: 18rem;">
        <img src="/upload/member/my_pet1.jpg" class="card-img-top" alt="...">
        <div class="card-body">
	        <h5 class="card-title">누렁이</h5>
	        <p class="card-text">이름: 누렁이 <br>성별: 암컷<br>나이: 3세</p>
	        <a href="#" class="btn btn-primary">구경가기</a>
        </div>
      </div>
    </div>
    <div class="col-4">
      <h1></h1>
      <div class="card" style="width: 18rem;">
        <img src="/upload/member/my_pet2.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">찰스</h5>
          <p class="card-text">이름: 찰스 <br>성별: 암컷<br>나이: 2세</p>
          <a href="#" class="btn btn-primary">구경가기</a>
        </div>
      </div>
    </div>
    <div class="col-4">
      <h1></h1>
      <div class="card" style="width: 18rem;">
        <img src="/upload/member/my_pet3.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">햄식이</h5>
          <p class="card-text">이름: 햄식이 <br>성별: 암컷<br>나이: 1세</p>
          <a href="#" class="btn btn-primary">구경가기</a>
        </div>
      </div>
    </div>
  </div> 
		<div class="row">
		<div class="col-3"></div>
		<div class="col-3"></div>
		<div class="col-3"></div>
		<div class="col-3"></div>
  </div> 
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            현재 비밀번호 <input type="password" id="nowPassword" name="nowPassword" onblur="nowpw_check();"/>
            <div id="password1_chk" class="vali_check"></div>
            새 비밀번호 <input type="password" id="newPassword"  name="newPassword" onblur="newpw_check();"/>
            <div id="password2_chk" class="vali_check"></div>
            새 비밀번호 확인<input type="password" id="newPassword2"  name="newPassword2" onblur="newpw2_check();"/>
            <div id="password3_chk" class="vali_check"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="changePw();">변경</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../footer.jsp"/>
<script>
  function changePw() {
	  var cnt = 0;
	  
	  if(nowpw_check()) {
		  cnt++;
	  }
	  if(newpw_check()) {
      cnt++;
    }
	  if(newpw2_check()) {
      cnt++;
    }
	  
	  // 업데이트 해줄 ajax memberNo, 변경할 패스워드
	  if(cnt == 3){
		  var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          if (xhr.responseText == "1") { // 1이면 변경완료, 0이면 변경 못함
            alert("변경완료 되었습니다.");
            $('#exampleModal').modal("hide"); 
            document.getElementById("nowPassword").value = "";
            document.getElementById("newPassword").value = "";
            document.getElementById("newPassword2").value = "";
          } else {
            alert("변경하지 못했습니다.");
          }
        } else {
          alert("시스템 오류 발생!");
        }
       }
      };
      xhr.open("POST", "uptPw", false);
      xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
      xhr.send("password=" + document.getElementById("newPassword").value 
    		  + "&memberNo=" + document.getElementById("memberNo").value);
	  }
	  
  }
  
  function nowpw_check() {
	  var pCheckFlag = false;
	  if (document.getElementById("nowPassword").value == "") {
	    document.getElementById("password1_chk").innerHTML = "비밀번호를 입력하세요.";
	  } 

	  // 비밀번호 정규식 검사 
	  if (document.getElementById("nowPassword").value != "") {
	    var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; 
		  if (!passwordRegExp.test(document.getElementById("nowPassword").value)) {
		    document.getElementById("password1_chk").innerHTML = "비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!";
		  } else {
			  var xhr = new XMLHttpRequest();
		      xhr.onreadystatechange = function() {
		        if (xhr.readyState == 4) {
		        if (xhr.status == 200) {
		          if (xhr.responseText == "0") { // 1이면 동일, 0이면 패스워드 틀림
		            document.getElementById("password1_chk").innerHTML = "패스워드를 다시 확인해주세요.";
		          } else {
		            document.getElementById("password1_chk").innerHTML = "";
		            pCheckFlag = true;
		          }
		        } else {
		          alert("시스템 오류 발생!");
		        }
		       }
		      };
		      xhr.open("POST", "chkPw", false);
		      xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		      xhr.send("password=" + document.getElementById("nowPassword").value 
		    		  + "&memberNo=" + document.getElementById("memberNo").value);
		  }
	  } 
	  return pCheckFlag;
	}
  function newpw_check() {
	  var pCheckFlag = false;
	  if (document.getElementById("newPassword").value == "") {
		  document.getElementById("password2_chk").innerHTML = "새 비밀번호를 입력하세요.";
	  }
	  
    // 비밀번호 정규식 검사 
    if (document.getElementById("newPassword").value != "") {
      var passwordRegExp = /^[a-zA-z0-9]{4,20}$/; 
    if (!passwordRegExp.test(document.getElementById("newPassword").value)) {
      document.getElementById("password2_chk").innerHTML = "비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!";
    } else {
      document.getElementById("password2_chk").innerHTML = "";
      pCheckFlag = true;
    }
   } 
   return pCheckFlag;
  }
  
  function newpw2_check() {
	  var p2CheckFlag = false;
    if (document.getElementById("newPassword2").value == "") {
       document.getElementById("password3_chk").innerHTML = "비밀번호 확인을 입력하세요.";
     } 
    
    // 비밀번호 & 비밀번호 확인이 같은 값인지 검사 
    if (document.getElementById("newPassword2").value != "") {
      if (document.getElementById("newPassword").value != document.getElementById("newPassword2").value) {
        document.getElementById("password3_chk").innerHTML = "두 비밀번호가 다릅니다.";
      } else {
        document.getElementById("password3_chk").innerHTML = "";
        p2CheckFlag = true;
      }
    } 
    return p2CheckFlag;
  }

  function formLoad() {
	  // hidden값을 이용해서 자바스크립트를 이용한 경우
	  if (document.getElementById("photo2").value == null 
			  || document.getElementById("photo2").value == ""){
		  document.getElementById("imgThumb").src = "/upload/member/info_photo.jpg";
	  } else {
	    document.getElementById("imgThumb").src = "/upload/member/" + document.getElementById("photo2").value;
	  }
  }
  
	function checkAll() {
		var checkCnt = 0;
		if (nickname_check()) {
			checkCnt++;
		}
		if (tel_check()) {
			checkCnt++;
		}
		return checkCnt == 2 ? true : false;
	}
	
  function nickname_check() {
    var nCheckFlag = false;
	  if (form.nickname.value == "") {
       document.getElementById("nickname_chk").innerHTML = "닉네임을 입력하세요.";
     } 
    // 닉네임 정규식 검사 
    var nRegPass = false;
    if (form.nickname.value != "") {
      var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,12}$/;
      if (!nicknameRegExp.test(form.nickname.value)) {
          document.getElementById("nickname_chk").innerHTML = "닉네임 형식이 올바르지 않습니다!";
      } else {
        nRegPass = true;
      }
    }
      
    // 닉네임 중복체크
    if(nRegPass) {
    	// 원래 닉네임과 동일하게 쓴다면 ajax 돌 필요도 없다.
    	if (form.nickname.value == form.nickname1.value) {
    		 document.getElementById("nickname_chk").innerHTML = "가입 가능한 닉네임입니다. ";
         nCheckFlag = true;
    	} else {
    		var xhr = new XMLHttpRequest();
  	      xhr.onreadystatechange = function() {
  	        if (xhr.readyState == 4) {
  	          if (xhr.status == 200) {
  	            // 0이면 가입 가능, 아니면 중복!
  	            if (xhr.responseText == "1") {
  	              document.getElementById("nickname_chk").innerHTML = "중복된 닉네임입니다.";
  	            } else {
  	              document.getElementById("nickname_chk").innerHTML = "가입 가능한 닉네임입니다. ";
  	              nCheckFlag = true;
  	            }
  	          } else {
  	            alert("시스템 오류 발생!");
  	          }
  	        }
  	      }
  	      // false는 동기식(Ajax 순서대로 진행하도록 동기식으로)
  	      xhr.open("GET", "dupN?nickname=" + form.nickname.value, false);
  	      xhr.send();
  	    }
    	}
      
    return nCheckFlag;
  }

  function tel_check() {
	  var tCheckFlag = false;
	  if (form.tel.value == "") {
      document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력하세요.";
    } 
	  // 핸드폰 번호 정규식 검사 
    if (form.tel.value != "") {
      var telRegExp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
      if (!telRegExp.test(form.tel.value)) {
       document.getElementById("tel_chk").innerHTML = "핸드폰 번호의 형식이 올바르지 않습니다.";
      } else {
        document.getElementById("tel_chk").innerHTML = "";
        tCheckFlag = true;
      }
    } 
   return tCheckFlag;
  }

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function myPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                console.log(data);
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postNo").value = data.postcode;
                document.getElementById("baseAddress").value = data.jibunAddress;
                document.getElementById("detailAddress").value = "";
                
            }
        }).open();
    }

  // 사진 미리보기 
  document.getElementById("file").onchange = function () {
    var reader = new FileReader();
    reader.onload = function (e) {
        document.getElementById("imgThumb").src = e.target.result;
    };
    reader.readAsDataURL(this.files[0]);
};
</script>

</body>
</html>