<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Contact Form Area -->
 <div class="contact-form-area mb-70">
   <h4 class="mb-50">Get In Touch</h4>
   <p>고객님의 의견을 E-MAIL로 보내주세요.</p> 
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
         <a href="mailto:test@test.com">관리자 문의</a>
       </div>
     </div>
   </form>
 </div>
</body>
</html>