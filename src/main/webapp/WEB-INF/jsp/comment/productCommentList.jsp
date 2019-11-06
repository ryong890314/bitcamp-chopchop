<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
  <title>상품문의</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
</head>
<body>
<!--   <div id='comment'> -->
<!--     <table class='table table-hover'> -->
<!--       <tr> -->
<!--         <th>작성자</th> -->
<!--         <th>제목</th> -->
<!--         <th>내용</th> -->
<!--         <th>작성일</th> -->
<!--       </tr> -->
<%--       <c:forEach items="${comments2}" var="comment"> --%>
<!--         <tr> -->
<%--           <td>${comment.member.nickname}</td> --%>
<%--           <td><span id='title'>${comment.title}</span></td> --%>
<%--           <td>${comment.content}</td> --%>
<%--           <td>${comment.createdDate}</td> --%>
<!--         </tr> -->
<%--       </c:forEach> --%>
<!--     </table> -->
<!--   </div> -->
  
  <!--       <div class="col-12 col-lg-8 col-xl-9"> -->
        <!-- Comment Area Start -->
        <div class="comment_area mb-100">
          <h4 class="mb-50">상품 문의</h4>
          <c:forEach items="${comments}" var = "comment">
            <ol>
              <!-- Single Comment Area -->
              <li class="single_comment_area" id="isComment">
                <!-- Comment Content -->
                <div class="comment-content d-flex">
                  <!-- Comment Author -->
                    <div class="comment-author">
                      <p><span id="memberName" style="font-size:14px;">${comment.member.nickname}</span></p>
                    </div>
                  <!-- Comment Meta -->
                  <div class="comment-meta">
                      <div class="d-flex">
                        <a href="#" class="post-author">${comment.title}</a>
                        <a href="#" class="post-date">${comment.createdDate}</a>
                        <a href="../comment/updateform?no=${comment.commentNo}" class="reply">수정</a>
                      </div>
                      <p>${comment.content}</p>
                  </div>
                </div><hr style="width:1100px;">
              </li>
            </ol>
          </c:forEach>
        </div>
  
  
  <script type="text/javascript">
    var title = document.getElementById('title');
    var content = document.getElementById('content');
    for(var e of content) {
      e.style['display']=hidden;
    }
    
    function getParameterByName(name, url) {
      if (!url) url = window.location.href;
      name = name.replace(/[\[\]]/g, "\\$&");
      var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
          results = regex.exec(url);
      return results[2];
    }
  
    var productNo = getParameterByName('no');
    document.getElementById('productNo').value=productNo;




  </script>
</body>
</html>