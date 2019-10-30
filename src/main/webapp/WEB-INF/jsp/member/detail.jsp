<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Page</title>
  <link rel="stylesheet" href="/css/member/style_detail.css">
  <link rel="stylesheet" href="/node_modules/jquery-ui-dist/jquery-ui.css">
  <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">

</head>
<body onload="formLoad();">

<%-- <jsp:include page="../header.jsp"/> --%>
<div class="container"> 
<h1>내정보</h1>
<form action='update' method='post' name="form" enctype='multipart/form-data' onsubmit="return checkAll();">
  <div class="row"> 
    <div class="col-5">
		    <div id='content'>
				  <div class="profile_photo">
				    <input type="hidden" id="photo2" value="${member.photo}" />
            <img id="imgThumb" class="imgThumb">
				    <span class="mask"></span>
				  </div>
				  <input type='file' id="file" name='file'><br>
	    </div>
    </div> 
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
		</div>
  </div>
</form>
</div> 

<hr> 

<div class="container"> 
<h1>My Pet 정보</h1>

<div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="/upload/member/my_pet1.jpg" class="d-block" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>누렁이</h5>
          <p>♂ 5세</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="/upload/member/my_pet2.jpg" class="d-block" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>찌글이</h5>
          <p>♀ 4세</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="/upload/member/my_pet3.jpg" class="d-block" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>carousel-item</h5>
          <p>♂ 2세</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<hr>
<div class="container">
  <div class="row">
    <div class="col-12">
      <a href="delete?no=${member.memberNo}" onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>
    </div>
  </div>
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
            현재 비밀번호 <input type="password" id="nowPassword" name="nowPassword" onblur="nowpw_check();" maxlength="15"/>
            <div id="password1_chk" class="vali_check"></div>
            새 비밀번호 <input type="password" id="newPassword"  name="newPassword" onblur="newpw_check();" maxlength="15"/>
            <div id="password2_chk" class="vali_check"></div>
            새 비밀번호 확인<input type="password" id="newPassword2"  name="newPassword2" onblur="newpw2_check();" maxlength="15"/>
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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/node_modules/jquery-ui-dist/jquery-ui.min.js"></script>
<script src="/node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
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
	    var passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		  if (!passwordRegExp.test(document.getElementById("nowPassword").value)) {
		    document.getElementById("password1_chk").innerHTML = "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
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
      var passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
    if (!passwordRegExp.test(document.getElementById("newPassword").value)) {
      document.getElementById("password2_chk").innerHTML = "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
    } else {
      document.getElementById("password2_chk").innerHTML = "안전한 비밀번호입니다.";
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