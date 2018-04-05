<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <%@include file="../include/header.jsp"%> --%>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->
				<form role="form" method="post">


					<div class="form-group">
						<label for="exampleInputEmail1">Type</label><br /> <select
							name="type">
							<c:forEach items="${type}" var="v">
								<option value="${v }">${v}</option>
							</c:forEach>
						</select>
					</div>
					<!-- <div class="box-body"> -->
					<div class="form-group">
						<label for="usr">Tag</label> <input type="text"
							class="form-control" placeholder="작성양식: #aa #aa #aa" name="tag"
							id="tag" onkeyup="checkTag()">
						<button id="getTag">적합성판단하기</button>
					</div>
					<!--  <input type='hidden' id="ttag" name="tag" > -->
					<div id="tags"></div>
					<script>
						$("#getTag").on("click", function() {
							var txt = $("#tag").val();
							var tags = [];
							console.log(txt);
							txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
								console.log(tag);
								tags.push(tag);
							});
							console.log(txt);
							console.log(tags);
							$("#ttag").val(tags);
							$("#tags").html(tags.join('<br />'));
							console.log($("#ttag").val());
						});

						function checkTag() {
							var tag = $("#tag").val();
							console.log($("#tag").val());
							if (tag.charCodeAt(tag.length - 1) == 32) {
								if (tag.charCodeAt(tag.length - 2) != 35) {
									$("#tag")
											.val(
													tag.substr(0,
															tag.length - 1)
															+ "#");
								} else {
									$("#tag")
											.val(tag.substr(0, tag.length - 1));
								}
							}
							if (tag.indexOf("　") != -1) {
								if (tag.charCodeAt(tag.indexOf("　") - 1) != 35) {
									$("#tag").val(tag.replace("　", "#"));
								} else {
									$("#tag").val(
											tag.substr(0, tag.indexOf("　")));
								}
							}
						}
					</script>

					<div class="form-group">
						<label for="exampleInputEmail1">bookname</label><br /> <select
							name="book">

							<c:forEach items="${listbook}" var="bookVO">

								<option value="${bookVO.bno },${bookVO.bookName}">
									${bookVO.bookName }</option>


							</c:forEach>


						</select>

					</div>


					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label><br /> <input
							type="text" name='writer' class="form-control"
							readonly="readonly" value="${logon!=null?logon:'' } ">

					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" placeholder="Enter Title"
							required="required" maxlength="300">
					</div>


					<div class="form-group">
						<label for="comment">Content</label>
						<textarea class="form-control" id="ck" name="content" rows="200"
							placeholder="Enter ..." required="required"></textarea>
						<script type="text/javascript">
							$(function() {
								CKEDITOR.replace('ck', {
									//width : '620px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
									height : '500px', // 입력창의 높이
									filebrowserUploadUrl : '/image'

								});

							});
						</script>
					</div>

					<!-- 	<div class="form-group">
  <label for="comment">Comment:</label>
  <textarea class="form-control" rows="5" id="comment"></textarea>
</div>  -->
			</div>
			<!-- /.box-body -->

			<div class="box-footer">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
			</form>



			<!-- </div> -->
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<!-- Bootstrap 3.3.2 JS -->
<%-- 
<%@include file="../include/footer.jsp"%> --%>

