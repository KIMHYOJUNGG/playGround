<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>출간신청구난입니다</title>
</head>
<body>
	<h2> 현재 출간 신청을 할 수 있는 책목록들 입니다. </h2>
	<hr/>
		<c:forEach var="m" items="${publish }">
		<p>
			<form action="/week/publishBook?btitle=${m.BTITLE }" role="form" method="post">
				<b>${m.BTITLE }</b>
				<button type="submit">신청</button>
			</form> 
		</p>
		</c:forEach>
</body>
</html>