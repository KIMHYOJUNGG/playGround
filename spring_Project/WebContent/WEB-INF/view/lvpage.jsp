<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="outer">
	<div class="inner"  style="max-width: 800px">
		<div class="centered" >
		<c:choose>
			<c:when test="${lv==0}">
				<p>현재 귀하의 권한으로는 행할수 없습니다.</p>
				<p>이메일 인증을 통하여 권한을 변경하시겠습니까?</p>
				<p style="margin: 35px"><a href="/member/lvup2"><button class="btn btn-info" style="width:69px">예</button>  </a> 
				/ <a href="${uri }"><button  class="btn btn-info">아니오</button> </a> </p>
			</c:when>
			<c:otherwise>
			<p>	현재 귀하의 권한은 제한되어있습니다.</p>
			<p>관리자에게 문의해보세요.</p>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>

<script>
	console.log('${lv}');
	console.log('${uri}');
</script>