<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container-fluid text-center">
	<br>
	<div class="row">
		<div class="col-sm-4">
			<c:if test="${!empty info.IMAGE }">
				<img src="${info.IMAGE }" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
			<c:if test="${empty info.IMAGE }">
				<img src="${pageContext.request.contextPath }/image/default_profile.png" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
			<p>${info.NICKNAME} 님</p>
		</div>
		<div class="col-sm-8">
			<div class="list-group">
				<a href="${pageContext.request.contextPath }/modifyInfo" class="list-group-item"><b>개인정보 수정</b></a> 
				<a href="javascript:void(0);" class="list-group-item active" onclick="dropdown()"><b>우편함</b> <span>새 메세지 ${newMsgCnt } 건</span></a>
				<a href="${pageContext.request.contextPath }/message/sendBox" class="list-group-item"><b>보낸 메세지</b></a> 
				<a href="${pageContext.request.contextPath }/@${logon}" class="list-group-item"><b>연재 중인 글</b></a>
<!-- 				<a href="#" class="list-group-item">내가 출간한 글</a> -->
			</div>
		</div>
	</div>
	
	<hr/>
	
	<div class="container-fluid">
		<h2>메세지</h2>
		<p></p>
		<div class="table-responsive">
		<table class="table">
			<thead >
				<tr>
					<th style="text-align: center"><input type="checkbox"  id="topcbx"></th>
					<th style="text-align: center; width: 20%">보낸 사람</th>
					<th style="text-align: center; width: 50%">제   목</th>
					<th style="text-align: center; width: 20%">보낸 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty getMsg }">
						<td colspan="4">우편함에 메세지가 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="msg" items="${getMsg }">
							<tr>
								<td class="mtd"><input type="checkbox" class="msgcbx"  value="${msg.NO }"></td>
								<td class="mtd" style="width: 20%"><a href="javascript:void(0);" onclick="sendMsg('${msg.SENDID}')">${msg.SENDID }</a></td>
								<td class="mtd" style="width: 50%"><a href="javascript:void(0);" onclick="readMsg('${msg.NO}')">${msg.TITLE }</a>
								<c:if test="${msg.READCHECK eq 'N' }">
								 &nbsp; &nbsp;<span class="label label-info">NEW</span>
								</c:if></td>
								<td class="mtd" style="width: 20%">${msg.REGDATE }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="4"  align="center"><button type="button" class="btn btn-success" onclick="sendMsg()">메세지 보내기</button>
							 <button type="button" class="btn btn-info" onclick="del()">삭제</button></td>
				</tr>
			</tbody>
		</table>
		</div>
						<script>
							function sendMsg(sendid){
								$("#getid").val(sendid);
								$("#sendModal").modal();
							}
							
							function readMsg(no) {
								$.get("${pageContext.request.contextPath}/message/get", {"no" : no}
									, function(msg){
										$("#from").html(msg.SENDID);
										$("#time").html(msg.REGDATE);
										$("#title2").html(msg.TITLE);
										$("#msgBody2").html(msg.MSG);
										$("#readModal").modal();
										$.get("${pageContext.request.contextPath}/message/readCheck", {"no" : no});
								} );
							}
							
							$("#topcbx").prop("checked", false);
							$(".msgcbx").prop("checked", $("#topcbx").prop("checked"));
							
							$("#topcbx").click(function() {
									$(".msgcbx").prop("checked", $(this).prop("checked"));
							});
							
							var total = $(".msgcbx").length;
							var ckd = 0;
							$(".msgcbx").each(function(){
									$(this).click(function(){
										if($(this).prop("checked"))
											ckd += 1;
										else
											ckd -= 1;
										cbxCheck();
									});
							});
							
							function cbxCheck() {
								if(ckd == total) {
									$("#topcbx").prop("checked", true);
								} else {
									$("#topcbx").prop("checked", false);
								}
							}
							
							function del() {
								console.log("del 호출");
								var dels = [];
								var cnt = 0;
								$(".msgcbx:checked").each(function(){
									cnt = dels.push($(this).val());
								});
								$.get("${pageContext.request.contextPath }/message/getBoxDel", {
									"no" : dels
								}, function(obj){
									console.log("get 진행..."+obj);
									if (obj.rst) {
										window.alert("총 "+cnt+" 건이 삭제되었습니다.");
									} else {
										window.alert("삭제 실패. \r\n다시 시도해 주세요.");
									}
										location.reload();
								});
							}
						</script>
	</div>
	
	<div class="modal fade" id="sendModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="sendHead">메세지 보내기</h4>
				</div>
				<div class="modal-body" align="left">
					<form class="form-horizontal" action="${pageContext.request.contextPath }/message/send" method="post">
						<div class="form-group text-right">
							<label for="getid" class="control-label col-sm-2"> 받을 사람</label>
								<div class="col-sm-10">
									<input type="text" class="form-control " id="getid" name="getid" required>
								</div>
						</div>
						<div class="form-group">
							<label for="msgtitle" class="control-label col-sm-2">제목</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="msgtitle" name="title" required>
							</div>
						</div>
						<div class="form-group">
							<label for="msgBody" class="control-label col-sm-2">내용</label> 
							<div class="col-sm-10">
								<textarea class="form-control" id="msgBody"  rows="15" name="msg" style="resize: none; overflow-y: scroll;" required></textarea>
							</div>
						</div>
						<button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath }/message/send">보내기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="readModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="readHead">받은 메세지</h4>
				</div>
				<div class="modal-body" align="left">
				 <form class="form-horizontal" >
						<div class="form-group">
							<label class="control-label col-sm-3" for="from">보낸 사람:</label>
							<div class="col-sm-3">
								<p id="from" style="color: gray"></p>
							</div>
							<label class="control-label col-sm-3" for="time">보낸 시간:</label>
							<div class="col-sm-3">
								<p id="time" style="color: gray"></p>
							</div>
						</div>
						<div class="form-group">
						<label class="control-label col-sm-2" for="title2">제목:</label>
						<div class="col-sm-10">
							<p id="title2"></p>
						</div>
					</div>
					<div class="form-group">	
						<label class="control-label col-sm-2" for="msgBody2"> 본문:</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="15" id="msgBody2"></textarea>
						</div>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">Close</button>
				</div>
			</div>
		</div>
	</div>
	
</div>

