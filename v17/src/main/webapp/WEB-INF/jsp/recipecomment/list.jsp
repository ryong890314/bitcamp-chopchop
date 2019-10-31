<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='/css/recipe/common.css'>
<link rel='stylesheet' href='/css/recipe/style.css'>
<title>댓글 목록</title>
<link rel='stylesheet' href='/css/style.css'>
</head>
<body>
				
<div id='comment'>
<h1>댓글 목록</h1>
<table class='table table-hover'>

<tr>
  <th>댓글번호</th>
  <th>내용</th>
  <th>작성자</th>
  <th>작성일?</th>
  <th>작성자</th>
</tr>
<%-- <c:forEach items="${recipe.comments}" var="RecipeComment"> --%>
<%-- <c:forEach items="${recipeComments}" var="recipeComment"> --%>
<c:forEach items="${recipeComments}" var="recipeComment">
  <tr>
    <td>${recipeComment.commentNo}</td>
    <td><a href='detail?no=${recipeComment.commentNo}'>${recipeComment.content}</a></td>
    <td>${recipeComment.member.nickname}</td>
    <td>${recipeComment.createdDate}</td>
  </tr>
</c:forEach>
</table>
</div>
	
	
	<%-- 
	<c:forEach items="${recipeComments}" var="recipeComment">
  <tr>
    <td>${recipeComment.commentNo}</td>
    <td><a href='detail?no=${recipeComment.commentNo}'>${recipeComment.content}</a></td>
    <td>${recipeComment.member.nickname}</td>
    <td><input type="text" name="nickname" class="form-control" value="${recipeComment.loginUser.nickname}" readonly></td>
    <td>${loginUser.nickname}</td>
    <td><input type="text" name="nickname" class="form-control" placeholder="${loginUser.nickname}" value=""></td>
    <td>${recipeComment.createdDate}</td>
    <td>${loginUser.nickname}</td>
  </tr>
</c:forEach>
</table>
</div>
	 --%>
	
	
	   <%--     <a href="#" class="post-author"  >${loginUser.nickname} </a>
                <a href="#" class="post-author"  >${recipeComment.member.nickname} </a>
                 <input type='text' name='member.nickname' value='${recipeComment.member.nickname}' readonly>
                 <a href="#" class="post-date" >${RecipeComment.createdDate}</a>
                 <a href="../recipecomment/detail?no=${RecipeComment.commentNo}" class="reply">수정</a>
              </div>
              <p>${RecipeComment.content}</p>
	 --%>
	
	
	<%-- <c:forEach items="${recipeComments}" var="recipeComment">
  <tr>
    <td>${recipeComment.commentNo}</td>
    <td><a href='detail?no=${recipeComment.commentNo}'>${recipeComment.content}</a></td>
    <td>${recipeComment.member.nickname}</td>
    <td>${recipeComment.createdDate}</td>
  </tr>
</c:forEach> --%>
	
	

</body>
</html>

