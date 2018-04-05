<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>회원탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="../../resources/ckeditor/ckeditor.js"></script> 
<!--  <script src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script> 
 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
	  <!-- jQuery 2.1.4 -->
<!--     <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<style>
.outer {
	position: relative;
	 width: 100%;
	 text-align: center;
	 height: 500px;
 }

.inner {
	display: inline-block;
	margin: auto;
	position: absolute;
	left:0;
	right: 0;
	top: 0;
	bottom: 0;
}

.centered {
 	position: relative; 
/* 	display: inline-block; */
/* 	width: 100%; */
/* 	padding: 1em; */
/*	position: absolute;  */
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 48%;
	height: 59%;
}
</style>
</head>


<body>
<div class="container outer"  style="margin-top: 50px">
	<div class="inner"  style="max-width: 800px">
		<div class="centered" style="height:100%; width: 50%">
		<p><h3>비밀번호를 입력해주세요</h3></p>
		<p style="margin: 25px">	
			<input type="password" name="password" id="password" required style="height: 36px;"> 
			<button id="sbt" type="submit" class="btn btn-info" style="height: 36px;">탈퇴신청</button>
		</p>
		</div>
	</div>
</div>
		
</body>
</html>
<script>
	
	$("#sbt").click(function() {
		var password = $("#password").val();
		var s = window.confirm("회원탈퇴를 하게 되면 관련된 모든 정보가 삭제됩니다. 정말로 삭제합니까? ");
		if (s) {
			if(s){
				$.get("${pageContext.request.contextPath}/member/dropmember?password="+password,function(obj){
					console.log("삭제진행...? " + obj);
					if(obj.rst){
						window.alert("그동안 감사했습니다.");
						window.opener.location.href="/index";
						window.close();
					}
					else{
						window.alert("탈퇴실패");
					}
				});
			}
			else{
				window.close();
			}
		}
	});
</script>