<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<body class="mainbody">
	<div class="alert alert-warning alert-dismissible" id="warn1" style="display: none">
				<a href="javascript:location.reload();" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>���!</strong> �ٸ� ������ Ȥ�� �ǿ��� �α��εǾ����ϴ�. F5�� �����ּ���.
			</div>
			<div class="alert alert-warning alert-dismissible" id="warn2" style="display: none">
				<a href="javascript:location.reload();" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>���!</strong> �ٸ� ������ Ȥ�� �ǿ��� �α׾ƿ��Ǿ����ϴ�. F5�� �����ּ���.
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
						<span class="txt_brunch">Ű����� �з��� �پ��� �� ����</span>
					</p>

					<div class="keyword_list_wrap">
						<div class="keyword_list #home_keyword"></div>
					</div>

					<div class="cl_b"></div>


					<table class="main_keyword" >
						<tr class="main_tr">
							<th class="main_th"><a href="">���迩��</a></th>
							<th class="main_th"><a href="">�۾���</a></th>
							<th class="main_th"><a href="">��ȭ������</a></th>
							<td class="main_td"><a href="">�׸�������</a></td>
							<td class="main_td"><a href="">������ ��������</a></td>
							<td class="main_td"><a href="">���ࡤ����</a></td>
						</tr>
						<tr class="main_tr">
							<th class="main_th"><a href="">�û硤�̽�</a></th>
							<th class="main_th"><a href="">��ŸƮ�� �����</a></th>
							<th class="main_th"><a href="">�ι��С�ö��</a></th>
							<td class="main_td"><a href="">ITƮ����</a></td>
							<td class="main_td"><a href="">�����̾߱�</a></td>
							<td class="main_td"><a href="">�����д� ����</a></td>
						</tr>
						<tr class="main_tr">
							<th class="main_th"><a href="">�������Կ�</a></th>
							<th class="main_th"><a href="">�丮��������</a></th>
							<th class="main_th"><a href="">�츮�� �ݷ�����</a></th>
							<td class="main_td"><a href="">�ǰ����</a></td>
							<td class="main_td"><a href="">������̺�</a></td>
							<td class="main_td"><a href="">������ ���丮</a></td>
						</tr>
					</table>

				</div>
			</div>

		</div>
	</div>
	</div>
	</div>
</body>
	<script><%-- WebSocket�� �ϱ� ���ؼ� scriptó���� �ʿ��ϴ�.--%>
		var ac = new WebSocket(
				"ws://${pageContext.request.serverName}/logonWS");
		ac.onopen = function() {
			console.log(this);
		}
		ac.onmessage = function(rst) {
			if(rst.data == "�α���"){
				$("#warn1").show();
			}
			if(rst.data == "�α׾ƿ�"){
				$("#warn2").show();
			}
			console.log(rst);
		}
	</script>