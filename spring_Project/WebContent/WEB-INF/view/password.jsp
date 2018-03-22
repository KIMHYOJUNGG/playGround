<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<div align="center">
		<form action="/member/passwordresult" method="post"
			style="width: 330px; text-align: left; line-height: 34px;"
			autocomplete="off">
			<p>
				<b>ID(*)</b><br />
				<small id="checkrst"></small> <input type="text" name="id" id="id"
					pattern="[a-zA-Z]+">
			</p>
			<p>
				<b>EMAIL(*)</b><br />
				<input type="text" name="email" id="email">
			</p>
			<p>
				<button id="sbt" type="submit" style="width: 100%; height: 30px;">비밀번호 찾기</button>
			</p>
		</form>
</div>
</body>