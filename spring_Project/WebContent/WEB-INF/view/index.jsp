<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<body class="mainbody">
	<div class="alert alert-warning alert-dismissible" id="warn1" style="display: none">
				<a href="javascript:location.reload();" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>경고!</strong> 다른 윈도우 혹은 탭에서 로그인되었습니다. F5를 눌러주세요.
			</div>
			<div class="alert alert-warning alert-dismissible" id="warn2" style="display: none">
				<a href="javascript:location.reload();" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>경고!</strong> 다른 윈도우 혹은 탭에서 로그아웃되었습니다. F5를 눌러주세요.
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
					<div class="w3-quarter">
						<a href=""><img src="/image/Desert.jpg" alt="Sandwich" style="width: 80%"></a>
						<h3>The Perfect Sandwich, A Real NYC Classic</h3>
						<p>Just some random text, lorem ipsum text praesent tincidunt
							ipsum lipsum.</p>
					</div>
					<div class="w3-quarter">
						<a href=""><img src="/image/Desert.jpg" alt="Steak" style="width: 80%"></a>
						<h3>Let Me Tell You About This Steak</h3>
						<p>Once again, some random text to lorem lorem lorem lorem
							ipsum text praesent tincidunt ipsum lipsum.</p>
					</div>
					<div class="w3-quarter">
						<a href=""><img src="/image/Desert.jpg" alt="Cherries" style="width: 80%"></a>
						<h3>Cherries, interrupted</h3>
						<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
						<p>What else?</p>
					</div>
					<div class="w3-quarter">
						<a href=""><img src="/image/Desert.jpg" alt="Pasta and Wine"
							style="width: 80%"></a>
						<h3>Once Again, Robust Wine and Vegetable Pasta</h3>
						<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
					</div>
				</div>

				<!-- Second Photo Grid-->
				<div class="w3-row-padding w3-padding-16 w3-center">
					<div class="w3-quarter">
						<a href=""><img src="/image/Desert.jpg" alt="Popsicle" style="width: 80%"></a>
						<h3>All I Need Is a Popsicle</h3>
						<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
					</div>
					<div class="w3-quarter">
						<a href=""><img src="/image/Desert.jpg" alt="Salmon" style="width: 80%"></a>
						<h3>Salmon For Your Skin</h3>
						<p>Once again, some random text to lorem lorem lorem lorem
							ipsum text praesent tincidunt ipsum lipsum.</p>
					</div>
					<div class="w3-quarter">
						<a href=""><img src="/image/Desert.jpg" alt="Sandwich" style="width: 80%"></a>
						<h3>The Perfect Sandwich, A Real Classic</h3>
						<p>Just some random text, lorem ipsum text praesent tincidunt
							ipsum lipsum.</p>
					</div>
					<div class="w3-quarter">
						<a href=""><img src="/image/Desert.jpg" alt="Croissant" style="width: 80%"></a>
						<h3>Le French</h3>
						<p>Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum
							lipsum.</p>
					</div>
				</div>

			</div>
			<div id="menu1" class="tab-pane fade">
				<div class="main_keywords" >
					<h3 class="txt_brunch tit_brunch">BRUNCH KEYWORD</h3>
					<p class="desc_brunch">
						<span class="txt_brunch">키워드로 분류된 다양한 글 모음</span>
					</p>

					<div class="keyword_list_wrap">
						<div class="keyword_list #home_keyword"></div>
					</div>

					<div class="cl_b"></div>


					<table class="main_keyword" >
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
	<script><%-- WebSocket을 하기 위해선 script처리가 필요하다.--%>
		var ac = new WebSocket(
				"ws://${pageContext.request.serverName}/logonWS");
		ac.onopen = function() {
			console.log(this);
		}
		ac.onmessage = function(rst) {
			if(rst.data == "로그인"){
				$("#warn1").show();
			}
			if(rst.data == "로그아웃"){
				$("#warn2").show();
			}
			console.log(rst);
		}
	</script>