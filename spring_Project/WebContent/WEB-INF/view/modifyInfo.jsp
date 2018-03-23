
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

<div class="container">
	<form class="form-horizontal" action="${pageContext.request.contextPath }/modifyInfo" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2" for="id">ID:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  id="id"  name="id" value="${logon }" disabled>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="password">새 PASSWORD:</label>
			<div class="col-sm-10">
				<input type="password" class="form-control"  id="password" name="password">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="password2">PASSWORD 확인:</label>
			<div class="col-sm-10">
				<input type="password" class="form-control"  id="password2" name="password2">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="nickname">NICKNAME:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="nickname" name="nickname" value="${info.NICKNAME }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">EMAIL:</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="email" name="email" value="${info.EMAIL }">
			</div>
		</div>
		<div align="center" style="padding:15px">
			<c:if test="${!empty info.IMAGE }">
				<img src="${info.IMAGE }" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
			<c:if test="${empty info.IMAGE }">
				<img src="${pageContext.request.contextPath }/image/default_profile.png" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="image">IMAGE:</label>
			<div class="col-sm-10">
				<input type="file" class="form-control" id="image" name="image" placeholder="변경할 사진" accept="image/*">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="welcome">인사말:</label>
			<div class="col-sm-10">
				<textarea class="form-control" rows="5" id="welcome" name="welcome">${info.WELCOME }</textarea>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10" align="right">
				<button type="submit" class="btn btn-default">수정</button>
			</div>
		</div>
	</form>
</div>

<c:if test="${!empty msg }">
	<script>
		window.alert("${msg}");
	</script>
</c:if>

