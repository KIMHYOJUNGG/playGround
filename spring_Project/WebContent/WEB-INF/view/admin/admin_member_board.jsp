<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>회원관리</title>
</head>
<body>
	<div align="center">
		<h2>${writer }님의 게시글목록</h2>
		<hr/>
		<table>
			<thead>
				<tr style="background: silver">
					<th style="width: 200px;">번호</th>
					<th style="width: 200px;">책번호</th>
					<th style="width: 200px;">제목</th>
					<th style="width: 200px;">등록날짜</th>
					<th style="width: 90px;">타입</th>
					<th style="width: 90px;">경고</th>
				</tr>
			</thead>
			<c:forEach var="m" items="${boardlist }">
				<tr align="center">
					<c:choose>
						<c:when test="${m.RED=='Y'}">
							<td><a href="">${m.NO }</a></td>
						</c:when>
						<c:otherwise>
							<td>${m.NO }</td>
						</c:otherwise>
					</c:choose>
					<td>${m.BNO }</td>
					<td>${m.TITLE }</td>
					<td>${m.REGDATE }</td>
					<td>${m.TYPE }</td>
					<c:choose>
						<c:when test="${m.RED == 'Y'}">
							<td style="color: RED">${m.RED }</td>
						</c:when>
						<c:otherwise>
							<td>${m.RED}</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>