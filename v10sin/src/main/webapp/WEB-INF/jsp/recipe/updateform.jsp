<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  div {
    border: 1px solid black;
  }
  
  .photo {
    height: 120px;
  }
</style>
<title>레시피 수정</title>
</head>
<body>

<div id='content'>
<h1>레시피 수정하기</h1>

<form action='update' method='post' enctype='multipart/form-data'>
번호: <input type='text' name='no' value='${recipe.recipeNo}' readonly><br>
회원번호:${recipe.memberNo}<br>
제목: <input type='text' name='title' value='${recipe.title}'><br>
작성일: ${recipe.createdDate}<br>
조회수: ${recipe.viewCount}<br>
내용: <input type='text' name='content' value='${recipe.content}'><br>
대표사진: <input type='file' name='filePath'><br>
<img src='/upload/recipe/${recipe.thumbnail}' class='photo'>
카테고리:<input type='text' name='category' value='${recipe.category}'><br>
기타정보:<input type='text' name='otherInfo' value='${recipe.otherInfo}'><br>

<c:forEach items="${recipe.ingredients}" var="ingredient">
  재료: <input type='text' name='ingredientNames' value='${ingredient.name}'> 
  용량<input type='text' name='quantity' value='${ingredient.quantity}'><br>
  <!-- 
재료: ${ingredient.name} 
용량: ${ingredient.quantity}<br>
 -->
</c:forEach>
<c:forEach items="${recipe.cookings}" var="cooking">
  순서: <input type='text' name='processNo' value='${cooking.processNo}'> 
  사진:<input type='file' name='filePath2' value='${cooking.filePath}'>
      <img src='/upload/recipe/${cooking.filePath}' class='photo'>
  내용: <input type='text' name='cookingContent' value='${cooking.content}'><br>
</c:forEach>
태그:<input type='text' name='tag' value='${recipe.tag}'><br>

<button>수정</button>
<a href='delete?no=${recipe.recipeNo}'>삭제하기</a>
</form>

</div>

</body>
</html>