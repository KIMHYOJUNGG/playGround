<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<h3>책 정보 수정</h3>
	<form class="form-horizontal"  method="post">
		<div class="form-group">
			<label class="control-label col-sm-2" for="bookName">BOOK NAME:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="bookName" placeholder="책 제목을 입력해 주세요" name="bookName"  value="${bookInfo.bookName }" required>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="tag">TAG:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="tag" placeholder="#태그#입력" name="tag" value="#${fn:join(bookInfo.tag,'#') }" >
			</div>
		</div>
		<div class="form-group" align="right">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath }/bookPage/${bookInfo.bno }/modify">수정</button>
				<button type="button" class="btn btn-default" onclick="bookDel('${bookInfo.bno}')" >삭제</button>
			</div>
		</div>
	</form>
	<hr/>
	
	<table class="table">
			<thead >
				<tr>
					<th style="text-align: center; width: 10%"><input type="checkbox"  id="topcbx"></th>
					<th style="text-align: center; width: 40%">글 제목</th>
					<th style="text-align: center; width: 10%">분류</th>
					<th style="text-align: center; width: 10%">Good</th>
					<th style="text-align: center; width: 10%">View</th>
					<th style="text-align: center; width: 20%">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty contentsList }">
						<td colspan="4">발행된 글이 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="cts" items="${contentsList }">
							<tr>
								<td><input type="checkbox" class="ctscbx"  value="${cts.NO }"></td>
								<td style="width: 40%"><a href="${pageContext.request.contextPath }/board/readPage?no=${cts.NO}">${cts.TITLE }</a></td>
								<td style="width: 10%">${cts.TYPE }</td>
								<td style="width: 10%">${msg.GOOD }</td>
								<td style="width: 10%">${msg.VIEW }</td>
								<td style="width: 20%"><fmt:formatDate value="${cts.REGDATE }" pattern="yy/MM/dd HH:mm"/>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
						<td colspan="6"><button type="button" class="btn btn-info" onclick="del()">삭제</button></td>
				</tr>
			</tbody>
	</table>
	
	<script>
		$("#topcbx").prop("checked", false);
	
		$("#topcbx").click(function() {
			if($(this).prop("checked")) {
				$(".ctscbx").prop("checked", true);
			} else {
				$(".ctscbx").prop("checked", false);
			}
		});
		
		function del() {
			var ans = window.confirm("글 삭제시 복구할 수 없습니다.\r\n정말 삭제하시겠습니까?");
			if(ans) {
				var dels = [];
				var cnt = 0;
				$(".ctscbx:checked").each(function(){
					cnt = dels.push($(this).val());
					console.log("cnt : "+cnt);
				});
					console.log(dels);
				$.get("${pageContext.request.contextPath}/bookPage/delContents",{"no" : dels}
					, function(obj){
						if(obj.rst) {
							window.alert(cnt+"건이 삭제되었습니다.");
							location.reload();
						} else {
							window.alert("삭제 실패. \r\n다시 시도해 주세요.");
						}
				});
			}
		}
		
		function bookDel(bno) {
			var ans = window.confirm("삭제시 책에 등록된 모든 게시글이 함께 삭제됩니다.\r\n정말 삭제하시겠습니까?");
			if(ans) {
				$.get("${pageContext.request.contextPath}/bookPage/"+bno+"/del",{"bno" : bno}
					,function(obj){
						if(obj.rst) {
							window.alert("삭제되었습니다.");
							location.assign("${pageContext.request.contextPath}/@${bookInfo.writer}");
						} else {
							window.alert("삭제 실패. \r\n다시 시도해 주세요.");
						}
					});
			}
		}
	</script>
		
		