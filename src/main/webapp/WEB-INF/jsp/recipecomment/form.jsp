<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>

  <title>댓글 등록폼</title>
  <link rel='stylesheet' href='/css/rrecipe/common.css'>
<link rel='stylesheet' href='/css/rrecipe/style.css'>
</head>
<body>
    
<div id='recipemain'>
<h1>댓글 등록폼</h1>
<form action='add' method='post'>
  회원번호: <input type='text' name='memberNo'><br>
  레시피번호: <input type='text' name='recipeNo'><br>
<textarea name='content' rows='5' cols='50'>댓글 입력</textarea><button>등록</button><br>


  
</form>
</div>




</body>
</html>
