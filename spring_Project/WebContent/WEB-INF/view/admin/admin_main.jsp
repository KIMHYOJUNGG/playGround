<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>회원관리</title>
</head>
<body>
	<div align="center">
		<h2>
			회원목록
			<div align="right">
				<small style="font-size: 15px"> <a
					href="/admin/getmessage?gcnt=${gcnt }">메시지</a>( ${gcnt } )
				</small>
			</div>
			<div align="center">
			<small style="font-size : 13px">
				<b>회원목록</b> / <a href="/admin/board">게시글목록</a></small> 
			</div>
		</h2>
		<hr />
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
			<c:forEach var="m" items="${mlist }">
				<tr align="center">
					<td><a href="/admin/listid?id=${m.ID }">${m.NICKNAME }</a></td>
					<td>${m.REGDATE }</td>
					<td>${m.ID }</td>
					<td>${m.EMAIL }</td>
					<td>${m.REDCARD }</td>
					<c:if test="${m.REPORT=='Y' }">
						<td style="color: RED"><b>${m.REPORT }</b></td>
					</c:if>
					<c:if test="${m.REPORT=='N' }">
						<td style="color:BLUE">${m.REPORT }</td>
					</c:if>
					<c:if test="${m.LV !=2 }">
						<td>${m.LV }</td>
					</c:if>
					<c:if test="${m.LV == 2}">
						<td style="color: RED"><b>${m.LV }</b><small>(${m.STOPTIME })</small></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
<script>
	var success = '${success}';
	if (success != '' && success != null) {
		console.log(success);
		alert(success);
	}
</script>