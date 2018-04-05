<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<html>
<head>
<style>
.postTr {
	display: none;
}
</style>
<title>회원관리</title>
</head>
<body>
	<div>
		<%@include file="/WEB-INF/view/admin/msg_top.jsp"%>
		<hr />
		<table>
			<thead>
				<tr style="background: silver">
					<th style="width: 10px;"><input type="checkbox" id="all"
						onchange="allcheck()" /></th>
					<th style="width: 150px;">보낸이</th>
					<th style="width: 150px;">제목</th>
					<th style="width: 50px">상태</th>
				</tr>
			</thead>
			<c:forEach var="m" items="${getmessage }">
				<tr align="center">
					<input type="hidden" id="hidden" value="${m.SENDID }" />
					<input type="hidden" id="htitle" value="${m.TITLE }"/>
					<td><input type="checkbox" class="item" id="check"
						value="${m.NO }" onchange="check()" /></td>
					<td>${m.SENDID }</td>
					<td>${m.TITLE }</td>
					<c:if test="${m.READCHECK == 'Y' }">
						<td><b>읽음</b></td>
					</c:if>
					<c:if test="${m.READCHECK == 'N' }">
						<td>안읽음</td>
					</c:if>
					<td onclick="javascript:postnTr()"><font id="postnTab">▼</font></td>
				</tr>
				<tr id="postnTr" class="postTr">
					<td></td>
					<td>내용</td>
					<td>${m.MSG }</td>
					<td><a href="javascript:post()">답장</a></td>
				</tr>
			</c:forEach>
			<tr>
				<button type="button" class="btn-info" onclick="rm()">삭제</button>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
	function postnTr(){
		if($('#postnTab').text()=="▼"){
			$('#postnTr').show();
			$('#postnTab').text("▲");
		}else{
			$('#postnTr').hide();
			$('#postnTab').text("▼");
		}
	}
	function allcheck() {
		var ar = document.getElementsByClassName("item");
		if (document.getElementById("all").checked) {
			for (var i = 0; i < ar.length; i++) {
				ar[i].checked = true;
			}
		} else {
			for (var i = 0; i < ar.length; i++) {
				ar[i].checked = false;
			}
		}
	}
	function check() {
		var cnt = 0;
		var ar = document.getElementsByClassName("item");
		for (var i = 0; i < ar.length; i++) {
			if (ar[i].checked == false) {
				document.getElementById("all").checked = false;
				return;
			} else {
				cnt++;
			}
		}
		if (cnt == ar.length) {
			document.getElementById("all").checked = true;
		}
	}
	
	function rm() {
		console.log("del 호출");
		var dels = [];
		var cnt = 0;
		console.log($(".item:checked"));
		$(".item:checked").each(function(){
			cnt = dels.push($(this).val());
		});
		console.log(dels);
		$.get("${pageContext.request.contextPath }/admin/removeMessage?no="+dels, function(obj){
			console.log("get 진행..."+obj);
			if (obj.rst) {
				window.alert("총 "+cnt+" 건이 삭제되었습니다.");
			} else {
				window.alert("삭제 실패. \r\n다시 시도해 주세요.");
			}
			location.reload();
			opener.location.reload();
		});
	}
	
	function post(){
		console.log("답장 호출");
		var id = $('#hidden').val();
		var title = $('#htitle').val();
		console.log(id);
		window.open("/admin/sendAnswer?id="+id+"&title="+title,"m","left=100,top=200,width=400,height=300");
	}
</script>