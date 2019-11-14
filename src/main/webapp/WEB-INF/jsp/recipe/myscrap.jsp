<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/w3.css">
<title>MY SCRAP RECIPES</title>
</head>
<body>

<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  </div>
</div>

<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

<script id="t1" type="listHtml">
{{#each result}}
<div class='w3-quarter my-list'>
    <img src='/upload/recipe/{{thumbnail}}' alt='Sandwich' style='width:280px; height:250px'>
    <h3><a href='detail?no={{recipeNo}}'>{{title}}</a></h3>
    <p>{{content}}</p>
</div>
{{/each}}
</script>

<script>
"use strict";
var dbody = $('#food');
var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);

loadList();
function loadList() {
  $.get("/app/json/recipe/myscrap", function(data) {
    console.log(data.result);
    dbody.html(template(data));
  });
}
</script>
</body>
</html>