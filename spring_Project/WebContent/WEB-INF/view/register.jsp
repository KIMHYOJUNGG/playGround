<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 회원가입 -->
<body>
	<div align="center">
		<form action="/member/regist" method="post"
			style="width: 330px; text-align: left; line-height: 34px;"
			autocomplete="off">
			<div style="margin-top: 20px;">
				<span>ID(*)</span> <small id="checkrst"></small><br /> <input
					type="text" name="id" id="id" placeholder="아이디" pattern="[a-zA-Z]+">
			</div>
			<p>
				<b>PASS(*)</b><br />
				<input type="password" name="password" id="password">
			</p>
			<p></p>
			<b>REPASS(*)</b><br />
			<input type="password" name="repassword" id="repass"
				onblur="checkps();"><br /> <span id="rgd2"></span>
			<p>
			<p>
				<b>NICKNAME(*)</b><br />
				<input type="nickname" name="nickname">
			</p>
			<p>
				<b>EMAIL(*)</b><br />
				<input type="email" name="email" onblur="checkemail()">
			<div id="emailc"></div>
			</p>
			<p>
				<button id="sbt" type="submit" style="width: 100%; height: 30px;">가
					입 신 청</button>
			</p>
		</form>
	</div>
</body>
<script>
	// 패스워드 재확인
	function checkps() {
		if (document.getElementById("password").value == null) {
			document.getElementById("rgd2").style.color = "red";
			document.getElementById("rgd2").innerHTML = "<small>비밀번호 입력바랍니다..</small>";
			document.getElementById("bt").disabled = true;
		} else if (document.getElementById("repass").value != document
				.getElementById("password").value) {
			document.getElementById("rgd2").style.color = "red";
			document.getElementById("rgd2").innerHTML = "<small>비밀번호가 다릅니다.</small>";
			document.getElementById("bt").disabled = true;
		} else {
			document.getElementById("rgd2").innerHTML = null;
			document.getElementById("bt").disabled = false;
		}
	}
	document.getElementById("id").onblur = function() {
		if(this.value.length!=0) {
			var xhr = new XMLHttpRequest();
			xhr.open("get", "/member/checkid?id="+this.value,true);
			xhr.onreadystatechange=function() {
				if(this.readyState==4) {
					var obj = JSON.parse(this.responseText);
					if(obj ==false) {
						document.getElementById("checkrst").innerHTML = "사용가능합니다.";
						document.getElementById("checkrst").style.color = "green";	
						document.getElementById("bt").disabled=false;	
					}else {
						document.getElementById("checkrst").innerHTML = "이미 사용중인 아이디 입니다.";
						document.getElementById("checkrst").style.color = "red";
						document.getElementById("bt").disabled=true;
					}
				}					
			}
			xhr.send();
		}
	}
</script>
