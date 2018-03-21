<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body class="mainbody">
	<div align="center">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Main</a></li>
			<li><a data-toggle="tab" href="#menu1">Brunch Keyword</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">

				<!-- First Photo Grid-->
				<div class="w3-row-padding w3-padding-16 w3-center" id="food">
					<c:forEach var="o" items="${boardNo}"  varStatus="vs">
					<c:choose>
					<c:when test="${vs.count <= 8}">
					<div class="w3-quarter">
							<a href="/board/read?bno=${o.NO}"><img
								src="/image/Desert.jpg" alt="1" style="width: 80%"></a>
							<h3>${o.TITLE }</h3>
							<p>${o.TITLE }</p>
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
							<th class="main_th"><a href="">세계여행</a></th>
							<th class="main_th"><a href="">글쓰기</a></th>
							<th class="main_th"><a href="">문화·예술</a></th>
							<td class="main_td"><a href="">그림·웹툰</a></td>
							<td class="main_td"><a href="">직장인 현실조언</a></td>
							<td class="main_td"><a href="">건축·설계</a></td>
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