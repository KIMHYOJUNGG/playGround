<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>회원관리</title>
</head>
<body>
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
		<c:forEach var="m" items=${list }>
			 <tr>
			 	<td>${m.nickname }</td>
			 	<td>${m.regdate }</td>
			 	<td>${m.id }</td>
			 	<td>${m.password }</td>
			 	<td>${m.email }</td>
			 	<td>${m.redcard }</td>
			 	<td>${m.report }</td>
			 	<td>${m.lv }</td>
			 </tr>
		</c:forEach>
	</table>
</body>
</html>