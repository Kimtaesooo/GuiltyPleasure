<%@page import="dto.UserInfoDTO"%>
<%@page import="dto.UserInfo"%>
<%@page import="dto.Shop"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cnt" value="0" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Outline &mdash; A Free HTML5 Responsive Template by
	FREEHTML5.CO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Google Webfonts -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>



<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
<!-- Magnific Popup -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
<!-- Owl Carousel -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/owl.carousel.min.js"></script>
<!-- toCount -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.countTo.js"></script>
<!-- Main JS -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/main.js"></script>
<!-- Animate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/icomoon.css">
<!-- Simple Line Icons-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/simple-line-icons.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/magnific-popup.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.theme.default.min.css">
<!-- Salvattore -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/salvattore.css">
<!-- Theme Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>



<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="/GuiltyPleasure/design/mintstrap/outline/js/respond.min.js"></script>
	<![endif]-->


<style>
.fh5co-feature, .fh5co-figure {
	display: block;
	color: #444;
	float: left;
	width: 100%;
	text-align: center;
	background: #fff;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	border-radius: 4px;
	padding: 0px 0px;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
	transition: 0.5s;
	margin-bottom: 0em;
}

.fh5co-nav-toggle>span {
	color: #333;
}

a {
	color: #333;
}

.navbar-brand {
	color: #333;
}

#fh5co-offcanvass .fh5co-lead {
	font-size: 15px;
	color: #333;
}

.navbar-brand>span {
	border: 2px solid #333;
}

.navbar-brand:hover {
	color: #3c763d;
}

a {
	color: #333;
}

#fh5co-offcanvass {
	background: #d3d9da;
	color: #878c93;
}

.fh5co-nav-toggle.active i::before, .fh5co-nav-toggle.active i::after {
	background: #333;
}

.fh5co-nav-toggle i {
	background: #333;
}

.fh5co-nav-toggle i::before, .fh5co-nav-toggle i::after {
	background: #333;
}
</style>

</head>

