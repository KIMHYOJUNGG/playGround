<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>내용</title>
</head>
<body>
	보낸이 : ${msgId.SENDID}			<small>${msgId.REGDATE }</small><br/>
	제목 : ${msgId.TITLE}<br/>
	내용 : ${msgId.MSG }<br/> 
	<a href="/admin/reply?sendid=${msgId.SENDID }">답장</a>
</body>
</html>