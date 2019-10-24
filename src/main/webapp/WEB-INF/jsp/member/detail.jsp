<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>My Page</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
  <link rel="stylesheet" href="/css/style.css">
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<jsp:include page="../header.jsp"/>
    
<div id='content'>
<h1>내정보</h1>
<form action='update' method='post' enctype='multipart/form-data'>
  <img src='/upload/member/${member.photo}' class='photo1'><br> 
  <input type='file' name='file'><br>
    번호: <input type='text' name='memberNo' value='${member.memberNo}' readonly><br>
    이메일: <input type='text' name='email' value='${member.email}'><br>
    비밀번호: <input type='password' name='password' value='${member.password}'>
  <input type="button" name="pwUpdate" value="비밀번호 변경" onclick="passwordPopup();"/>  
    <br>
    닉네임: <input type='text' name='nickname' value='${member.nickname}'><br>
    핸드폰 번호: <input type='tel' name='tel' value='${member.tel}'><br>
    우편번호: <input type='text' id="postNo" name='postNo' value='${member.postNo}'>
  <input type="button" name="post_search" value="우편번호 찾기" onclick="sample4_execDaumPostcode();"/>  
    <br>
    도로명주소: <input type='text' id="baseAddress" name='baseAddress' value='${member.baseAddress}'><br>
    상세주소: <input type='text' id="detailAddress" name='detailAddress' value='${member.detailAddress}'><br>
  <button>변경</button>
  <a href='delete?no=${member.memberNo}'>삭제</a>
</form>
</div>

<jsp:include page="../footer.jsp"/>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
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
    
   
</script>
   
<script type="text/javascript">
function passwordPopup() {
    // window.open("pwUpdate.jsp", "pwupdate", "width=500, height=500, top=100, left=850");
    window.open("aaaa.html", "aaaa", "width=500, height=500, top=100, left=850");
  }
</script>
</body>
</html>
