<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>문의게시판</title>
  <link rel="stylesheet" href="/css/member/style_contact.css">
  <link rel="stylesheet" href="/css/member/style_footer.css">
<style type="text/css">
.sub-btn {
  width: 350px;
  height: 40px;
  display: flex;
  margin: 50px auto !important;
  align-items: center;
  justify-content: space-around;
  border: 2px solid #b0c364;
  background-color: white;
  cursor: pointer;
  color: #b0c364;
  
}

.sub-btn:hover {
  background-color: #b0c364;
  color: white;
}

</style>
</head>
<body>

<jsp:include page="../header.jsp"/>

  <!-- ##### Contact Area Start ##### -->
  <section>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-lg-8 col-xl-9">
          <div class="contact-content mb-100">
            <h3 class="mb-50">문의게시판</h3>
              <form action='update' method='post'>
                번호 <input type="text" name="no" value="${question.no}" readonly><br>
                이메일 <input type="email" id="email" name="emial" value="${question.email}" readonly/>
                제목 <input type="text" id="title" name="title" value="${question.title}"/><br>
                내용 <textarea name='contents' rows='5' cols='50'>${question.contents}</textarea><br>
                조회수 ${question.viewCount}
                <button class="sub-btn">변경</button>
                <a href="delete?no=${question.no}" >게시글 삭제</a> 
              </form>
          </div>
        </div>
      </div>
    </div>
  </section>

<jsp:include page="../footer.jsp"/>
</body>
</html>