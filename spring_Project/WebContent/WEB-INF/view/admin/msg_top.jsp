<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title></title>
</head>
<body>
	<c:if test="${gcnt2 != null && scnt !=null}">
	<h3><b>받은 메세지<small>( ${gcnt2 } )</small></b> / <a href="/admin/sendmessage?scnt=${scnt }">보낸 메세지</a><small>( ${scnt })</small></h3>
	</c:if>
	<c:if test="${scnt2 != null && gcnt !=null}">
	<h3><a href="/admin/getmessage?bcnt=${bcnt }">받은 메세지</a><small>( ${gcnt } )</small> / <b>보낸 메세지<small>( ${scnt2 })</small></b></h3>
	</c:if>
</body>
</html>