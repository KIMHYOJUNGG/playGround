<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>회원관리</title>
</head>
<body>
<div>
	<%@include file="/WEB-INF/view/admin/msg_top.jsp" %>	
	<hr/>
	<삭제>
	<table>
		<thead>
			<tr style="background: silver">
				<th style="width:10px;"></th>
				<th style="width: 150px;">보낸이</th>
				<th style="width: 150px;">제목</th>
			</tr>
		</thead>
		<c:forEach var="m" items="${getmessage }">
			 <tr align="center">
			 	<td><input type="checkbox" id="check"value="${m.NO }"/></td>
			 	<td>${m.SENDID }</td>
			 	<td><a href="/admin/getmessageCheck?title=${m.TITLE }&sendid=${m.SENDID}">${m.TITLE }</a></td>
			 </tr>
		</c:forEach>
	</table>
	<button>삭제</button>
</div>
</body>
</html>