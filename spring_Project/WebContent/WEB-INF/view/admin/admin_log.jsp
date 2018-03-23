<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to admin</title>
</head>
<body>
	<form action="/admin/log" method="post" align="center"
		style="width: 330px; text-align: left;" autocomplete="off" >
		<div style="margin-top: 20px;">
			<b>ID(*)</b> <small id="checkrst"></small><br /> <input type="text"
				name="id" id="id" pattern="[a-zA-Z]+">
		</div>
		<div style="margin-top: 20px;">
			<b>PASS(*)</b><br /> <input type="password" name="password">
		</div>
		<div style="margin-top: 20px;">
			<button id="sbt" type="submit" style="width: 100%; height: 30px;">로
				그 인</button>
		</div>
	</form>
</body>
</html>