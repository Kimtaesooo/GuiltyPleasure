<%@page import="dto.Shop"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cnt" value="0" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
<link rel="stylesheet"
	href="/GuiltyPleasure/bootstrap332/css/bootstrap.min.css">
<link rel="stylesheet" href="/GuiltyPleasure/design/mintstrap/outline/css/style.css">
<script src="/GuiltyPleasure/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="/GuiltyPleasure/bootstrap332/js/bootstrap.min.js"></script>

<script>
	jQuery(function() {

		/*
		$("a[role='explain']").click(function() {
			$("#explainModal").modal();
		});
		 */
		var explainButton = $("input.explain");
		var updateButton = $("input.update");
		var buyButton = $("input.buy");

		for (i = 1; i <= explainButton.length; i++) {
			explainModal(i);
		}
		for (i = 1; i <= updateButton.length; i++) {
			updateModal(i);
		}
		for (i = 1; i <= buyButton.length; i++) {
			buyModal(i);
		}

	});

	function explainModal(i) {
		$("#explainButton" + i).bind("click", function(e) {
			$("#explainModal" + i).modal();
		});
	}
	function updateModal(i) {
		$("#updataButton" + i).bind("click", function(e) {
			$("#updateModal" + i).modal();
		});
	}
	function buyModal(i) {
		$("#buyButton" + i).bind("click", function(e) {
			$("#buyModal" + i).modal();
		});
	}

	$(function() {
		$("#addButton").click(function() {
			$("#addModal").modal();
		});
	});
