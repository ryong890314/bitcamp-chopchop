<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><title>로그인 폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/signin.css'>
</head>
<body>
<jsp:include page="../header.jsp"/>
    
    <div class="bucket">
        <div class="buffer">
            <div class="header">
                <div class="logo-area">
                </div>
            </div>
            <form action='login' method='post'>
                <label for="email">이메일</label>
                <input type="email" name="email" value='${cookie.email.value}' required/>
                <label for="password">비밀번호</label>
                <input type="password" name="password" required/>

                <input class="btn" type="submit" value="로그인" />
                <input class="btnn" type="submit" value="회원가입" />
            </form>
        </div>
    </div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
