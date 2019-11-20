<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>ChopChop-Add My Pet</title>
<link rel='stylesheet'
  href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
  integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
  crossorigin='anonymous'>

</head>
<body>

  <jsp:include page="../header.jsp" />

  <div id='content'>
    <h1>Register My Pet</h1>
    <form action='add' method='post' enctype='multipart/form-data'>
      <!-- Photo: <input type='file' name='photo'><br> -->
      My Pet Name: <input type='text' name='name'><br> Age:
      <input type='text' name='age'><br> Register Number: <input
        type='text' name='registerNo'><br> Gender: <input
        type='text' name='gender'><br>
      <button>Add My Pet</button>
    </form>
  </div>

  <jsp:include page="../footer.jsp" />

<script>
/* 사진 미리보기 */
document.getElementById("file").onchange = function() {
  var reader = new FileReader();
  reader.onload = function(e) {
      document.getElementById("imgThumb").src = e.target.result;
  };
  reader.readAsDataURL(this.files[0]);
};
</script>
</body>
</html>
