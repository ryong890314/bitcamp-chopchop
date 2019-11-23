<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>전체 회원 목록</title>

<style>
#admin-content {
  width: 1100px !important;
  margin: 30px auto;
}

.mInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.admin-tagA {
  font-size: inherit;
  color:#404040;
}
  
.mInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.m-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 18px;
}

.member-h3 {
/*   font-family: 'Oswald' !important; */
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}

.tableList {
  text-align: center;
}
</style>
</head>
<jsp:include page="../header.jsp" />
<jsp:include page="admin_sidebar.jsp"/>
<body>
  <div id="admin-content">
    <div
      class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
      <h3 class="member-h3">회원 목록</h3>
      <span class="mInfo-span">관리자페이지&nbsp;>&nbsp;전체회원목록</span>
    </div>
    <table class='table table-hover tableList'>
      <tr>
        <th>번호</th>
        <th>이메일</th>
        <th>닉네임</th>
        <th>핸드폰 번호</th>
        <th>상태</th>
      </tr>
      <c:forEach items="${members}" var="member">
        <tr>
          <td><a href='detail?no=${member.memberNo}'>${member.memberNo}</a></td>
          <td>${member.email}</td>
          <td>${member.nickname}</td>
          <td>${member.tel}</td>
          <td>활동중</td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
<jsp:include page="../footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</html>