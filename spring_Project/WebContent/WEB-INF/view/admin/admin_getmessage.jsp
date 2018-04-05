<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>회원관리</title>
</head>
<body>
	<div>
		<%@include file="/WEB-INF/view/admin/msg_top.jsp"%>
		<hr />
		<table>
			<thead>
				<tr style="background: silver">
					<th style="width: 10px;"></th>
					<th style="width: 150px;">보낸이</th>
					<th style="width: 150px;">제목</th>
					<th style="width: 50px">상태</th>
				</tr>
			</thead>
			<c:forEach var="m" items="${getmessage }">
				<tr align="center">
					<td><input type="checkbox" id="check" value="${m.NO }" /></td>
					<td>${m.SENDID }</td>
					<td><a href="javascript:void(0);" onclick="readRed('${m.NO }')">${m.TITLE }</a></td>
					<c:if test="${m.READCHECK == 'Y' }">
						<td><b>읽음</b></td>
					</c:if>
					<c:if test="${m.READCHECK == 'N' }">
						<td>안읽음</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<button>삭제</button>
	</div>
</body>
</html>
<script>
	function readRed(no) {
		window.open("/admin/getmessageCheck?no=" + no, "m",
				"left=100,top=200,width=700,height=300");
	};
	/* opener.location.reload(); */
</script>