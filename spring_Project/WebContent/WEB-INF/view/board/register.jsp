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


					<!-- <div class="box-body"> -->
					<div class="form-group">
						<label for="usr">Type</label> <input type="text" name='type'
							class="form-control" placeholder="Enter Type">
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">bookname</label><br /> <select
							name="book">

							<c:forEach items="${listbook}" var="bookVO">

								<option value="${bookVO.bno },${bookVO.bookName}">
									${bookVO.bookName }</option>


							</c:forEach>


						</select>

					</div>

					<!-- 
					<div class="form-group">
						<label for="exampleInputEmail1">BookName</label> <input
							type="text" name='bookname' class="form-control"
							placeholder="Enter BookName">
					</div> -->
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label><br /> <input
							type="text" name='writer' class="form-control"
							readonly="readonly" value="${logon!=null?logon:"" } ">

					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" placeholder="Enter Title">
					</div>


					<div class="form-group">
						<label for="comment">Content</label>
						<textarea class="form-control" id="ck" name="content" rows="200"
							placeholder="Enter ..."></textarea>
						<script type="text/javascript">
							$(function() {
								CKEDITOR.replace('ck', {
									//width : '620px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
									height : '500px', // 입력창의 높이
								filebrowserUploadUrl :'/imageUpload.do'
								
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
