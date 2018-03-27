<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>신고글</title>
</head>
<body>
	<div align="left">
		<h2>${title }신고이유</h2>
		<hr />
		<table>
			<thead>
				<tr style="background: silver">
					<th style="width: 200px;">번호</th>
					<th style="width: 200px;">게시글</th>
					<th style="width: 200px;">신고내용</th>
				</tr>
			</thead>
			<c:forEach var="m" items="${reportlist }">
				<tr align="center">
					<td>${m.NO }</td>
					<td>${m.REASON }</td>
					<td>${m.READCHECK }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>