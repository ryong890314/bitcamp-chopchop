<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/form.css">
<title>레시피 등록폼</title>
</head>
<body onload="addCooking()">

<div id="app">
  <div>
      <div class="wrapper">
          <div class="site-main">
              <div class="container">
                  <div class="block-gird-item">
                      <div>
                          <form name="frmRecipe" action='add' method='post' enctype='multipart/form-data'>
                          <input type="hidden" name="user_id" value="1">
                              <div class="toobar"><strong class="title pull-left">레시피 등록 </strong><button class="btn btn-default pull-right">등록</button></div>
                              <div class="block-write">
                                  <div class="block-content">
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">작성자</label></div>
                                          <div class="col-xs-10"><input type="text" name="nickname" class="form-control" placeholder="${loginUser.nickname}" value=""></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">제목</label></div>
                                          <div class="col-xs-10"><input type="text" name="title" class="form-control" placeholder="레시피 제목을 입력해주세요" value=""></div>
                                      </div>
                                      <!-- <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">간단설명</label></div>
                                          <div class="col-xs-10"><textarea name="content" class="form-control" placeholder="100자 내외의 간단한 레시피 설명을 입력해주세요"></textarea></div>
                                      </div> -->
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">분류</label></div>
                                          <div class="col-xs-10">
                                          <select class="form-control" name="category">
                                                  <option value="1">분류</option>
                                                  <option value="강아지">멍키친</option>
                                                  <option value="고양이">냥키친</option>
                                              </select></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">태그</label></div>
                                          <div class="col-xs-10"><input type="text" name="tag" class="form-control" placeholder="1개 이상의 정보는 #로 구분해주세요." value=""></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">기타정보</label></div>
                                          <div class="col-xs-10"><input type="text" name="otherInfo" class="form-control" placeholder="1개 이상의 정보는 #로 구분해주세요." value=""></div>
                                      </div>
                                  </div>
                                  <div class="block-title"><span class="title">재료 정보</span></div>
                                  <div id="ingredient-block" class="block-content">
                                  
                                  <!-- 재료 용량 들어가는 Div -->
                                          <input type="hidden" name="ingredientCount" value="0">
                                  </div>
                                  
                                  <div id="block_3" class="block-content">
                                      <div class="row form-group">
                                          <div class="col-xs-12 text-right"><button class="btn btn-default btn-sm" type="button" onclick="addIngredient()">추가입력</button></div>
                                      </div>
                                  </div>
                                  
                                  
                                  <div class="step-list"> 
                                      <div id="cookingDiv222">
                                          <div class="block-title _gray">
                                          <span class="title">STEP</span></div>
                                          
                                          <div id="cookingDiv" class="block-content">
                                          <!-- 순서 박스 들어갈 Div -->
                                              <!-- 순서ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ -->
                                          <input type="hidden" name="cookingCount" value="0">
                                      <!-- 순서 박스 들어갈 Div -->
                                          </div>
                                      </div>
                                  </div>
                                  <!-- 순서추가버튼 -->
                                  <div class="block-content">
                                      <div class="row form-group">
                                          <div class="col-xs-12"><button class="btn btn-default btn-block" type="button" onclick="addCooking()">+ 순서 추가</button></div>
                                      </div>
                                  </div>
                                  <!-- 순서추가버튼 -->
                                  <div class="block-title _gray"><span class="title">요리 완성</span></div>
                                  <div class="block-content">
                                      <div>
                                          <!-- 썸네일사진추가아아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ -->
                                          <div class="box-photo">
                                                  <div class="photo">
                                                      <div class="img"><input class="" type="file" name='filePath' id="files" style="width:100px;"/>
                                                      <img id="image" /></div>
                                                      <button class="btn btn-outline btn-block btn-sm" type="button">사진 삭제</button>
                                                  </div>
                                                  <div class="des"><textarea class="form-control" name="content">간단한 설명 입력해주세요</textarea></div>
                                              </div>
                                      </div><br><br>
                                      <div class="row form-group">
                                          <div class="col-xs-12 text-center"><button class="btn btn-default" style="height: auto;">등록</button></div>
                                      </div>
                                  </div>
                              </div>
                          </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>


