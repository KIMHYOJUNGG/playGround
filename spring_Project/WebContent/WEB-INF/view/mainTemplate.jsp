<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title><tiles:getAsString name="title"></tiles:getAsString></title>
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
.main_keywords {
	border-collapse: collapse;
	height: 600px;
	width: 30%;
	text-align: center;
}

.main_keyword, .main_td, .main_th {
	border: 2px solid gray;
	text-align: center;
}

.mainbody {
	
}

.w3-bar-block .w3-bar-item {
	padding: 20px
}

img {
	width: 100%;
	height: auto;
}

.centered {
	position: relative;
	display: inline-block;
	width: 50%;
	padding: 1em;
}

.search {
	/*   	background-color: #fff; */
	/*   	color: #777; */
	background-color: #f0ad4e;
}

.bg_type {
	background-color: #5bc0de;
}

.mtd {
	text-align: center;
}

.bg-grey {
	background-color: #f6f6f6;
/* 		background-color: white; */
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
}

.carousel-inner img {
	width: 40%; /* Set width to 100% */
	height: 40%;
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}

@media ( max-width : 400px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}

.container-fluid {
	
}

@media screen and (max-width: 768px) {
	.col-sm-3 {
		text-align: center;
		margin: 25px 0;
	}
	.carousel-inner img {
		-webkit-filter: grayscale(90%);
		filter: grayscale(90%); /* make all photos black and white */
		width: 100%; /* Set width to 100% */
		margin: auto;
	}
	.carousel-caption h3 {
		color: #fff !important;
	}
	@media ( max-width : 600px) {
		.carousel-caption {
			display: none;
			/* Hide the carousel text when the screen is less than 600 pixels wide */
		}
	}
}

#media-320, #media-768, #media-1024, #media-1025 {
	display: none;
	height: 0px;
	overflow: hidden;
}

@media all and (max-width: 320px) {
	#media-320 {
		display: block;
	}
}

@media all and (min-width: 321px) and (max-width: 768px) {
	#media-768 {
		display: block;
	}
}

@media all and (min-width: 769px) and (max-width: 1024px) {
	#media-1024 {
		display: block;
	}
}

@media all and (min-width: 1025px) {
	#media-1025 {
		display: block;
	}
}

.img_div-wrapper {
	display: inline-block;
	width: 100%;
	border: 1px solid #ddd;"
}

.img_div {
	position: relative;
	padding-top: 100%;
	overflow: hidden;
}

.img_div img {
  position: absolute;
  top:0;
  left: 0;
}

.img_div .img-centered {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	-webkit-transform: translate(50%, 50%);
	-ms-transform: translate(50%, 50%);
	transform: translate(50%, 50%);
}

.img_div .img-centered img {
	-webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
}

.img_div img.portrait {
	width: 100%;
	max-width: none;
	height: auto;
}

.img_div img.landscape {
	width: auto;
	max-width: none;
	height: 100%;
}
</style>
</head>
<body>
    <div id="media-320"></div>
    <div id="media-768"></div>
    <div id="media-1024"></div>
    <div id="media-1025"></div>
    
    <script>
		var responsive;
		
		function setResponsive() {
		    if ($('div#media-320').css('display') == 'block') responsive = 1;
		    else if ($('div#media-768').css('display') == 'block') responsive = 2; // 모바일
		    else if ($('div#media-1024').css('display') == 'block') responsive = 3;
		    else if ($('div#media-1025').css('display') == 'block') responsive = 0;
		    else responsive = 4;
		}
		  
		$(window).on('load', function () {
		    setResponsive();
			console.log("load :" + responsive);
		});
		  
		$(window).on('resize', function () {
		    setResponsive();
		    console.log("resize :" + responsive);
		});
	</script>

	<nav class="navbar navbar-inverse navbar-fixed-top" >
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">PlayGround</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
			<c:if test="${logon != null }">
				<ul class="nav navbar-nav">
					<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown"  href="#">myPage<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/myPage">my page</a></li>
						    <li class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/modifyInfo">정보 수정</a></li>
							<li><a href="${pageContext.request.contextPath}/@${logon}">나의 글</a></li>
							<li><a href="${pageContext.request.contextPath}/@${logon}/following">관심 작가 관리</a></li>
						</ul>
						</li>
					<li><a href="${pageContext.request.contextPath}/message">우편함</a></li>
					<li><a href="${pageContext.request.contextPath}/board/listPage">글목록</a></li>
					<li><a href="">${logon }님 환영합니다.</a></li>
				</ul>
			</c:if>
				<ul class="nav navbar-nav navbar-right">

				<c:if test="${logon == null  }">
					<li><a href="/member/registpage"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="/member/log"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</c:if>
				<c:if test="${logon !=null }">
					<li><a href="/member/logout"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</c:if>

					<li><form class="navbar-form navbar-left" action="/search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search"
									name="word">
							</div>
							<button type="submit" class="btn btn-default">Search</button>
						</form></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid" style="margin-top: 50px">
		<tiles:insertAttribute name="body"></tiles:insertAttribute>
	</div>


</body>
</html>

