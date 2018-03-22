<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
<form role="form" method="post">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">Type</label> 
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
			${logon } 
		</div> 
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> 
			<input type="text"
				name='title' class="form-control" placeholder="Enter Title">
		</div>
		
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3"
				placeholder="Enter ..."></textarea>
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>

</body>
