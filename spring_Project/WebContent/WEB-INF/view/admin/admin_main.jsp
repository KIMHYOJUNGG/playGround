<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>회원관리</title>
</head>
<body>
<div align="center">
	<h3>회원목록</h3>
	<table>
		<thead>
			<tr style="background: silver">
				<th style="width: 200px;">닉네임</th>
				<th style="width: 200px;">생성일</th>
				<th style="width: 200px;">아이디</th>
				<th style="width: 200px;">이메일</th>
				<th style="width: 90px;">경고</th>
				<th style="width: 90px;">신고</th>
				<th style="width: 90px;">레벨</th>
			</tr>
		</thead>
		<c:forEach var="m" items="${list }">
			 <tr align="center">
			 	<td><a href="/admin/listid?id=${m.ID }">${m.NICKNAME }</a></td>
			 	<td>${m.REGDATE }</td>
			 	<td>${m.ID }</td>
			 	<td>${m.EMAIL }</td>
			 	<td>${m.REDCARD }</td>
			 	<td>${m.REPORT }</td>
			 	<td>${m.LV }</td>
			 </tr>
		</c:forEach>
	</table>
</div>
</body>
</html>