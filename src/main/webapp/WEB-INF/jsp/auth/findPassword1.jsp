<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <script>
   $("#mailselect").change(function() {
         var dp = document.getElementById("mail1");
         dp.style.display = "block";
         
         if($("#mailselect option:selected").val() == "") {
             dp.readOnly = false;
             $('#email_check').text("");
             $("#submit").attr("disabled", false);
           } else if($("#mailselect option:selected").val() == "메일 선택") {
                dp.readOnly = true;
                $('#email_check').text('이메일을 입력해주세요 :)');
                $('#email_check').css('color', 'red');
                $("#submit").attr("disabled", true);
            } else {
               dp.readOnly = true;
               $('#email_check').text("");
               $("#submit").attr("disabled", false);
            }
   });
   </script>
</body>
</html>