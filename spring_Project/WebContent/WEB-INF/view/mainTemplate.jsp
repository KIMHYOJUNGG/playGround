<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title><tiles:getAsString name="title"></tiles:getAsString></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	height: 200px;
	width: 30%;
	text-align: center;
}

.main_keyword, .main_td, .main_th {
	border: 2px solid gray;
	text-align: center;
}

.mainbody {
	font-family: "Karma", sans-serif
}

.w3-bar-block .w3-bar-item {
	padding: 20px
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
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
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown"
						href="${pageContext.request.contextPath}/myPage">myPage<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Page 1-1</a></li>
							<li><a href="#">Page 1-2</a></li>
							<li><a href="#">Page 1-3</a></li>
						</ul></li>
					<%-- 
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
     --%>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/member/registpage"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="/member/log"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li><form class="navbar-form navbar-left" action="/search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search"
									name="search">
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
