
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

<div class="container">
	<form class="form-horizontal" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2" for="id">ID:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  id="id"  name="id" value="${logon }" disabled>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="password">새 PASSWORD:</label>
			<div class="col-sm-10">
				<input type="password" class="form-control"  id="password" name="password" onblur="passCheck()">
				<span id="msg_pw"></span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="password2">PASSWORD 확인:</label>
			<div class="col-sm-10">
				<input type="password" class="form-control"  id="password2" name="password2" onblur="passCheck2()">
				<span id="msg_pw2"></span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="nickname">NICKNAME:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="nickname" name="nickname" value="${info.NICKNAME }" onblur="nickCheck()" required>
				<span id="msg_nick"></span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">EMAIL:</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="email" name="email" value="${info.EMAIL }" required>
				<span id="msg_email"></span>
			</div>
		</div>
		<div align="center" style="padding:15px">
			<c:if test="${!empty info.IMAGE }">
				<img src="${info.IMAGE }" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
			<c:if test="${empty info.IMAGE }">
				<img src="${pageContext.request.contextPath }/image/default_profile.png" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="image">IMAGE:</label>
			<div class="col-sm-10">
				<input type="file" class="form-control" id="image" name="image" placeholder="변경할 사진" accept="image/*">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="welcome">인사말:</label>
			<div class="col-sm-10">
				<textarea class="form-control" rows="5" id="welcome" name="welcome">${info.WELCOME }</textarea>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10" align="right">
				<button type="submit" id="btn" class="btn btn-default" formaction="${pageContext.request.contextPath }/modifyInfo">수정</button> 
				<button type="submit" class="btn btn-default" formaction="javascript:void(0);" onclick="dropmember( )">회원탈퇴</button>
			</div>
		</div>
	</form>
</div>
<script>
	function nickCheck() {
		console.log("nickCheck");
		var nick = $("#nickname").val();
		if( ! (nick == "" || nick == "undefined")) {
			$.get("${pageContext.request.contextPath }/modifyInfo/check", {
				"nickname" : $("#nickname").val(),
				"id" : '${logon}'
			},function(obj){
				if(!obj.rst) {
					$("#msg_nick").css("color", "red");
					$("#msg_nick").html("이미 사용 중 입니다.");
				} else {
					$("#msg_nick").css("color", "green");
					$("#msg_nick").html("사용 가능합니다.");
					confirm();
				}
			});
		} else {
			$("#btn").prop("disabled", true);
		}
	}
	
	function email_check( email ) {
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email));
	}
	
	 $("input[name='email']").blur(function(){
	        var email = $(this).val();
	 
	        // 값을 입력안한경우는 아예 체크를 하지 않는다.
	        if( email == '' || email == 'undefined') return;
	 
	        // 이메일 유효성 검사
	        if( email_check(email) ) {
	        	emailCheck();
	        } else {
	            alert('잘못된 형식의 이메일 주소입니다.');
	            $(this).focus();
	            $("#btn").prop("disabled", true);
	            return false;
	        }
	    });
	
	function emailCheck() {
		console.log("emailCheck");
		if( !($("#email").val() == "" || $("#email").val() == "undefined") ) {
			$.get("${pageContext.request.contextPath }/modifyInfo/check", {
				"email" : $("#email").val(),
				"id" : '${logon}'
			},function(obj){
				if(!obj.rst) {
					$("#msg_email").css("color", "red");
					$("#msg_email").html("이미 사용 중 입니다.");
				} else {
					$("#msg_email").css("color", "green");
					$("#msg_email").html("사용 가능합니다.");
					confirm();
				}
			});
		} else {
			$("#btn").prop("disabled", true);
		}
	}
	
	function passCheck() {
		console.log("passCheck");
		if($("#password").val().length > 1) {
			console.log("pw.length > 1");
			$("#password2").prop("required", true);
			var pw = $("#password").val();
		} else {
			$("#password2").val("");
			$("#msg_pw2").html("");
			$("#password2").prop("required", false);
		}
	}
	
	function passCheck2() {
		if($("#password2").prop("required")) {
			var pw = $("#password").val();
			var pw2 = $("#password2").val();
			if(pw == pw2) {
				$("#msg_pw2").html("");
				confirm();
			}	else {
				$("#msg_pw2").css("color","red");
				$("#msg_pw2").html("비밀번호가 다릅니다.	");
			}		
		}
	}
	
	function confirm() {
		var filled = false;
		var 	n = $("input:required");
		console.log("n");
		console.log(n);
		for( var i = 0; i < n.length; i++) {
			console.log("in for");
			console.log(n[i].value);
			if (n[i].value == null) {
				break;
			} else if (n[i].value.length < 1){
				filled = false;
				break;
			} else {
				filled = true;
			}
		}
		$("#btn").prop("disabled", !filled);
	}
	
	$(function(){
		
			var filled = false;
			var 	n = $("input:required");
			console.log("n");
			console.log(n);
			for( var i = 0; i < n.length; i++) {
				console.log("in for");
				console.log(n[i].value);
				if (n[i].value == null) {
					break;
				} else if (n[i].value.length < 1){
					filled = false;
					break;
				} else {
					filled = true;
				}
			}
			$("#btn").prop("disabled", !filled);
		
	});
	
	function dropmember(){
		window.open("/member/godrop",	"m","left=100,top=200,width=700,height=300");
		opener.location.reload(); 
	};
</script>

<c:if test="${!empty msg }">
	<script>
		window.alert("${msg}");
	</script>
</c:if>

