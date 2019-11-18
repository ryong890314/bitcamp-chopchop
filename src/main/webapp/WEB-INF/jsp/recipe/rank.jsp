<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RANKING</title>
<link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/recipe/rank.css">
<style>
#nav-tab > a:hover {
  background-color: #b0c364;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />

<div id="ranking" style="width:1100px; margin:auto;">
  
  <nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
      <a class="nav-item nav-link active" id="views-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">VIEWS</a>
      <a class="nav-item nav-link" id="scraps-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">SCRAPS</a>
    </div>
  </nav>
  
  <br>
  
  <div class="container">
    <div class="row justify-content-center" style="background-image: url(/img/core-img/pattern2.png);">
        <!-- Sidebar Area -->
        <div class="col-12 col-sm-9 col-md-6 col-lg-4 col-xl-3">
          <div class="sidebar-area">
            <!-- Single Widget Area -->
            <div class="single-widget-area author-widget mb-30" style="width:280px;">
              <div style="text-align: center; visibility: hidden;">
                <img src="/img/recipe/silver.png" style="height:50px;">
              </div>
<!--               <div class="background-pattern bg-img"  style="background-image: url(/img/core-img/pattern2.png); box-shadow: 2px 2px 5px rgba(0,0,0,0.3);"> -->
              <div class="background-pattern bg-img"  style="background-color:#f6f6f6; box-shadow: 2px 2px 5px rgba(0,0,0,0.3);">
                <div class="author-thumbnail">
                  <img src="/img/bg-img/17.jpg">
                </div>
                <h5>레시피제목</h5>
                <span><img src='/img/recipe/eye.png' style='height:15px;'>&nbsp15</span>
                <span><img src='/img/recipe/like.png' style='height:15px;'>&nbsp20</span>
                <p></p>
              </div>
            </div>
          </div>
        </div>
            
        <div class="col-12 col-sm-9 col-md-6 col-lg-4 col-xl-3">
          <div class="sidebar-area">
            <!-- Single Widget Area -->
            <div class="single-widget-area author-widget mb-30" style="width:280px;">
              <div style="text-align: center;">
                <img src="/img/recipe/crowns.png" style="height:50px;">
              </div>
<!--               <div class="background-pattern bg-img"  style="background-image: url(/img/core-img/pattern2.png); box-shadow: 2px 2px 5px rgba(0,0,0,0.3);"> -->
              <div class="background-pattern bg-img"  style="background-color:#f6f6f6; box-shadow: 2px 2px 5px rgba(0,0,0,0.3);">
                <div class="author-thumbnail">
                  <img src="/img/bg-img/17.jpg">
                </div>
                <h5>레시피제목</h5>
<!--                 <span>닉네임</span><br> -->
                <span><img src='/img/recipe/eye.png' style='height:15px;'>&nbsp15</span>
                <span><img src='/img/recipe/like.png' style='height:15px;'>&nbsp20</span>
                <p></p>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-9 col-md-6 col-lg-4 col-xl-3">
          <div class="sidebar-area">
            <!-- Single Widget Area -->
            <div class="single-widget-area author-widget mb-30" style="width:280px;">
              <div style="text-align: center; visibility: hidden;">
                <img src="/img/recipe/silver.png" style="height:50px;">
              </div>
<!--               <div class="background-pattern bg-img"  style="background-image: url(/img/core-img/pattern2.png); box-shadow: 2px 2px 5px rgba(0,0,0,0.3);"> -->
              <div class="background-pattern bg-img"  style="background-color:#f6f6f6; box-shadow: 2px 2px 5px rgba(0,0,0,0.3);">
                <div class="author-thumbnail">
                  <img src="/img/bg-img/17.jpg">
                </div>
                <h5>레시피제목</h5>
                <span><img src='/img/recipe/eye.png' style='height:15px;'>&nbsp15</span>
                <span><img src='/img/recipe/like.png' style='height:15px;'>&nbsp20</span>
                <p></p>
              </div>
            </div>
          </div>
        </div>
            
        </div>
    </div>
  
  
  
  
  
  
  <table class="table table-hover rank-table" style="vertical-align: middle; text-align: center;">
    <thead style="background-color: #b0c364; color: #ffffff;">
      <tr>
        <th scope="col" style="width:10%">RANK</th>
        <th scope="col" style="width:15%;"></th>
        <th scope="col" style="width:35%;">RECIEP</th>
        <th scope="col" style="width:5%;"></th>
        <th scope="col" style="width:15%;"></th>
        <th scope="col" style="width:10%">조회수</th>
        <th scope="col" style="width:10%">좋아요</th>
      </tr>
    </thead>
    <tbody style="vertical-align: middle;">
    <!--     template 들어갈 자리 -->
    </tbody>
  </table>

