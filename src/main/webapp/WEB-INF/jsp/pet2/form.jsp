<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Register My Pet</title>
<link rel="stylesheet" href="/css/pet/form.css">
<link rel="stylesheet" href="/css/pet/input.css">

<style>
.add-form {
	position: relative;
	left: 38% !important;
	width: 800px;

}
</style>
</head>
<jsp:include page="../header.jsp" />
<body>
		<h1>Register My Pet</h1><hr>
	<div class="add-form">
		<div class="col-md-6 col-md-offset-3">
			<div class="form-area">
				<form action='add' method='post' enctype='multipart/form-data'>
					<!-- <label for="filePath">대표사진</label> <input type="file" id="file"
						name="file" /><br>  -->


					<section>
						<img
							src="http://www.randomlengthsnews.com/wp-content/themes/gonzo/images/no-image-blog-one.png"
							id="img"> <a id="addphoto" href="#" class="btn">+ Add
							Photo</a> <a id="removephoto" href="#" class="btn">x Remove Photo</a>
					</section>
					
					<input type="file" name="file" id="file"
						accept="image/*;capture=camera"/> 
						
						<input type="hidden" id="memberNo" name="memberNo" value="${memberNo}"
						readonly /><br>

					<div class="group form-group">
						<input type="text" class="form-contro" id="registerNo"
							name="registerNo" required> <span class="highlight"></span>
						<span class="bar"></span> <label class="mylabel">Register
							Number</label>
					</div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="name" name="name"
							required> <span class="highlight"></span> <span
							class="bar"></span> <label class="mylabel">Pet's Name</label>
					</div>


					<div class="group form-group">
						<input type="text" class="form-contro" id="age" name="age"
							required> <span class="highlight"></span> <span
							class="bar"></span> <label class="mylabel">Pet's Age</label>
					</div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="Breed" name="Breed"
							required> <span class="highlight"></span> <span
							class="bar"></span> <label class="mylabel">Breed</label>
					</div>

					<div class="radio-box">
						<input id="male" type="radio" name="gender" value="0"
							checked="checked" /> <label for="male">Male</label> <input
							id="female" type="radio" name="gender" value="1" /> <label
							for="female">Female</label>
					</div>
					<hr>

					<button class="sub-btn">Register</button>
				</form>
			</div>
		</div>
	</div>

	<script>
	var img = document.getElementById('img');
	var noimage = img.src;  
	  
	function handleFileSelect(evt) {
	      var file = evt.target.files[0]; // FileList object, files[0] is your file
	      console.log(file);    
	      img.src = window.URL.createObjectURL(file);   
	}

	document.getElementById('file').addEventListener('change', handleFileSelect, false);
	    
	      document.querySelector('#removephoto').addEventListener('click',   function(e) {    
	            document.getElementById('file').value="";
	            img.src=noimage;
	            e.preventDefault();
	  });         
	document.querySelector('#img').addEventListener('click',           function(e) {  
	            performClick(document.getElementById('file'));
	            e.preventDefault();
	  });     document.querySelector('#addphoto').addEventListener('click',     function(e) {   
	            performClick(document.getElementById('file'));
	            e.preventDefault();
	  }); 
	      
	function performClick(node) {     
	        var evt = document.createEvent("MouseEvents");
	        evt.initEvent("click", true, false);
	       node.dispatchEvent(evt);
	}


	</script>
</body>
<jsp:include page="../footer.jsp" />
</html>