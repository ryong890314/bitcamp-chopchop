<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Comment Area Start -->
  <div class="comment_area mb-100">
    <h4 class="mb-50">상품 문의</h4>
    <c:forEach items="${comments}" var = "comment">
    <div>
      <ol>
        <!-- Single Comment Area -->
        <li class="single_comment_area" id="isComment">
          <!-- Comment Content -->
          <div class="comment-content d-flex">
            <!-- Comment Author -->
              <div class="comment-author">
                <span class="member-no" style="display:none">${comment.member.memberNo}</span>
                <p><span id="memberName" style="font-size:14px;">${comment.member.nickname}</span></p>
              </div>
            <!-- Comment Meta -->
            <div class="comment-meta">
              <div class="d-flex">
                <a class="comment-no" style="display:none;">${comment.commentNo}</a>
                <a class="update-title">${comment.title}</a>
                <a class="post-date">${comment.createdDate}</a>
                <button style="display:none;" class="reply">수정</button>
                <button style="display:none;" class="comment-delete-btn">삭제</button>
                <button class="comment-answer-btn" style="display:none">답변</button>
              </div>
                <p class="update-content">${comment.content}</p>
            </div>
          </div><hr style="width:1100px;">
        </li>
      </ol>
      </div>
    </c:forEach>
    <div id="fuck"></div>
    <div class="post-a-comment-area mb-30" id="append-comment">
      <h4 class="mb-50">Leave a reply</h4>
      <div class="contact-form-area">
        <form>
          <div id="abc">
            <input type='hidden' name='productNo' id='productNo' value='${product.productNo}'>
            <input type='hidden' name='memberNo' id="memberNo"value='${loginUser.memberNo}'>
            <div class="col-12 col-lg-6">
              <input type="text" name='title' class="form-control" id="title" placeholder="title" required>
            </div>
            <div class="col-12">
              <textarea name='content' class="form-control" id="message" cols="30" rows="10" placeholder="Message" required></textarea>
            </div>
            <div class="col-12">
              <button id="comment-submit" class="btn bueno-btn mt-30" type="button">Submit Comment</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
