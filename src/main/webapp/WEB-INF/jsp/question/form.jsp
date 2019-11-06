<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>CHOPCHOP 문의게시판</title>
<!--   <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> -->
<!--   <link rel='stylesheet' href='/css/common.css'> -->
<link rel="stylesheet" href="/css/member/style_contact.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

<!-- <div id='content'>
<h1>문의게시판</h1>
<hr>
<form action='add' method='post'>
  <input type="email" id="email" name="email" placeholder="이메일"/>
  <input type="text" id="title" name="title" placeholder="제목"/><br>
  <textarea name='contents' rows='5' cols='50' placeholder="문의사항을 적어주세요."></textarea><br>
  <button>등록</button> 
</form>
</div> -->


<div class="contact-form-area mb-70">
  <h4 class="mb-50">문의게시판</h4>
  <form id="firstForm" action="add" method="POST">
    <div class="row">
      <div class="col-lg-6">
        <div class="form-group">
          <input type="text" name="title" class="form-control" id="title" placeholder="제목">
        </div>
      </div>
      <div class="col-lg-6">
        <div class="form-group">
          <input type="email" class="form-control" name="email" id="email" placeholder="E-mail">
        </div>
      </div>
      <div class="col-12">
        <div class="form-group">
          <textarea name="contents" class="form-control" id="contents"
          cols="40" rows="10" placeholder="문의사항을 적어주세요."></textarea>
        </div>
      </div>
      <div class="col-2">
        <button>등록</button> 
      </div>
      <div class="col-10">
      </div>
    </div>
  </form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>

