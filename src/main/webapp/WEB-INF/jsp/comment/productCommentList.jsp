<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <span class="member-no" style="display:none">${comment.member.memberNo}</span>
                <p><span id="memberName" style="font-size:14px;">${comment.member.nickname}</span></p>
              </div>
            <!-- Comment Meta -->
            <div class="comment-meta">
                <div class="d-flex">
                  <span class="comment-no" style="display:none;">${comment.commentNo}</span>
                  <a href="#" class="post-author">${comment.title}</a>
                  <a href="#" class="post-date">${comment.createdDate}</a>
                  <button style="display:none;" class="reply">수정</button>
                </div>
                <p>${comment.content}</p>
            </div>
          </div><hr style="width:1100px;">
        </li>
      </ol>
    </c:forEach>
  </div>
  