<body>
	<jsp:include page="/test_nav.jsp" />



	<!-- END .header -->

	<div id="fh5co-main">


		<!-- ���� ������ ���� -->

		<br> <br>
		<script>
					

					function explainModal(i) {
							$("#explainModal" + i).modal();
					}
					
					function updateModal(i) {
							$("#updateModal" + i).modal();
					}

					function addModal() {
						
						$("#addModal").modal();
				
					}
					
					function buyModal(i) {
						//������ ����Ʈ���� ��ǰ�� ������ �� �ܾ��� ũ�⸦ ����
						var leftMoney = document.getElementById("getPoint").value - document.getElementById("getPrice"+ i).value;

						//��ǰ ������ ������ ���� �Ұ����ϵ���
						if (document.getElementById("getLimit"+ i).value < 1) {
							$("#check").text("��� �����մϴ٤Ф�");
							$("#cantBuyModal").modal();
						} 
						//�ܾ��� ũ�Ⱑ ���̳ʽ��ϰ�� ���źҰ����ϵ���
						else {
							if (leftMoney < 0) {
								$("#check").text(-leftMoney+ "�� �� ���������^^");
								$("#cantBuyModal").modal();
							} else {
								$("#buyModal" + i).modal();
							}
						}
					}

					
					
					$(document).ready(function(){
						$('#contents').click(function(){
							$('#popup').hide();
							
						});
					});

				
				


				</script>



		<%
					request.setCharacterEncoding("euc-kr");
				%>

		<jsp:useBean id="dao" class="dao.shopmodule.ShopManager"></jsp:useBean>
		<jsp:useBean id="userdao" class="dao.UserInfoDAO"></jsp:useBean>
		<%
					//����¡��� �߰�
					List list = dao.getItemList();
					int totalRecord = list.size();
					int numPerPage = 4;
					int totalPage = 0;
					int nowPage = 0;
					int beginPerPage = 0;
					

					totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

					if (request.getParameter("nowPage") != null)
						nowPage = Integer.parseInt(request.getParameter("nowPage"));


					beginPerPage = nowPage * numPerPage;
				%>

		<%
					//���ǿ��� ���̵� �޾� ������ dto ��������
					String id = (String) session.getAttribute("u_id");
				
					UserInfoDTO uDto = userdao.searchUserInfo(id);
				%>


		<!-- ���ʽ� ����Ʈ ���� �˾� -->
		<%
				
					//����Ʈ ���� ��ī�� ������� ������ǥ ����
					//5���� 1Ȯ���� ����
					int bonusPopup = (int) Math.floor(Math.random() * 5);
					if(bonusPopup==1){
					int topPosition = (int) Math.floor(Math.random() * 1000);
					int leftPosition = (int) Math.floor(Math.random() * 1000);
				%>

		<div id="popup" class="main_pop" style="position: absolute;">
			<form method="post" action="/GuiltyPleasure/bonusPoint">
				<div id="contents"
					style="position: relative; top: <%=topPosition%>px; left: <%=leftPosition%>px; z-index:1000;">
					<input type="image" name="submit" value="submit"
						src="/GuiltyPleasure/CORDING/shop/img/pikachu.gif" /> <input
						type="hidden" name="id" value="<%=id%>"><input
						type="hidden" name="cmd" value="bonusPoint">
				</div>
			</form>
		</div>
		<%
				}
				%>



		<br> <br>

		<!-- ���ø� ���� ������ -->
		<div class="row">
			<div
				style="padding-top: 0px; height: 90px; background-color: #4fd2c2">
				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
					<h2
						class="fh5co-lead animate-single product-animate-1 fadeIn animated">Item
						Shop</h2>
					<p
						class="fh5co-sub animate-single product-animate-2 fadeIn animated">
						<font size="3"> �Ƿ��� ������ ��¿ �� ����. �ۻ��� �º��ϼ���!<%=id%>��!
						</font>
					</p>
				</div>
			</div>
		</div>


		<div class="row" align="center">
			<div class="col-md-1 to-animate fadeInUp animated">
				<!-- ù��° �������� ��� ���� ������������ ���ư��� ȭ��ǥ ���� -->
				<%
							if (nowPage != 0) {
						%>
				<form action="/GuiltyPleasure/shop" method="post">
					<input type="hidden" name="cmd" value="SHOPLIST"> <input
						type="hidden" name="nowPage" value="<%=nowPage - 1%>"> <input
						type="image" name="Submit" value="Submit"
						src="/GuiltyPleasure/CORDING/shop/img/pre.png">
				</form>

				<%
							}
						%>



			</div>
			<div class="col-md-10">

				<div class="row">

					<!-- 4���� ��������, �����������ͱ��� ����ϰ� �ݺ��� �� -->
					<%
							for (int i = beginPerPage; i < numPerPage + beginPerPage; i++) {
								if (i == totalRecord) {
									if (id.equals("master")) {
							%>

					<!--�������ΰ�� �����������ͱ��� ��µ� ���� �������߰���ư ���̰��ϱ� -->
					<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12">

						<a class="fh5co-figure to-animate fadeInUp animated">

							<figure>
								<input type="image" class="add" onclick="addModal()"
									src="/GuiltyPleasure/CORDING/shop/img/add.png" />
							</figure>
						</a>

					</div>
					<%
									}
									break;
							}

									Shop item = (Shop) list.get(i);
							%>


					<!-- ��ǰ ��� ��� -->
					<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12">

						<a class="fh5co-figure to-animate fadeInUp animated"
							style="border: 1px solid gray;">
							<figure>
								<img
									src="/GuiltyPleasure/CORDING/shop/img/<%=item.getS_itemcode()%>.png"
									onERROR="this.src='/GuiltyPleasure/CORDING/shop/img/default.jpg'"
									class="img-responsive">
							</figure>

							<h3 class="fh5co-figure-lead">
								<hr><%=item.getS_itemname()%><hr>
							</h3>

							<p class="fh5co-figure-text">
								<c:set var="cnt" value="${cnt+1}" />
								<font size="2"> ��ǰ���� : <%=item.getS_price()%><br>
									������: <%=item.getS_deadline()%><br> �������� : <%=item.getS_limit_num()%>
								</font>
							<p align="right">
								<button type="button" role="buy" class="btn btn-default btn-xs"
									onclick="buyModal(${cnt})">����</button>

								<!-- ���� ��ư���� �������� ����, ���� �� ����/ ���� üũ�Ͽ� ���� �Ұ����� ��Ȳ������ jquery���� ���� ��� ��� ���� �Ұ� ����� �����ֵ��� ��-->
								<input type="hidden" id="getLimit${cnt}"
									value="<%=item.getS_limit_num()%>"> <input
									type="hidden" id="getPoint" value="<%=uDto.getPoint()%>">
								<input type="hidden" id="getPrice${cnt}"
									value="<%=item.getS_price()%>">

								<button type="button" role="explain"
									class="btn btn-default btn-xs" onclick="explainModal(${cnt})">����</button>

								<!-- �������ϰ�� ������ư -->
								<%
											if (id.equals("master")) {
										%>
								<input type="image" class="update" onclick="updateModal(${cnt})"
									src="/GuiltyPleasure/CORDING/shop/img/edit.png" />
								<%
											}
										%>
							</p>

						</a>

					</div>


					<!-- ���� ��ư ��� -->
					<div class="modal fade" id="buyModal${cnt}" role="dialog"
						data-backdrop="" aria-hidden="true" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h3><%=item.getS_itemname()%></h3>
								</div>
								<div class="modal-body">
									<p><%=item.getS_itemname()%>�췡?
									</p>
									�̰Ű���:
									<%=item.getS_price()%><br> ������Ʈ:
									<%=uDto.getPoint()%>
									<form action="/GuiltyPleasure/shopBuy" method="post"
										id="buy${cnt}">
										<%
													//�г��� ����������ϰ�� �г��� ����� �߰�

														if (item.getS_itemcode().equals("SIC0009")) {
												%>
										<div class="form-group" align="center">
											<label class="col-sm-5 control-label">�г���</label>
											<div class="col-sm-7" align="center">
												<input type="text" name="nickname" class="form-control">
											</div>
										</div>
										<br> <br>
										<%
													}
												%>
										<input type="hidden" name="code"
											value="<%=item.getS_itemcode()%>"> <input
											type="hidden" name="cmd" value="SHOPBUY"> <input
											type="hidden" name="id" value="<%=id%>"> <input
											type="hidden" name="userPoint"
											value="<%=uDto.getPoint() - item.getS_price()%>">
									</form>

								</div>
								<div class="modal-footer">
									<div class="row" align="center">
										<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-6">
											<button type="button" class="btn btn-default" role="buy"
												onclick="document.getElementById('buy${cnt}').submit();">����</button>


										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-6">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- ���� ��ư ��� -->
					<div class="modal fade" id="explainModal${cnt}" data-backdrop=""
						data-dismiss="modal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h3><%=item.getS_itemname()%></h3>

								</div>
								<div class="modal-body">
									<p><%=item.getS_content()%></p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Ȯ��</button>
								</div>
							</div>
						</div>
					</div>

					<!-- ���� ��ư ��� -->
					<div class="modal fade" id="updateModal${cnt}" data-backdrop="">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h3><%=item.getS_itemname()%></h3>
								</div>
								<div class="modal-body">
									<form action="/GuiltyPleasure/shopUpdate" method="post"
										id="edit${cnt}" class="form-horizontal">

										<br>
										<div class="form-group">
											<label class="col-sm-2 control-label">�ڵ�</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="code"
													value="<%=item.getS_itemcode()%>" disabled="disabled">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">�̸�</label>
											<div class="col-sm-10">
												<input type="text" name="name" class="form-control"
													value="<%=item.getS_itemname()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">����</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="price"
													value="<%=item.getS_price()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">����</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="limit"
													value="<%=item.getS_limit_num()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">����</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="deadline"
													value="<%=item.getS_deadline()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">����</label>
											<div class="col-sm-10">
												<textarea class="form-control" name="content"><%=item.getS_content()%></textarea>
											</div>
										</div>

										<input type="hidden" name="code"
											value="<%=item.getS_itemcode()%>"> <input
											type="hidden" name="cmd" value="SHOPUPDATE">
									</form>
								</div>

								<div class="modal-footer">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-xs-4 col-xxs-4">
											<button type="button" class="btn btn-default" role="update"
												onclick="document.getElementById('edit${cnt}').submit();">����</button>

										</div>
										<div class="col-md-4 col-sm-4 col-xs-4 col-xxs-4">
											<form action="/GuiltyPleasure/shopDelete" method="post">
												<input type="hidden" name="code"
													value="<%=item.getS_itemcode()%>"> <input
													type="hidden" name="cmd" value="SHOPDELETE">
												<button type="submit" class="btn btn-default">����</button>

											</form>
										</div>
										<div class="col-md-4 col-sm-4 col-xs-4 col-xxs-4">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<%
								}
							%>





					<!-- �߰� ��ư ��� -->
					<div class="modal fade" id="addModal" data-backdrop="">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h3>�߰��غ���</h3>
								</div>
								<div class="modal-body">
									<form action="/GuiltyPleasure/shopAdd" method="post" id="add">
										<p>
											�̸�:<input type="text" name="name" value=""><br>
											����:<input type="text" name="price" value=""><br>
											����:<input type="text" name="limit" value=""><br>
											����:<input type="text" name="deadline" value=""><br>
											����:
											<textarea cols="25" rows="5" name="content"></textarea>
											<input type="hidden" name="cmd" value="SHOPADD">
										</p>
									</form>
								</div>
								<div class="modal-footer">
									<div class="row" align="center">
										<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-6">
											<button type="submit" class="btn btn-default"
												onclick="document.getElementById('add').submit();">�߰�</button>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-6">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>





					<!-- ���Ž� ���������� ������ ���/�� �����Ҷ� ��� -->
					<div class="modal fade" id="cantBuyModal" data-backdrop=""
						data-dismiss="modal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h3>��ӳ�!</h3>

								</div>
								<div class="modal-body">
									<!--���� ���ϴ� ������ üũ�� jquery���� �׿����� �޽��� ���� -->
									<p id="check"></p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Ȯ��</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<!-- �������������� �ƴ� ��� ���� ��ư -->
			<div class="col-md-1 to-animate fadeInUp animated">
				<%
							if (nowPage < totalPage - 1) {
						%>
				<form action="/GuiltyPleasure/shop" method="post">
					<input type="hidden" name="cmd" value="SHOPLIST"> <input
						type="hidden" name="nowPage" value="<%=nowPage + 1%>"> <input
						type="image" name="Submit" value="Submit"
						src="/GuiltyPleasure/CORDING/shop/img/next.png">
				</form>

				<%
							}
						%>
			</div>
		</div>
		<!-- ���ø� ���� ������ �� -->
		<br> <br> <br> <br> <br>
		<div align="center">
			<font color=gray> <%=nowPage + 1%> / <%=totalPage%> Pages
			</font> <br> <br> <br> <br> <br>

		</div>



	</div>

</body>
</html>
