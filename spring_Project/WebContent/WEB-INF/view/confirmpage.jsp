<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<div align="center">
		<form action="/member/confirm" method="post"
			style="width: 400px; text-align: left; line-height: 34px;"
			autocomplete="off">
			<div style="margin-top: 20px;">
			<input type="hidden" name="id" value="${id }"/>
			<input type="text" name="num2" id="num2" placeholder="보내준 이메일의 인증번호를 입력하세요"><br/>
			<a href="/member/confirmpage?email=${email }&id=${id}">재전송</a>
			</div>
			<p>
				<button id="sbt" type="submit" style="width: 100%; height: 30px;">확인</button>
			</p>
		</form>
	</div>
</body>
<script>
	console.log('${uri}');
</script>