<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id='header' class='navbar navbar-expand-lg navbar-light bg-light'>
  <a class='navbar-brand' href='#'>
    <img src='/images/choplogo.png' class='d-inline-block align-top' width="100px">
  </a>
  <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarNav' aria-controls='navbarNav' aria-expanded='false' aria-label='Toggle navigation'> 
    <span class='navbar-toggler-icon'></span> 
  </button>
  <div class='collapse navbar-collapse' id='navbarSupportedContent'>
    <ul class='navbar-nav'>
      <li class='nav-item active'>
        <a class='nav-link' href='/app/board/list'>HOME</a>
      </li>
      <li class='nav-item active'>
        <a class='nav-link' href='/app/lesson/list'>CHOP RECIPE</a>
      </li>
      <li class='nav-item active'>
        <a class='nav-link' href='/app/member/list'>CHOP STORE</a>
      </li>
      <li class='nav-item active'>
        <a class='nav-link' href='/app/photoboard/list'></a>
      </li>
    </ul>
  </div>
    
  <div>
<c:if test="${empty loginUser}">
  <a href='/app/auth/form' class='btn btn-outline-dark btn-sm'>LOG IN</a>
</c:if>
<c:if test="${not empty loginUser}">
  <a href='/app/member/detail?no=${loginUser.no}'>${loginUser.name}</a> 
  <a href='/app/auth/logout' class='btn btn-outline-dark btn-sm'>LOG OUT</a>
</c:if>
  </div>
</nav>
