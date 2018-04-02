<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 회원가입 -->
<body>
	<div align="center">
		<form action="/member/regist"  role="form" method="post"
			style="width: 400px; text-align: left; line-height: 34px;"
			autocomplete="off">
			<div style="margin-top: 20px;">
				<span>ID(*)</span> <small id="checkrst"></small><br /> <input
					type="text" name="id" id="id" placeholder="아이디" pattern="[a-zA-Z]+" >
			</div>
			<p>
				<b>PASS(*)</b><br /> <input type="password" name="password"
					id="password" pattern="/^(?=.*\d)(?=.*[~`!@%23$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$/g">
			</p>
			<p></p>
			<b>REPASS(*)</b><br /> <input type="password" name="repassword"
				id="repass" onblur="checkps();"><br /> <span id="rgd2"></span>
			<p>
			<p>
				<b>NICKNAME(*)</b><br /> <input type="nickname" name="nickname" id="nick" onblur="nickCheck()">
				<small><span class="nname"></span></small>
			</p>
			<p>
			
				<b>EMAIL(*)</b><small> <input
					type="checkbox" id="checkemail" name="checkemail" />이메일 인증을 하겠습니다.
				</small><br /> 
				<input type="email" name="email" id="email" onblur="emailCheck()" ><small><span class="ename"></span></small><br/>
					
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
			document.getElementById("sbt").disabled = true;
		} else if (document.getElementById("repass").value != document
				.getElementById("password").value) {
			document.getElementById("rgd2").style.color = "red";
			document.getElementById("rgd2").innerHTML = "<small>비밀번호가 다릅니다.</small>";
			document.getElementById("sbt").disabled = true;
		} else {
			document.getElementById("rgd2").innerHTML = null;
			document.getElementById("sbt").disabled = false;
		}
	}
	document.getElementById("id").onblur = function() {
		if(this.value == ""){
			$(".checkrst").html("아이디를 입력하세요.");
			$(".checkrst").css("color", "red");
			document.getElementById("sbt").disabled = true;
		}
		else{
			var xhr = new XMLHttpRequest();
			xhr.open("get", "/member/checkid?id=" + this.value, true);
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					var obj = JSON.parse(this.responseText);
					if (obj == false) {
						document.getElementById("checkrst").innerHTML = "사용가능합니다.";
						document.getElementById("checkrst").style.color = "green";
						document.getElementById("sbt").disabled = false;
					} else {
						document.getElementById("checkrst").innerHTML = "이미 사용중인 아이디 입니다.";
						document.getElementById("checkrst").style.color = "red";
						document.getElementById("sbt").disabled = true;
					}
				}
			}
			xhr.send();
		}
	}
	$("#sbt").click( function()	{
		if (document.getElementById("checkemail").checked) {
			console.log(document.getElementById("checkemail").checked);
			document.getElementById("checkemail").value = 1;
		}
 		else{
			var formObj = $("form[role='form']");
			var s = window.confirm("이메일 인증을 안해?");
			if(s){
				formObj.submit();
			}
		} 
	});
	
	function nickCheck(){
		var nick =  $("#nick").val();
		if(nick == ""){
			$(".nname").html("닉네임을 입력하세요.");
			$(".nname").css("color", "red");
			document.getElementById("sbt").disabled = true;
		} 
		else{
			$(".nname").html("");
			document.getElementById("sbt").disabled = false;
		}
	}
	function emailCheck(){
		var email = $("#email").val();
		if(email == ""){
			$(".ename").html("이메일을 입력해주세요")
			$(".ename").css("color", "red");
			document.getElementById("sbt").disabled = true;
		}
		else{
			$(".ename").html("");
			document.getElementById("sbt").disabled = false;
		}
	}

</script>

