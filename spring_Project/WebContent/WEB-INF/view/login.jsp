<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<div align="center">
	<form action="/member/loging" method="post"
					style="width: 330px; text-align: left; line-height: 34px;" autocomplete="off">
					<p>
						<b>ID(*)</b><br/><small id="checkrst" ></small>
						<input type="text" name="id" id="id" pattern="[a-zA-Z]+">
					</p>
					<p>
						<b>PASS(*)</b><br/><input type="password" name="password" id="password">
					</p>
					<p>
						<button id="sbt" type="submit" style="width: 100%; height: 30px;">로그인</button>
					</p>
			</form>
	</div>
</body>