</div>

<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

<script id="t1bak" type="rank-template">
{{#each result}}
<tr>
  <th scope="row" class="rank-no" style="text-align:center;">{{inc @index}}</th>
  <td><img src='/upload/recipe/{{thumbnail}}' style='height:40px;'></td>
  <td style="vertical-align: middle;">{{title}}</td>
  <td style="vertical-align: middle;">{{viewCount}}</td>
  <td style="vertical-align: middle;">{{scrap}}</td>
</tr>
{{/each}}
</script>

<script id="t1" type="rank-template">
{{#each result}}
<tr class='my-tr'>
  <th style="vertical-align: middle;" scope="row" class="rank-no">
  {{#if gold}}
  <img src="/img/recipe/gold.png" class="rank-img" style='height:50px;'>
  {{else if silver}}
  <img src="/img/recipe/silver.png" class="rank-img" style='height:50px;'>
  {{else if bronze}}
  <img src="/img/recipe/bronze.png" class="rank-img" style='height:50px;'>
  {{else}}
  {{rankNo}}
  {{/if}}
  </th>
  <td><img src='/upload/recipe/{{recipes.thumbnail}}' style='height:100px; width:100px; object-fit:cover;'></td>
  <td style="vertical-align: middle; text-align:left; font-size:20px;"><a href="detail?no={{recipes.recipeNo}}">{{recipes.title}}</a></td>
  <td style="vertical-align: middle;">
    <div style="border-radius: 70%; overflow: hidden; width:50px; height:50px;">
    <img src="/upload/member/{{member.photo}}" style="width:100%; height:100%; object-fit: cover;">
    </div>
  </td>
  <td style="vertical-align: middle; text-align:left;">
    {{member.nickname}}
  </td>
  <td style="vertical-align: middle;">
    <img src='/img/recipe/eye.png' style='height:15px;'>
    {{recipes.viewCount}}
  </td>
  <td style="vertical-align: middle;">
    <img src='/img/recipe/like.png' style='height:15px;'>
    {{recipes.scrap}}
  </td>
</tr>
{{/each}}
</script>

<script>
"use strict";

Handlebars.registerHelper("inc", function(value, options) {
  return parseInt(value) + 1;
});

loadList();
var tbody=$('.rank-table > tbody');
var trTemplateSrc = $('#t1').html();
var template = Handlebars.compile(trTemplateSrc);

function loadList() {
  $.get("/app/json/recipe/rank", function(data) {  
    console.log(data.result);
    var no = 0;
    for (var item of data.result) {
      item.rankNo = ++no;
      item.gold = item.rankNo == 1;
      item.silver = item.rankNo == 2;
      item.bronze = item.rankNo == 3;
    }
    $('tbody > tr').remove();
    tbody.append(template(data))
    });
};

$('a#scraps-tab').click(function() {
  $.get("/app/json/recipe/rank?column=" + "scrap", function(data) {
    var no = 0;
    for (var item of data.result) {
      item.rankNo = ++no;
      item.gold = item.rankNo == 1;
      item.silver = item.rankNo == 2;
      item.bronze = item.rankNo == 3;
    }
    $('tbody > tr').remove();
    tbody.append(template(data));
  })
});

$('a#views-tab').click(function() {
  loadList();
//   $.get("/app/json/recipe/rank?column=" + "view_count", function(data) {
//     var no = 0;
//     $('tbody > tr').remove();
//     for (var item of data.result) {
//       item.rankNo = ++no;
//       item.gold = item.rankNo == 1;
//       item.silver = item.rankNo == 2;
//       item.bronze = item.rankNo == 3;
//     }
//     tbody.append(template(data));
//   })
});

</script>
</body>
</html>