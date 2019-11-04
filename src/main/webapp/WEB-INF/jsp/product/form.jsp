<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
  <title>상품 등록폼</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
  
  <style>
  
    #content {
      width: 1100px;
      padding-top: 10px;
      margin: auto auto;
    }
  </style>
  
</head>
<body>
  <jsp:include page="../header.jsp"/>
  <div id='content'>
    <h1>상품 등록폼</h1>
    <form action='add' method='post' enctype='multipart/form-data'>
      상품명: <input type='text' name='title'><br>
      가격: <input type='text' name='price'><br>
      상품상세: <textarea name='detail'></textarea><br>
      재고: <input type='text' name='stock'><br>
      할인율: <input type='text' name='discount'><br>
      상품분류: <select name='category'>
        <option id='category1' value='food'>식품</option>
        <option id='category2' value='train'>훈련/장난감</option>
        <option id='category3' value='home'>식기/집/이동장</option>
        <option id='category4' value='sanitary'>목욕/미용/위생</option>
      </select><br>
      동물분류: <select name='species'>
        <option id='1' value='dog'>강아지</option>
        <option id='2' value='cat'>고양이</option>
        <option id='3' value='bird'>새</option>
        <option id='4' value='fish'>물고기</option>
        <option id='5' value='small animal'>작은 동물</option>
        <option id='6' value='reptile'>파충류</option>
      </select><br>
      옵션: <div id="optionForm"><input type="text" name="options"></div>
      대표 사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      사진: <input type='file' name='filePath'><br>
      <button>등록</button>
    </form>
    <button id="addOption">추가</button><br><br>
  </div>
  <jsp:include page="../footer.jsp"/>
  <script id="str">
    '<input type="text" name="options">'
  </script>
  <script>
    "use strict"
    var html = $('#str').html;
    $('#addOption').on('click', function() {
      $('#optionForm').append(str);
    })
  </script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
  crossorigin="anonymous"></script>
</body>
</html>