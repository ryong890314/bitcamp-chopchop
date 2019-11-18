<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Font Awesome -->
<!-- <link rel="stylesheet"
  href="/js/plugins/fontawesome-free/css/all.min.css">
Ionicons
<link rel="stylesheet"
  href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
Theme style
<link rel="stylesheet" href="/css/member/adminlte.min.css">
Favicon
<link rel="icon" href="/img/core-img/favicon.ico"> -->
<!-- </head> -->

<div class="hold-transition sidebar-mini layout-fixed"
  onload="sidebar_form()();">
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/app/member/list" class="brand-link"> <img
      src="/img/core-img/smallLogo.png" alt="ChopChop Logo"
      class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text">ChopChop</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <input type="hidden" id="userphoto" value="${member.photo}" /> <img
            src='/upload/member/${member.photo}' id="userThumb"
            class="img-circle elevation-2 my-thumb"
            style="width: 40px; height: 40px; margin-left: -5px;">
        </div>

        <div class="info">
          <!-- user name받기~ -->
          <a href="/app/member/myprofile"
            style="font-size: large; padding-left: 5px;" class='nav-user'>${member.nickname}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column"
          data-widget="treeview" role="menu" data-accordion="false">

          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item"><a href="/app/member/detail"
            class="nav-link" style="font-size: large;"> <i
              class="nav-icon fa fa-user"></i>
              <p>My Profile</p>
          </a></li>
          <li class="nav-item"><a href="/app/recipe/myrecipe"
            class="nav-link" style="font-size: large;"> <i
              class="nav-icon fa fa-paw"></i>
              <p>My Recipe</p>
          </a></li>
          <li class="nav-item"><a href="/app/member/detail"
            class="nav-link" style="font-size: large;"> <i
              class="nav-icon fa fa-book"></i>
              <p>My Review</p>
          </a></li>
          <li class="nav-item"><a href="/app/order/searchbymember"
            class="nav-link" style="font-size: large;"> <i
              class="nav-icon fa fa-list"></i>
              <p>My Order</p>
          </a></li>
          <li class="nav-item"><a href="/app/recipe/myscrap"
            class="nav-link" style="font-size: large;"> <i
              class="nav-icon fa fa-bookmark"></i>
              <p>My Bookmark</p>
          </a></li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
</div>














<!-- jQuery -->
<!--  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  jQuery UI 1.11.4
  <script src="/js/jquery-ui/jquery-ui.min.js"></script>
  Bootstrap 4
  AdminLTE App
  <script src="/js/dist/adminlte.js"></script>
  <script>
    function formLoad() {
      // hidden값을 이용해서 자바스크립트를 이용한 경우
      if ($("#userphoto").val() == null || $("#userphoto").val() == "") {
        $("#userThumb").attr("src", "/upload/member/info_photo.jpg");
      } else {
        $("#userThumb").attr("src",
            "/upload/member/" + $("#userphoto").val());
      }
    }
  </script> -->