<script> // 재료, 용량  추가
"use strict"

 var ingredientCount = 0;
 function addIngredient() {
     var addedFormDiv = document.getElementById("ingredient-block");
     var str = "";
     str+="<div id='addIngredientDiv' class='group-flex'>";
     str+="<div class='form-group'><label id='ingredient' class='label'>재료 </label><input type='text' name='ingredientNames' class='form-control' value=''></div>";
     str+="<div class='form-group'><label id='quantity' class='label'>용량 </label><input type='text' name='quantity' class='form-control' value=''></div>";
//     str+="<div class='form-group'><button class='btn btn-outline btn-sm' type='button' onclick='delIngredient()'>삭제"+ingredientCount+"</button></div>";
     str+="<div class='form-group'><button class='btn btn-outline btn-sm' type='button' onclick='delIngredient("+ingredientCount+")'>삭제"+ingredientCount+"</button></div>";
     str+="</div>";
     // 추가할 폼(에 들어갈 HTML)
     var addedDiv = document.createElement("div"); // 폼 생성
     addedDiv.id = "added_"+ingredientCount; // 폼 Div에 ID 부여 (삭제를 위해)
     addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입
     addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입
  
     ingredientCount++;
     document.frmRecipe.ingredientCount.value=ingredientCount;
     // 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장
 }

 function delIngredient(i){
     var addedFormDiv = document.getElementById("ingredient-block");
     if(ingredientCount >0){ // 현재 폼이 두개 이상이면
                //var addedDiv = document.getElementById("added_"+(--ingredientCount));
                var addedDiv = document.getElementById("added_"+i);
                // 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
                addedFormDiv.removeChild(addedDiv); // 폼 삭제 
     }else{ // 마지막 폼만 남아있다면
                document.frmRecipe.reset(); // 폼 내용 삭제
     }
 }
</script>

 <script> // 조리순서, 사진, 내용 추가
"use strict"

 var cookingCount = 0;
 function addCooking() {
     
     var addedFormDiv2 = document.getElementById("cookingDiv");
     var str = "";
     //str+="<div class='block-title _gray'><span class='title'>STEP 1</span></div>";
     str+="<div class='row form-group'>";
     str+="순서: <input type='text' name='processNo'></div>";
     str+="<div class='box-photo'><div class='photo'>";
     str+="<div class='img'><input class='btn btn-outline btn-images' type='file' name='filePath2' id='ip-1' style='width: 100%; height: 100%; opacity: 0; overflow: hidden;'></div>";
     str+="<button class='btn btn-outline btn-block btn-sm' type='button' onclick='delCooking("+cookingCount+")'>순서 삭제"+cookingCount+"</button>";
     str+="</div>";
     str+="<div class='des'><textarea class='form-control' name='cookingContent'>조리방법입력해주세요</textarea></div>";
     str+="</div>";
     // 추가할 폼(에 들어갈 HTML)
     var addedDiv2 = document.createElement("div"); // 폼 생성
     addedDiv2.id = "added_"+cookingCount; // 폼 Div에 ID 부여 (삭제를 위해)
     addedDiv2.innerHTML = str; // 폼 Div안에 HTML삽입
     addedFormDiv2.appendChild(addedDiv2); // 삽입할 DIV에 생성한 폼 삽입
  
     cookingCount++;
     document.frmRecipe.cookingCount.value=cookingCount;
     // 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장
 }

 function delCooking(i){
     var addedFormDiv2 = document.getElementById("cookingDiv");
     if(cookingCount >0){ // 현재 폼이 두개 이상이면
      //var addedDiv2 = document.getElementById("added_"+(--ingredientCount));
      var addedDiv2 = document.getElementById("added_"+i);
      // 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
      addedFormDiv2.removeChild(addedDiv2); // 폼 삭제 
     }else{ // 마지막 폼만 남아있다면
                document.frmRecipe.reset(); // 폼 내용 삭제
     }
 }
</script> 

<script>
document.getElementById("files").onchange = function () {
  var reader = new FileReader();

  reader.onload = function (e) {
      // get loaded data and render thumbnail.
      document.getElementById("image").src = e.target.result;
  };

  // read the image file as a data URL.
  reader.readAsDataURL(this.files[0]);
};
</script>


</body>
</html>