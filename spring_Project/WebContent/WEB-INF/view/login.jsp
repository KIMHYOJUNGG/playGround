<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<div align="center">
		<c:if test="${idsearch!=null }">
			<p>${idsearch }</p>
		</c:if>
		<c:if test="${idwarn!=null }">
			<p>${idwarn }</p>
		</c:if>
		<c:if test="${passwordwarn !=null }">
			<p>${passwordwarn }
		</c:if>
		<form action="/member/loging" method="post"
			style="width: 330px; text-align: left; line-height: 34px;"
			autocomplete="off">
			<p>
				<b>ID(*)</b><br /> <small id="checkrst"></small> <input type="text"
					name="id" id="id">
			</p>
			<p>
				<b>PASS(*)</b><br /> <input type="password" name="password"
					id="password">
			</p>
			<p>
				<button id="sbt" type="submit" style="width: 100%; height: 30px;">로그인</button>
			</p>
		</form>
		<p>
			<a href="/member/idsearch">아이디 찾기</a> / <a
				href="/member/passwordsearch">비밀번호 찾기</a>
		</p>
	</div>
</body>
