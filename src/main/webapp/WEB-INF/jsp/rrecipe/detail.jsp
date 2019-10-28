<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bitcamp.chopchop.domain.RRecipe"%>
<html>
<head>
    <title>레시피 상세</title>
  <link rel='stylesheet' href='/css/style.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
  <link rel="stylesheet" href="/css/style_contact.css">
  <link rel="stylesheet" href="/css/style_footer.css">
  <link rel='stylesheet' href='/css/rrecipe/common.css'>
  
  <style>

    #jumbotron.jumbotron-fluid {
      background-color:white;
      
    }

    #header {
      width: 1100px;
      margin: 0 auto;
    }

    #productBody {
      width: 1100px;
      padding-top: 10px;
      margin: auto auto;
      /*
      text-align: center;
      vertical-align: middle;
      */ 
    }

    #footer {
      background-color: #524845;
      color: #ffffff;
      height: 40px;
      width: 1100px;
      text-align: center;
      vertical-align: middle;
      padding-top: 10px;
      margin: auto auto;
      clear: left; 
      }
  </style>
</head>

<body>

<jsp:include page="../header.jsp"/>

<div id='recipemain'>
<h1>레시피 상세</h1>
<form action='update' method='post' enctype='multipart/form-data'>
<img src='/upload/rrecipe/${rrecipe.thumbnail}' style=size:100px; class='photo2'>
<input type='file' name='file'><br>
            스크랩: <input type='text' name='scrap' value='${rrecipe.scrap}'><br>
            레시피명: <input type='text' name='title' value='${rrecipe.title}'><br>
            내용 : <textarea name='content' rows='5' cols='50'>${rrecipe.content}</textarea><br>
            <%-- 작성자 : ${rrecipe.member.nickname}<br> --%>
            조회수: ${rrecipe.viewCount}<br>
            가입일: ${rrecipe.createdDate}<br>
            기타정보: <input type='text' name='otherInfo' value='${rrecipe.otherInfo}'><br>
            레시피번호: <input type='text' name='recipeNo' value='${rrecipe.recipeNo}' readonly><br>
            태그: <input type='text' name='tag' value='${rrecipe.tag}'><br>
            <button>변경</button>
            <a href='delete?no=${rrecipe.recipeNo}'>삭제</a>
    </form>
    <br>
    <br>
</div>




<div id='recipemain'>
<h1>댓글 등록폼</h1>
<form class="answer-write" action='../recipecomment/add' method='post'>
  <input type='hidden' name='memberNo'  value='${recipeComment.memberNo}' readonly>
   <input type='hidden' name='recipeNo' value='${recipeComment.commentNo}' readonly>
<textarea name='content' rows='5' cols='50' placeholder="댓글 입력"></textarea>
<input type="submit" value="댓글달기"/>


  
</form>
</div>

<div id='comment'>
<h1>댓글 목록</h1>
<table class='table table-hover'>
<tr>
  <th>댓글번호</th>
  <th>내용</th>
  <th>작성자</th>
  <th>작성일</th>
  <th>수정·삭제</th>
</tr>
<c:forEach items="${rrecipe.comments}" var="RecipeComment">
  <tr>
    <td>${RecipeComment.commentNo}</td>
    <td><a href='../recipecomment/detail?no=${RecipeComment.commentNo}'>${RecipeComment.content}</a></td>
    <td>미구현<%-- ${RecipeComment.nickname} --%></td>
    <td>${RecipeComment.createdDate}</td>
    <td><button id="btnUpdate" type="button" class="btn btn-primary my-view-group">변경</button></td>
  </tr>
</c:forEach>
</table>
</div>


<div id='content'>
<h1>댓글등록</h1>

<form>
<div class="form-group row my-view-group">
  <label for="fiCommentNo" class="col-sm-2 col-form-label">댓글번호</label>
  <div class="col-sm-10">
    <input type="text" readonly class="form-control-plaintext" 
      id="fiCommentNo">
  </div>
</div>

<div class="form-group row my-view-group">
  <label for="fiRecipeNo" class="col-sm-2 col-form-label">레세피번호</label>
  <div class="col-sm-10">
    <input type="text" readonly class="form-control-plaintext" 
      id="fiRecipeNo">
  </div>
</div>

<div class="form-group row my-view-group">
  <label for="staticCreatedDate" class="col-sm-2 col-form-label">등록일</label>
  <div class="col-sm-10">
    <input type="text" readonly class="form-control-plaintext" 
      id="staticCreatedDate">
  </div>
</div>

<div class="form-group row my-view-group">
  <label for="fiContent" class="col-sm-2 col-form-label">내용</label>
  <div class="col-sm-10">
  
    <textarea class="form-control" 
      id="fiContent" rows="5"></textarea>
  </div>
</div>


<div class="form-group row">
  <div class="col-sm-10">
<button id="btnUpdate" type="button" class="btn btn-primary my-view-group">변경</button>
</div>
</div>

<div class="form-group row">
  <div class="col-sm-10">
    <button id="btnAdd" type="button" class="btn btn-primary my-view-group">등록</button><br>
    <button id="btnUpdate" type="button" class="btn btn-primary my-view-group">변경</button>
    <button id="btnDelete" type="button" class="btn btn-danger my-view-group">삭제</button>
    <button id="btnList" type="button" class="btn btn-danger my-view-group">목록</button>
  </div>
</div>
</form>
</div>





<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/js/recipecomment/form.js"></script>












</body>
</html>
