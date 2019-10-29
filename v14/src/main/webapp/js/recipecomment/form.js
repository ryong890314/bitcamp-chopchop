"use strict";

var fiCommentNo = $('#fiCommentNo'),
    fiRecipeNo = $('#fiRecipeNo'),
    staticCreatedDate = $('#staticCreatedDate'),
    fiContent = $('#fiContent'),
    btnAdd = $('#btnAdd'),
    btnUpdate = $('#btnUpdate'),
    btnDelete = $('#btnDelete'),
    btnList = $('#btnList');

var i = location.href.indexOf('?'); 
if (i != -1) {
  var str = location.href.substring(i + 1).split('=');
  if (str[0] == 'no') {
    if (!isNaN(parseInt(str[1])))
      var no = parseInt(str[1]);
    else 
      swal('게시물 조회!', '게시물 번호가 유효하지 않습니다!', 'eror');
  }
}

btnList.click(() => {
	  location.href = 'list.html';
	});

	if (no == undefined) {
	  var el = $('.my-view-group')
	  el.css('display', 'none');
	  
	  
	} else {
	  var el = $('.my-view-group')
	  
	  btnAdd.click(() => {
	    doAdd();
	  });
	  
	  doDetail();
	  
	  btnUpdate.click(() => {
	    doUpdate();
	  });
	  
	  btnDelete.click(() => {
	    doDelete();
	  });
	}

function doAdd() {
  $.ajax("/app/json/recipecomment/add", {
    method: 'POST',
    data: {
    	  /*recipeNo = $('#recipeNo'),*/
        /*recipeNo: $"{recipeNo}",
    	/*commentNo: ${"#commentNo"}.val(),*/
      content: fiContent.val()
    },
    success: function(data) {
      console.log(data.state);
      location.href = "/app/recipe/detail?no=" +no;
      
    }
  });
}

function doDetail() {
  $.get("/app/json/recipecomment/detail?no=" + no, function(data) {
    fiCommentNo.val(data.result.commentNo);
    fiRecipeNo.val(data.result.recipeNo);
    fiContent.val(data.result.content);
    staticCreatedDate.val(data.result.createdDate);
  });
}

function doUpdate() {
  $.ajax("/app/json/recipecomment/update", {
    method: 'POST',
    data: {
      commentNo: no,
      recipeNo: no,
      content: fiContent.val()
    },
    success: function(data) {
      console.log(data.state);
      location.href = "/app/recipe/detail?no=" +no;
    }
  });
}

function doDelete() {
  $.get("/app/json/recipecomment/delete?no=" + no, function(data) {
    console.log(data.state);
    location.href = "list.html";
  });
}






