<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
<title>신고글</title>
</head>
<body>
	<div align="center">
		<h2>${title }
			<small style="font-size: 15px;">${writer }</small>
		</h2>
		<div align="right">
			<button type="button" class="btn-info" onclick="rm()">삭제</button>
		</div> 
		<hr />
		<table>
			<thead>
				<tr style="background: silver">
					<th><input type="checkbox" id="all" onchange="allcheck()" /></th>
					<th style="width: 200px;">번호</th>
					<th style="width: 200px;">게시글</th>
					<th style="width: 200px;">신고내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${reportlist }">
					<tr align="center">
						<td><input type="checkbox" class="item" onchange="check()"
							value="${m.RNO }" /></td>
						<td>${m.NO }</td>
						<td>${m.BTITLE }</td>
						<td>${m.REASON }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
<script>
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
		$.get("${pageContext.request.contextPath }/admin/removeRep?rno="+dels, function(obj){
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
</script>