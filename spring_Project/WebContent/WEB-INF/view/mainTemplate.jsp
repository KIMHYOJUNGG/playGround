
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <script src="../../resources/ckeditor/ckeditor.js"></script> 
<!--  <script src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script> 
 -->

<title><tiles:getAsString name="title"></tiles:getAsString></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <!-- jQuery 2.1.4 -->
<!--     <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">

<style>
<%--
main style --%> .main_keywords {
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
  
  .bg_type{
  	background-color: #5bc0de;
  }
</style>
</head>
<body>

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
			<c:if test="${logon !=null }">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">myPage<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/myPage">my page</a></li>
						    <li class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/modifyInfo">정보 수정</a></li>
							<li><a href="${pageContext.request.contextPath}/@${logon}">나의 글</a></li>
							<li><a href="${pageContext.request.contextPath}/@${logon}/following">관심 작가 관리</a></li>
						</ul>
						</li>
					<li><a href="${pageContext.request.contextPath}/message">우편함</a>
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
