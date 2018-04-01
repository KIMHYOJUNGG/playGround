<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="../include/header.jsp" %> --%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" value="${admin.title}"
							readonly="readonly">
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">BookName</label><br /> <input
							type="text" name='title' class="form-control"
							value="${admin.bookname}" readonly="readonly">
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
							readonly="readonly">
					</div>
					<div class="form-group">
						<c:if test="${ !empty comments  }">
							<label for="exampleInputEmail1">comments</label>
							<c:forEach var="co" items="${comments }" varStatus="vs">

								<p>${co.id } &nbsp; &nbsp; &nbsp; ${co.reply } &nbsp; &nbsp;
									&nbsp; ${co.date}</p>

							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="form-group"></div>
				<!-- /.box-body -->

				<div class="box-footer">
					<c:if test="${sessionScope.logon== boardVO.writer}">
						<button type="submit" class="btn btn-modify">Modify</button>
						<button type="submit" class="btn btn-danger">REMOVE</button>
					</c:if>
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
					</script>
				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->

		</div>
		<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%--     
<%@include file="../include/footer.jsp" %> --%>










