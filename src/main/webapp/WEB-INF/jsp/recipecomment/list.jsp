<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8 col-xl-9">
                    <div class="comment_area mb-100 my-commentList">
                        <h4 class="mb-50">Comments</h4>
                        <ol class="commentList">
                            <c:forEach items="${recipeComments}" var="recipeComment">
                            <li class="single_comment_area">
                                <div class="comment-content d-flex">
                                    <div class="comment-author">
                                        <img src="img/bg-img/32.jpg" alt="author">
                                    </div>
                                    <div class="comment-meta">
                                        <div class="d-flex">
                                            <a href="#" class="post-author">${recipeComment.memberNo}</a>
                                            <a href="#" class="post-date">${recipeComment.createdDate}</a>
                                            <a href="#" class="reply">수정</a>
                                        </div>
                                        <p>${recipeComment.content}</p>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                        </ol>
                    </div>

                    <div class="post-a-comment-area mb-30">
                        <h4 class="mb-50">Leave a reply</h4>
                        <!-- Reply Form -->
                        <div class="contact-form-area">
                            <form id='commentForm' name='commentForm'>
                                <div class="row">
                                    <div class="col-12 col-lg-12">
                                        <input type="text" class="form-control" name="no" value="${recipe.recipeNo}">
                                        <input type="text" class="form-control" value="${viewer.nickname}" readonly>
                                    </div>
                                    <div class="col-12">
                                        <textarea name="content" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button id="addCommentBtn" type="button" class="btn bueno-btn mt-30">Submit Comment</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
<script id="t1" type="commentHtml">
<li class='single_comment_area'>
<div class='comment-content d-flex'>
    <div class='comment-author'>
    <img src='img/bg-img/32.jpg' alt='author'>
    </div>
  <div class='comment-meta'>
    <div class='d-flex'>
      <a href='#' class='post-author'>{{member.nickname}}</a>
      <a href='#' class='post-date'>{{recipeComment.createdDate}}</a>
      <a href='#' class='reply'>수정</a>
    </div>
    <p>{{recipeComment.content}}</p>
  </div>
</div>
</li>
</script>

<script>
"use strict";
var dbody = $('.commentList');
var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);

function addComment(data) {
  dbody.append(template(data));
};
</script>

<script>
"use strict";
$('#addCommentBtn').on('click', function() {
  var comment = $('#commentForm').serialize(); // recipeNo=32&content=ddd
  $.post("/app/json/recipecomment/add", comment, function(data) {
    if(data.state == 'success') {
      console.log(data.result); // member.memberNo, member.nickname
      // recipeComment.content, recipeComment.createdDate
      
      addComment(data.result);
    }
  });
});

</script>
