
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<div align="center">
		<form action="/member/loging" method="post"
			style="width: 370px; text-align: left; line-height: 34px;"
			autocomplete="off">
			<c:if test="${uri!=null }">
				<input type="hidden" name="uri" value="${uri }" />
			</c:if>
			<p>
				<b>ID(*)</b><br />  <input type="text"
					name="id" id="id" pattern="[a-zA-Z1-9]+" onblur="idCheck()"><small><span class="checkid"></span></small>
			</p>
			<p>
				<b>PASS(*)</b><br /> <input type="password" name="password"
					id="password" onblur="passCheck()"><small><span class="checkpass"></span></small>
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
<script>
	function idCheck() {
		var id = $("#id").val();
		if (id == "") {
			$(".checkid").html("아이디을 입력하세요.");
			$(".checkid").css("color", "red");
			document.getElementById("sbt").disabled = true;
		}
		else{
			$(".checkid").html("");
			document.getElementById("sbt").disabled = false;
		}
	}
	function passCheck() {
		var pass = $("#password").val();
		if (pass == "") {
			$(".checkpass").html("비밀번호를 입력해주세요")
			$(".checkpass").css("color", "red");
			document.getElementById("sbt").disabled = true;
		}
		else{
			$(".checkpass").html("")
			document.getElementById("sbt").disabled = false;
		}
	}
</script>
