<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>펫 등록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>펫 등록</h1>
<form action='add' method='post' enctype='multipart/form-data'>

사진 :            <div class="col-5">
            <div id='content'>
              <div class="profile_photo">
                <input type="hidden" id="photo2" value="${pet.photo}" /> <img
                  id="imgThumb" class="imgThumb"> <span class="mask"></span>
              </div>
              <div style="display: none;">
                <input type='file' id="file" name='file' />
              </div>
              <label id="label" for="file">사진 변경</label>
            </div>
          </div>
          
펫 이름: <input type='text' name='name'><br>
등록 번호: <input type='text' name='registNo'><br>
품종: <input type='text' name='password'><br>
성별
나이
<%-- created DAte --%>
<button>등록</button>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
