<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
  <title>상품 등록폼</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel='stylesheet' href='/node_modules/jquery/dist/jquery.min.js'>
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
      <div>
        <label for="exampleInput">상품명</label>
        <input type='text' name='title' class="form-control"><br>
      </div>
      <div>
        <label for="exampleInput">가격</label>
        <input type='text' name='price' class="form-control"><br>
      </div>
      <div>
        <label for="exampleInput">상품상세</label>
        <textarea name='detail' class="form-control"></textarea><br>
      </div>
      <div>
        <label for="exampleInput">재고</label>
        <input type='text' name='stock' class="form-control"><br>
      </div>
      <div>
        <label for="exampleInput">할인율</label>
        <input type='text' name='discount' class="form-control"><br>
      </div>
      <div id="option-add-form">
        <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">옵션명</label>
          <input type="text" name="optionTitle" class="form-control"><br>
        </div>
        <div class="col-md-6">
          <label for="exampleInput">옵션가격</label>
          <input type="text" name="optionPrice" class="form-control"><br>
        </div>
        </div>
      </div>
        <button type="button" id="addOption" class="btn btn-success">옵션추가</button>
      <div class="row">
      <div class="col-md-6">
      동물분류 <select name='species' class="form-control optionselect">
        <option id='1' value='dog'>강아지</option>
        <option id='2' value='cat'>고양이</option>
        <option id='3' value='bird'>작은 친구들</option>
      </select><br>
      </div>
      <div class="col-md-6">
      상품분류 <select name='category' class="form-control optionselect">
        <option id='category1' value='food'>식품</option>
        <option id='category2' value='train'>훈련/장난감</option>
        <option id='category3' value='home'>식기/집/이동장</option>
        <option id='category4' value='sanitary'>목욕/미용/위생</option>
      </select><br>
      </div>
      </div>
      대표 사진: <input type='file' name='filePath'><br>
      <div id="photo-add-form">
      </div>
      <div>
      <button type="button" id="addPhoto" class="btn btn-success">사진추가</button>
      </div>
      <button class="btn btn-success">등록</button>
      <button class="btn btn-danger">취소</button>
    </form>
  </div>
  <jsp:include page="../footer.jsp"/>
  <script id="str">
    '<input type="text" name="options">'
  </script>
  <script id="option-form-template" type="text/x-handlebars-template">
    <div>
      <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">옵션명</label>
          <input type="text" name="optionTitle" class="form-control">
        </div>
        <div class="col-md-6">
          <label for="exampleInput">옵션가격</label>
          <input style="display:inline; location:absolute;" type="text" name="optionPrice" class="form-control">
          <button style="display:inline; float:right;" type="button" id="deleteOption" class="btn btn-danger">&times;</button>
        </div>
      </div>
    </div>
  </script>
  
  <script id="photo-form-template" type="text/x-handlebars-template">
    <div>
      사진: <input type='file' name='filePath'>
      <button type="button" id="deletePhoto" class="btn btn-danger">&times;</button>
    <div>
  </script>
  
  <script>
    var optionAddTemplate = Handlebars.compile($('#option-form-template').html());
    var photoAddTemplate = Handlebars.compile($('#photo-form-template').html());
    
    $('#addOption').on('click', (e) => {
      $('#option-add-form').append(optionAddTemplate);
    })
    
    $('#addPhoto').on('click', (e) => {
      $('#photo-add-form').append(photoAddTemplate);
    })
    
    $('#option-add-form').on('click', '#deleteOption', function(e) {
      $(this.parentNode.parentNode).remove();
    })

    $('#photo-add-form').on('click', '#deletePhoto', function(e) {
      $(this.parentNode).remove();
    })
  </script>
</body>
</html>



























