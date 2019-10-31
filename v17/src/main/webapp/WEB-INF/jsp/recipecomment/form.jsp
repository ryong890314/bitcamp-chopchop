<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<html>
<head>


  <title>댓글 등록폼</title>
<!-- Stylesheet -->
<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet" href="/css/recipe/detail.css">
</head>
<body>
  
    
    
    
    
 
 <div class="comment_area mb-30">
    <h4 class="mb-50">댓글입력</h4>

    <!-- Reply Form -->
    <div class="contact-form-area">
      <form action='../recipecomment/add' method='post'>
       <div class="row">
         <div class="col-12 col-lg-6">
          <input type='hidden' name='memberNo'value='${recipeComment.memberNo}' readonly>
         </div>
         <div class="col-12 col-lg-6">
           <input type='text' name='recipeNo' value='${recipeComment.commentNo}' readonly><br>
           <input type="text" name="nickname" value="${loginUser.nickname}" readonly></div>
         </div>
        <div class="col-12">
          <textarea name='content' class="form-control" id="message" rows='10' cols='30' placeholder="Message"></textarea>
          </div>
        <div class="col-12">  
          <button class="btn bueno-btn mt-30" type="submit">Submit Comment</button>
        </div>
        </div>
      </form>
    </div>
  </div>


 
  <div class="comment_area mb-100">
    <h4 class="mb-50">댓글 목록</h4>
    <ol>
      <!-- Single Comment Area -->
      <c:forEach items="${recipe.comments}" var="recipeComment">
        <li class="single_comment_area" id="isComment">
          <!-- Comment Content -->
          <div class="comment-content d-flex">
            <!-- Comment Author -->
            <div class="comment-author">
              <img src="/img/bg-img/person.png" alt="author" width="70px">
            </div>
            <!-- Comment Meta -->
            <div class="comment-meta">
              <div class="d-flex">
                <a href="#" class="post-author"  >${recipeComment.commentNo} </a>
                <a href="#" class="post-author"  >${member.nickname} </a>
                 <%-- <input type='text' name='member.nickname' value='${recipeComment.member.nickname}' readonly> --%>
                 <a href="#" class="post-date" >${recipeComment.createdDate}</a>
                 <a href="../recipecomment/detail?no=${recipeComment.commentNo}" class="reply">수정</a>
              </div>
              <p>${recipeComment.content}</p>
            </div>
          </div>
        </li>
      </c:forEach>
    </ol>
  </div>




</body>
</html>
