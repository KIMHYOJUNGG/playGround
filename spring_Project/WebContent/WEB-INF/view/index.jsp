
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<body class="mainbody">
	<div class="alert alert-warning alert-dismissible" id="warn1"
		style="display: none">
		<a href="javascript:location.reload();" class="close"
			data-dismiss="alert" aria-label="close">&times;</a> <strong>경고!</strong>
		다른 윈도우 혹은 탭에서 로그인되었습니다. F5를 눌러주세요.
	</div>
	<div class="alert alert-warning alert-dismissible" id="warn2"
		style="display: none">
		<a href="javascript:location.reload();" class="close"
			data-dismiss="alert" aria-label="close">&times;</a> <strong>경고!</strong>
		다른 윈도우 혹은 탭에서 로그아웃되었습니다. F5를 눌러주세요.
	</div>
	<div align="center">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Main</a></li>
			<li><a data-toggle="tab" href="#menu1">Brunch Keyword</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">

				<!-- First Photo Grid-->
				<div class="w3-row-padding w3-padding-16 w3-center" id="food">
					<c:forEach var="o" items="${boardNo}" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count <= 8}">
								<div class="w3-quarter">
									<c:if test="${o.IMAGE == null}">
										<a href="/board/readPage?no=${o.NO}"><img
											src="${pageContext.request.contextPath }/image/Desert.jpg"
											alt="1" style="width: 80%"></a>
									</c:if>
									<a href="/board/readPage?no=${o.NO}"><img
											src="${o.IMAGE }"
											alt="1" style="width: 80%"></a>
									<h3>${o.TITLE }</h3>
									<p>${o.BOOKNAME }</p>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>

				</div>

			</div>
			<div id="menu1" class="tab-pane fade">
				<div class="main_keywords">
					<h3 class="txt_brunch tit_brunch">BRUNCH KEYWORD</h3>
					<p class="desc_brunch">
						<span class="txt_brunch">키워드로 분류된 다양한 글 모음</span>
					</p>

					<div class="keyword_list_wrap">
						<div class="keyword_list #home_keyword"></div>
					</div>

					<div class="cl_b"></div>


					<table class="main_keyword">
						<tr class="main_tr">
							<th class="main_th"><a href="${pageContext.request.contextPath }/keyword?type=세계여행">세계여행</a></th>
							<th class="main_th"><a href="${pageContext.request.contextPath }/keyword?type=글쓰기">글쓰기</a></th>
							<th class="main_th"><a href="${pageContext.request.contextPath }/keyword?type=문화·예술">문화·예술</a></th>
							<td class="main_td"><a href="${pageContext.request.contextPath }/keyword?type=그림·웹툰">그림·웹툰</a></td>
							<td class="main_td"><a href="${pageContext.request.contextPath }/keyword?type=직장인 현실조언">직장인 현실조언</a></td>
							<td class="main_td"><a href="${pageContext.request.contextPath }/keyword?type=건축·설계">건축·설계</a></td>
						</tr>
						<tr class="main_tr">
							<th class="main_th"><a href="">시사·이슈</a></th>
							<th class="main_th"><a href="">스타트업 경험담</a></th>
							<th class="main_th"><a href="">인문학·철학</a></th>
							<td class="main_td"><a href="">IT트렌드</a></td>
							<td class="main_td"><a href="">육아이야기</a></td>
							<td class="main_td"><a href="">쉽게읽는 역사</a></td>
						</tr>
						<tr class="main_tr">
							<th class="main_th"><a href="">사진·촬영</a></th>
							<th class="main_th"><a href="">요리·레시피</a></th>
							<th class="main_th"><a href="">우리집 반려동물</a></th>
							<td class="main_td"><a href="">건강·운동</a></td>
							<td class="main_td"><a href="">사랑·이별</a></td>
							<td class="main_td"><a href="">디자인 스토리</a></td>
						</tr>
					</table>

				</div>
			</div>

		</div>
	</div>
	</div>
	</div>
</body>
<script><%-- WebSocket을 하기 위해선 script처리가 필요하다.--%>
	var ac = new WebSocket("ws://${pageContext.request.serverName}/logonWS");
	ac.onopen = function() {
		console.log(this);
	}
	ac.onmessage = function(rst) {
		if (rst.data == "로그인") {
			$("#warn1").show();
		}
		if (rst.data == "로그아웃") {
			$("#warn2").show();
		}
		console.log(rst);
	}
</script>