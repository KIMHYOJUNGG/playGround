<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>주간순위</title>
</head>
<body>
	<div align="center">
		<h2>주간순위</h2>
		<h3>현재 주간순위 1위 : ${wid }</h3>
		<hr />
		<table>
			<thead>
				<tr style="background: silver">
					<th style="width: 200px;">책제목</th>
					<th style="width: 200px;">작가</th>
					<th style="width: 200px;">좋아요 수</th>
				</tr>
			</thead>
			<c:forEach var="m" items="${wlist }">
				<tr align="center">
					<td>${m.BTITLE }</a></td>
					<td>${m.WRITER }</td>
					<td>${m.CNT }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>