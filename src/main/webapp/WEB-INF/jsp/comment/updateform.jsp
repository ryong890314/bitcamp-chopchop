<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
  <title>문의 수정폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>
  <div id='content'>
    <h1>문의 수정폼</h1>
    <form action='update' method='post'>
      번호: <input type='text' name='commentNo' id='commentNo' value='' readonly><br>
      제목: <input type='text' name='title' value='${comment.title}'><br>
      내용: <textarea name='content' >${comment.content}</textarea><br>
      <input type='hidden' name='productNo' value='${comment.productNo}'>
      <input type='hidden' name='memberNo' value=1 readonly><br>
      <button>수정</button>
    </form>
    <form action='../comment/commentDelete'>
      <input type='hidden' name='no'  value='${comment.commentNo}'>
      <input type='hidden' name='productNo' value='${comment.productNo}'>
      <button>삭제</button>
    </form>
  </div>
  <script>
    function getParameterByName(name, url) {
      if (!url) url = window.location.href;
      name = name.replace(/[\[\]]/g, "\\$&");
      var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
          results = regex.exec(url);
      return results[2];
    }
  
    var productNo = getParameterByName('no');
    document.getElementById('commentNo').value=productNo;
  </script>
</body>
</html>