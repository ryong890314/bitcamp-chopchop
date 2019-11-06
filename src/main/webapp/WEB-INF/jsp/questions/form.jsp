<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CHOPCHOP 문의게시판</title>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
<link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>게시물 등록폼</h1>
<form action='add' method='post'>
내용 : <textarea name='contents' rows='5' cols='50'></textarea><br>
<button>등록</button>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>

<!-- Contact Form Area -->
 <div class="contact-form-area mb-70">
   <h4 class="mb-50">Get In Touch</h4>
   <form id="firstForm" onsubmit="return proceedSubmission()" action="sendMail" method="POST">
     <div class="row">
       <div class="col-lg-6">
         <div class="form-group">
           <input type="text" class="form-control" id="name" 
             placeholder="이름">
         </div>
       </div>
       <div class="col-lg-6">
         <div class="form-group">
           <input type="email" class="form-control" id="email" 
             placeholder="E-mail">
         </div>
       </div>
       <div class="col-12">
         <div class="form-group">
           <textarea name="message" class="form-control" id="message"
             cols="40" rows="10" placeholder="문의사항을 적어주세요."></textarea>
         </div>
       </div>
       <div class="col-2">
<!--                     <button type="submit" class="btn">전송</button> -->
         <input type="submit" class="btn" value="전송">
       </div>
       <div class="col-10">
       </div>
     </div>
   </form>
 </div>
</body>
</html>

