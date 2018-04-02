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
			게시글목록
			<div align="right">
				<small style="font-size: 15px"> <a
					href="/admin/getmessage?gcnt=${gcnt }">메시지</a>( ${gcnt } )
				</small>
			</div>
			<div align="center">
				<small style="font-size: 13px"> <a href="/admin/member">회원목록</a>
					/ <b>게시글목록</b></small>
			</div>
		</h2>
		<hr />
		<table>
			<thead>
				<tr style="background: silver">
					<th style="width: 200px;">번호</th>
					<th style="width: 200px;">제목</th>
					<th style="width: 200px;">등록날짜</th>
					<th style="width: 100px;">작가</th>
					<th style="width: 90px;">타입</th>
					<th style="width: 90px;">경고</th>
				</tr>
			</thead>
			<c:forEach var="m" items="${blist }">
				<tr align="center">
					<c:choose>
						<c:when test="${m.RED=='Y'}">
							<td><a href="/admin/read?no=${m.NO }"><b>${m.NO }</b></a></td>
						</c:when>
						<c:otherwise>
							<td>${m.NO }</td>
						</c:otherwise>
					</c:choose>
					<td>${m.TITLE }</td>
					<td>${m.REGDATE }</td>
					<td>${m.WRITER }</td>
					<td>${m.TYPE }</td>
					<c:choose>
						<c:when test="${m.RED == 'Y'}">
							<%-- 	<td style="color: RED" id="view" value="${m.NO }">${m.RED } 
							<a href="/admin/readRed?no=${m.NO }"><small>신고글보기</small></a></td> --%>
							<td style="color: RED"><a href="javascript:void(0);"
								onclick="readRed('${m.NO }')"><b>${m.RED }</b></a></td>
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
<script>
	var success = '${success}';
	if (success != '' && success != null) {
		console.log(success);
		alert(success);
	}
	function readRed(no){
		window.open("/admin/readRed?no="+no,"m","left=100,top=200,width=400,height=300");
	};
</script>