</script>
</head>
<body>
	<div id="fh5co-menu" class="navbar">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#fh5co-navbar" aria-expanded="false" aria-controls="navbar"><span>Menu</span> <i></i></a>
					<a href="index.html" class="navbar-brand"><span>Outline</span></a>
				</div>
			</div>
		</div>
	</div>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<jsp:useBean id="dao" class="dao.shopmodule.ShopManager"></jsp:useBean>
	<%
		//����¡��� �߰�
		List list = dao.getItemList();
		int totalRecord = list.size();
		int numPerPage = 4;
		int totalPage = 0;
		int nowPage = 0;
		int beginPerPage = 0;
		int pagePerBlock = 3;
		int totalBlock = 0;
		int nowBlock = 0;

		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

		beginPerPage = nowPage * numPerPage;
	%>
	<c:set var="totalRecord" value="${itemList.size()}" />
	<br>
	<h2>����</h2>
	<hr>
	<br>
	<br>
	<br>

	<!-- ���� ��ư -->
	<div class="row" align="center">
		<div class="col-md-1">

			<%
				if (nowPage > 0) {
			%>
			<form action="/GuiltyPleasure/shop" method="post">
				<input type="hidden" name="cmd" value="SHOPLIST"> <input
					type="hidden" name="nowPage" value="<%=nowPage - 1%>"> <input
					type="image" name="Submit" value="Submit"
					src="/GuiltyPleasure/daon_v1/img/pre.png">
			</form>

			<%
				}
			%>
		</div>
		<div class="col-md-10">
			<table border="1">
				<tr>


					<%
						if (list.size() == 0) {
					%>
				
				<tr>



					<%
						} else {
							for (int i = beginPerPage; i < numPerPage + beginPerPage; i++) {
								if (i == totalRecord) {
					%>

					<!--�����������ͱ��� ��µ� �����߰���ư ���̰��ϱ� -->
					<td width="240" height="150">
						<div align="center">
							<input type="image" class="add" id="addButton"
								src="/GuiltyPleasure/daon_v1/img/add.png" />

						</div>

					</td>
					<%
						break;
								}
								Shop item = (Shop) list.get(i);
					%>
					<!-- ��ǰ ��� -->
					<td width="240" height="150"><img class="img-responsive"
						width="90" height="90"
						src="/GuiltyPleasure/daon_v1/img/<%=item.getS_itemcode()%>.png"
						alt="" align="left"> <b><%=item.getS_itemname()%></b><br>
						<%=item.getS_price()%><br> <%=item.getS_limit_num()%><br>
						<br>
						<p align="right">
							<input type="button" class="buy" id="buyButton${cnt=cnt+1}"
								value="����" /> <input type="button" class="explain"
								id="explainButton${cnt}" value="����" /> <input type="image"
								class="update" id="updataButton${cnt}"
								src="/GuiltyPleasure/daon_v1/img/edit.png" />
						</p>
						</td>

					<!-- ���� ��ư ��� -->
					<div class="modal fade" id="buyModal${cnt}" data-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h3><%=item.getS_itemname()%></h3>
								</div>
								<div class="modal-body">
									<p><%=item.getS_itemname()%>�췡?
									</p>
								</div>
								<div class="modal-footer">
									<form action="/GuiltyPleasure/shop" method="post">
										<input type="submit" value="Ȯ��"> <input type="hidden"
											name="code" value="<%=item.getS_itemcode()%>"> <input
											type="hidden" name="cmd" value="SHOPBUY">
									</form>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

					<!-- ���� ��ư ��� -->
					<div class="modal fade" id="explainModal${cnt}"
						data-backdrop="static">
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
					<div class="modal fade" id="updateModal${cnt}"
						data-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h3><%=item.getS_itemname()%></h3>
								</div>
								<form style="float: left; margin: 0;"
									action="/GuiltyPleasure/shop" method="post">
									<div class="modal-body">
										<p>�����غ���~</p>
										�ڵ�:<input type="text" name="code"
											value="<%=item.getS_itemcode()%>"><br> �̸�:<input
											type="text" name="name" value="<%=item.getS_itemname()%>"><br>
										����:<input type="text" name="price"
											value="<%=item.getS_price()%>"><br> ����:<input
											type="text" name="limit" value="<%=item.getS_limit_num()%>"><br>
										����:<input type="text" name="deadline"
											value="<%=item.getS_deadline()%>"><br> ����:
										<textarea cols="25" rows="5" name="content"><%=item.getS_content()%></textarea>
									</div>
									<div class="modal-footer">

										<input type="submit" value="����"> <input type="hidden"
											name="code" value="<%=item.getS_itemcode()%>"> <input
											type="hidden" name="cmd" value="SHOPUPDATE">
								</form>
								<form style="float: left; margin: 0;"
									action="/GuiltyPleasure/shop" method="post">
									<input type="submit" value="����"> <input type="hidden"
										name="code" value="<%=item.getS_itemcode()%>"> <input
										type="hidden" name="cmd" value="SHOPDELETE">

								</form>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					</div>


					<%
						}
						}
					%>
					<!-- �߰� ��ư ��� -->
					<div class="modal fade" id="addModal" data-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h3>�߰��غ���</h3>
								</div>
								<form action="/GuiltyPleasure/shop" method="post">
									<div class="modal-body">
										<p>
											�̸�:<input type="text" name="name" value=""><br>
											����:<input type="text" name="price" value=""><br>
											����:<input type="text" name="limit" value=""><br>
											����:<input type="text" name="deadline" value=""><br>
											����:
											<textarea cols="25" rows="5" name="content"></textarea>
										</p>
									</div>
									<div class="modal-footer">
										<input type="submit" value="�߰�"> <input type="hidden"
											name="cmd" value="SHOPADD">
									</div>
								</form>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</tr>
			</table>
		</div>



		<!-- ���� ��ư -->
		<div class="col-md-1">
			<%
				if (nowPage < totalPage - 1) {
			%>
			<form action="/GuiltyPleasure/shop" method="post">
				<input type="hidden" name="cmd" value="SHOPLIST"> <input
					type="hidden" name="nowPage" value="<%=nowPage + 1%>"> <input
					type="image" name="Submit" value="Submit"
					src="/GuiltyPleasure/daon_v1/img/next.png">
			</form>

			<%
				}
			%>
		</div>
	</div>
	<div align="center">
		<font color=gray> <%=nowPage + 1%> / <%=totalPage%> Pages
		</font>
	</div>


</body>
</html>