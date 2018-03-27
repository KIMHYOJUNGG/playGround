<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>회원관리</title>
</head>
<body>
<div align="center">
	<h2>회원들의 메세지<small>( ${gcnt } )</small></h2>
	
	<hr/>
	<table>
		<thead>
			<tr style="background: silver">
				<th style="width: 200px;">보낸이</th>
				<th style="width: 200px;">제목</th>
			</tr>
		</thead>
		<c:forEach var="m" items="${getmessage }">
			 <tr align="center">
			 	<td>${m.SENDID }</td>
			 	<td><a href="/admin/getmessageid?title=${m.TITLE }&sendid=${m.SENDID}">${m.TITLE }</a></td>
			 </tr>
		</c:forEach>
	</table>
</div>
</body>
</html>