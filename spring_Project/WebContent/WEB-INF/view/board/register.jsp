<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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

<!-- <div class="form-group">
  <label for="usr">Name:</label>
  <input type="text" class="form-control" id="usr">
</div>
<div class="form-group">
  <label for="pwd">Password:</label>
  <input type="password" class="form-control" id="pwd">
</div>  -->

	<!-- <div class="box-body"> -->
		<div class="form-group">
			<label for="usr">Type</label> 
			<input type="text"
				name='type' class="form-control" placeholder="Enter Type">
		</div>
	<div class="form-group">
			<label for="exampleInputEmail1">BookName</label> 
			<input type="text"
				name='bookname' class="form-control" placeholder="Enter BookName">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label><br/>
			<input type="text"
				name='bookname' class="form-control" readonly="readonly" value="${logon!=null?logon:"" } ">
			
		</div> 
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> 
			<input type="text"
				name='title' class="form-control" placeholder="Enter Title">
		</div>
		
		<div class="form-group">
			<label for="comment">Content</label>
			<textarea class="form-control" name="content" rows="5"
				placeholder="Enter ..."></textarea>
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
