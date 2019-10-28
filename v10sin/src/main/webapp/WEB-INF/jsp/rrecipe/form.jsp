<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>레시피 등록폼</title>
  <link rel='stylesheet' href='/css/rrecipe/common.css'>
<link rel='stylesheet' href='/css/rrecipe/style.css'>
</head>
<body>

    
<div id='recipemain'>
<h1>레시피 등록폼</h1>
<form action='add' method='post' enctype='multipart/form-data'>
 사진: <input type='file' name='file'><br>
  레시피명: <input type='text' name='title'><br>
  간단소개 : <textarea name='content' rows='5' cols='50'></textarea><br>
  카테고리: <input type='text' name='category'><br>
  기타정보: <input type='text' name='otherInfo'><br>
  조회수: <input type='text' name='viewCount'><br>
 회원번호: <input type='text' name='memberNo'><br>
  태그: <input type='text' name='tag'><br>
  
  <button>등록</button>
</form>
</div>




</body>
</html>
