<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="bitcamp.chopchop.domain.RecipeComment"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>댓글 수정·삭제</title>

</head>

<body>

<div id='content'>
<h1>댓글 수정·삭제</h1>

<form action='update' method='post'>
     댓글번호:     <input type='text' name='commentNo' value='${recipeComment.commentNo}' readonly><br>
    레시피번호: <input type='text' name='recipeNo' value='${recipeComment.recipeNo}' readonly><br>
    회원번호: <input type='text' name='memberNo' value='${recipeComment.memberNo}' readonly><br>
    작성자: ${recipeComment.member.nickname} <br>
    내용 : <textarea name='content' rows='5'  cols='50'>${recipeComment.content}</textarea><br>
    작성일:${recipeComment.createdDate}<br>
            
            
            <button>변경</button>
            <a href='delete?no=${recipeComment.commentNo}'>삭제</a>
    </form>
</div>
</body>

</html>
