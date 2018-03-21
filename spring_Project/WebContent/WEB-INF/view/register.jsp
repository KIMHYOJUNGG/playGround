<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<div align="center">
			<form action="/member/regist" method="post"
					style="width: 330px; text-align: left; line-height: 34px;" autocomplete="off">
					<p>
						<b>ID(*)</b><br/><small id="checkrst" ></small>
						<input type="text" name="id" id="id" pattern="[a-zA-Z]+">
					</p>
					<p>
						<b>PASS(*)</b><br/><input type="password" name="password" id="password">
					</p>
					<p>
					</p>
						<b>REPASS(*)</b><br/><input type="password" name="repassword" id="repass" onblur="checkps();"><span id="rgd2"></span>
					<p>
					<p>
						<b>NICKNAME(*)</b><br/><input type="nickname" name="nickname" >
					</p>
					<p>
						<b>EMAIL(*)</b><br/><input type="email" name="email" >
					</p>
						<button id="sbt" type="submit" style="width: 100%; height: 30px;">가 입 신 청</button>
					</p>
			</form>
	</div>
</body>
<script>
	// 패스워드 재확인
		function checkps(){
			if(document.getElementById("repass").value != document.getElementById("password").value){
				document.getElementById("rgd2").style.color = "red";
				document.getElementById("rgd2").innerHTML = "<small>비밀번호가 다릅니다.</small>";
				document.getElementById("bt").disabled=true;
			}
			else{
				document.getElementById("rgd2").innerHTML = null;
				document.getElementById("bt").disabled=false;
			}
		}
</script> 