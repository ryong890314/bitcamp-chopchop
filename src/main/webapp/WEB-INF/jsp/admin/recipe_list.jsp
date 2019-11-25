<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
<title>전체 레시피 목록</title>

<style>
#orderBody {
  width: 1100px;
}

.rInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.mypage-tagA {
  font-size: inherit;
  color:#404040;
}
  
.rInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.review-tagP {
  text-align: left;
   overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  word-wrap: break-word;
  width: 275px;
  line-height: 2em;
  height: 4.0em;
}

.r-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 20px;
  font-weight: 600;
}

.recipe-h3 {
  font-family: 'Oswald' !important;
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}

span {
  color: #404040;
  font-size: 15px;
  line-height: 2;
  font-weight: 400;
}

.tableList {
  text-align: center;
}
</style>

</head>
<!-- mypage_sidebar start-->
<!-- Font Awesome -->
<link rel="stylesheet"
  href="/js/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
  href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- mypage_sidebar  end -->
<jsp:include page="../header.jsp" />
  <jsp:include page="admin_sidebar.jsp"/>
<body>
  <div id="orderBody" style="margin: 0 auto; margin-bottom: 200px;">
    <div
      class="d-flex justify-content-between align-items-center py-0 mb-3 rInfo">
      <h3 class="recipe-h3">All Recipe</h3>
      <span class="rInfo-span">관리자페이지&nbsp;>&nbsp;전체레시피목록</span>
    </div>
    
    <div class="btn-group">
  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Right-aligned menu
  </button>
  <div class="dropdown-menu dropdown-menu-right">
    <button class="dropdown-item" type="button">Action</button>
    <button class="dropdown-item" type="button">Another action</button>
    <button class="dropdown-item" type="button">Something else here</button>
  </div>
</div>
    
    
    <div class="btn-group">
  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    전체보기
  </button>
  <div id="pageSize" class="dropdown-menu dropdown-menu-right">
    <button id="pageSize" class="dropdown-item page-item" type="button" value="3">3</button>
    <button id="pageSize" class="dropdown-item page-item" type="button" value="8">8</button>
    <button id="pageSize" class="dropdown-item page-item" type="button" value="10">10</button>
    <button id="pageSize" class="dropdown-item page-item" type="button" value="20">20</button>
  </div>
</div>
    
    
    
    
<!--     <div class="btn-toolbar justify-content-between" role="toolbar"> -->
<!--       <div class="input-group"> -->
<!--         <select id="pageSize"> -->
<!--           <option value="3">3</option> -->
<!--           <option value="8">8</option> -->
<!--           <option value="10">10</option> -->
<!--           <option value="20">20</option> -->
<!--         </select> -->
<!--       </div> -->
<!--     </div> -->
    <table class='table table-hover tableList'>
      <tr class="review-tr"> 
        <th>번호</th>
        <th>레시피명&사진</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>추천수</th>
        <th>작성일</th>
      </tr>
      <c:forEach items="${recipes}" var="recipes" varStatus="status">
          <tr class="tr-test">
            <td><div style="vertical-align: middle;">${status.count}</div></td>
            <td>
              <div>
                <p style="float: left;">
                <img src="/upload/recipe/${recipes.thumbnail}" style="width: 100px; height:100px;object-fit:cover; margin-right: 22px;"></p>
                <div>
                <a href="/app/product/detail?no=${recipes.recipeNo}" target="_blank" class="r-tagA review-tagP"> 
                ${recipes.title}</a>
                </div>
              </div>
            </td>
            <td>${memberNameList[status.index]}</td>
            <td>${recipes.viewCount}</td>
            <td>${recipes.scrap}</td>
            <td>${recipes.createdDate}</td>
          </tr>
      </c:forEach>
    </table>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item" data-page="prev">
          <a class="page-link" href="#">
            <span aria-hidden="true">&laquo;</span> 
          </a>
        </li>
        <c:forEach begin="${beginPage}" end="${endPage}" var="page">
        <li class="page-item" data-page="${page}">
          <a class="page-link" ${page != pageNo ? "href=#" : ""}>${page}</a>
        </li>
        </c:forEach>
        <li class="page-item" data-page="next">
          <a class="page-link" href="#">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
     </nav>
  </div>


  <jsp:include page="../footer.jsp" />

  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  <script src="/node_modules/popper.js/dist/popper.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <script>
 
 (function() {
      $('#pageSize').val('${pageSize}')
    })();
    $('#pageSize').change((e) => {
      location.href = "recipe_list?pageSize=" + $(e.target).val();
    });
    var currentPage = ${pageNo};
    $('.page-item').click((e) => {
      e.preventDefault();
      // e.currentTarget? 리스너가 호출될 때, 그 리스너가 등록된 태그를 가르킨다.
      // e.target? 이벤트가 발생된 원천 태그이다. 
      //var page = e.currentTarget.getAttribute('data-page');
      var page = $(e.currentTarget).attr('data-page');
      if (page == "prev") {
        if (currentPage == 1)
          return;
        location.href = "recipe_list?pageNo=" + (currentPage - 1) + "&pageSize=" + ${pageSize};
        
      } else if (page == "next") {
        if (currentPage >= ${totalPage})
          return;
        location.href = "recipe_list?pageNo=" + (currentPage + 1) + "&pageSize=" + ${pageSize};
      
      } else {
        location.href = "recipe_list?pageNo=" + page + "&pageSize=" + ${pageSize};
      }
    });
</script>
  
</body>
</html>

























