<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 회원가입 -->
<body>
	<div align="center">
		<div id="checkresult"></div>
		<form action="/member/regist" role="form" method="post"
			style="width: 400px; text-align: left; line-height: 34px;"
			autocomplete="off">
			<div style="margin-top: 20px;">
				<span>ID(*)</span> <small id="checkrst"></small><br /> <input
					type="text" name="id" id="id" placeholder="아이디" pattern="[a-zA-Z]+">
			</div>
			<p>
				<b>PASS(*)</b><br /> <input type="password" name="password"
					id="password"
					pattern="/^(?=.*\d)(?=.*[~`!@%23$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$/g">
			</p>
			<p></p>
			<b>REPASS(*)</b><br /> <input type="password" name="repassword"
				id="repass" onblur="checkps();"><br /> <span id="rgd2"></span>
			<p>
			<p>
				<b>NICKNAME(*)</b><br /> <input type="nickname" name="nickname"
					id="nick" onblur="nickCheck()"> <small><span
					class="nname"></span></small>
			</p>
			<p>

				<b>EMAIL(*)</b><small> <input type="checkbox"
					id="checkemail" name="checkemail" />이메일 인증을 하겠습니다.
				</small><br /> <input type="email" name="email" id="email"
					onblur="emailCheck()"><small><span class="ename"></span></small><br />

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

	// 아이디 확인
	document.getElementById("id").onblur = function() {
		if (this.value == "") {
			console.log("아이디빈칸?")
			$("#checkrst").html("아이디를 입력하세요.");
			$("#checkrst").css("color", "red");
			document.getElementById("sbt").disabled = true;
		} else {
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

	$("#sbt").click(function() {
		if (document.getElementById("checkemail").checked) {
			console.log(document.getElementById("checkemail").checked);
			document.getElementById("checkemail").value = 1;
		} else {
			var formObj = $("form[role='form']");
			var s = window.confirm("이메일 인증을 안해?");
			if (s) {
				formObj.submit();
			}
		}
	});

	function nickCheck() {
		var nick = $("#nick").val();
		if (nick == "") {
			$(".nname").html("닉네임을 입력하세요.");
			$(".nname").css("color", "red");
			document.getElementById("sbt").disabled = true;
		} else {
			var xhr = new XMLHttpRequest();
			var id = $("#id").val();
			xhr.open("get", "/member/checknick?nick=" + nick, true);
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					var obj = JSON.parse(this.responseText);
					if (obj == false) {
						$(".nname").html("닉네임 사용이 가능합니다..");
						$(".nname").css("color", "green");
						document.getElementById("sbt").disabled = false;
					} else {
						$(".nname").html("닉네임 사용이 중복됩니다..");
						$(".nname").css("color", "red");
						document.getElementById("sbt").disabled = true;
					}
				}
			}
			xhr.send();
		}
	}
	function emailCheck() {
		var email = $("#email").val();
		if (email == "") {
			$(".ename").html("이메일을 입력해주세요")
			$(".ename").css("color", "red");
			document.getElementById("sbt").disabled = true;
		} else {
			var xhr = new XMLHttpRequest();
			var id = $("#email").val();
			xhr.open("get", "/member/checkemail?email=" + email, true);
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					var obj = JSON.parse(this.responseText);
					if (obj == false) {
						$(".ename").html("이메일 사용이 가능합니다..");
						$(".ename").css("color", "green");
						document.getElementById("sbt").disabled = false;
					} else {
						$(".ename").html("이메일 사용이 중복됩니다..");
						$(".ename").css("color", "red");
						document.getElementById("sbt").disabled = true;
					}
				}
			}
			xhr.send();
		}
	}

	function checkPasswordPattern(str) {
		var pattern1 = /[0-9]/; // 숫자 
		var pattern2 = /[a-zA-Z]/; // 문자 
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자 
		if (!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str)
				|| str.length < 8) {
			alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
			return false;
		} else {
			return true;
		}
	}
</script>

