<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="../include/header.jsp" %> --%>
<body>
	<div class="box-body">
		<form role="form" method="post">
			<input type='hidden' name='no' id='no' value="${admin.no}"> <input
				type='hidden' name='id' id='id' value="${admin.writer }">
		</form>
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> <input type="text"
				name='title' class="form-control" value="${admin.title}"
				readonly="readonly">
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">BookName</label><br /> <input
				type="text" name='title' class="form-control"
				value="${admin.bookname}" readonly="readonly" />
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3" id="ck"
				readonly="readonly">${contents}</textarea>
			<script type="text/javascript">
				$(function() {
					CKEDITOR.replace('ck', {
						//width : '620px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
						height : '500px' // 입력창의 높이

					});

				});
			</script>

		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label></br> <input type="text"
				name='title' class="form-control" value="${admin.writer}"
				readonly="readonly" />
		</div>
	</div>
	<div class="form-group"></div>
	<!-- /.box-body -->

	<div class="box-footer">
		<button type="submit" class="btn btn-modify">Modify</button>
		<button type="submit" class="btn btn-danger">REMOVE</button>
	</div>
</body>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/admin/remove");
			formObj.submit();
		});
		$(".btn-modify").on("click", function() {
			formObj.attr("action", "/admin/modify");
			formObj.submit();
		});
	});
	opener.location.reload();
</script>









