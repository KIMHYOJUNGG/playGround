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
<title>메세지함</title>
</head>
<body>
	<div style="width:25%">  
	<h3>메세지함</h3>
		<hr />
		<table>
			<thead>
				<tr style="background: silver">
					<th style="width: 10px;"><input type="checkbox" id="all"
						onchange="allcheck()" /></th>
					<th style="width: 150px;">보낸이</th>
					<th style="width: 150px;">제목</th>
				</tr>
			</thead>
			<c:forEach var="m" items="${getmessage }">
				<tr align="center">
					<input type="hidden" id="hidden" value="${m.SENDID }" />
					<input type="hidden" id="htitle" value="${m.TITLE }" />
					<td><input type="checkbox" class="item" id="check"
						value="${m.NO }" onchange="check()" /></td>
					<td>${m.SENDID }</td>
					<td>${m.TITLE }</td>
					<td onclick="javascript:postnTr()"><div id="postnTab"
						class="postnTab">▼</div></td>
				</tr>
				<tr id=m class="postTr">
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
	/*  	function postnTr() {
	 if ($('.postnTab').text() == "▼") {
	 $('.postTr').show();
	 $('.postnTab').text("▲");
	 } else {
	 $('.postTr').hide();
	 $('.postnTab').text("▼");
	 }
	 }
	 */
	function postnTr() {
		var ar = $(".postnTab");
		for (var i = 0; i < ar.length; i++) {
			console.log(ar[0].innerHtml);
			if (i == i) {
				if (ar[i].innerHtml =="▼") {
				
					document.getElementById(i).show();
					ar[i].innerHtml="▲";
				} else {
					document.getElementById(i).hide();
					ar[i].innerHtml="▼";
				}
			}
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
		$(".item:checked").each(function() {
			cnt = dels.push($(this).val());
		});
		console.log(dels);
		$.get("${pageContext.request.contextPath }/admin/removeMessage?no="
				+ dels, function(obj) {
			console.log("get 진행..." + obj);
			if (obj.rst) {
				window.alert("총 " + cnt + " 건이 삭제되었습니다.");
			} else {
				window.alert("삭제 실패. \r\n다시 시도해 주세요.");
			}
			location.reload();
			opener.location.reload();
		});
	}

	function post() {
		console.log("답장 호출");
		var id = $('#hidden').val();
		var title = $('#htitle').val();
		console.log(id);
		window.open("/admin/sendAnswer?id=" + id + "&title=" + title, "m",
				"left=100,top=200,width=400,height=300");
	}
</script>