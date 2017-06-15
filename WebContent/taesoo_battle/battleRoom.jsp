<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$("#btnPopup").click(function() {
			$("#theModal").modal();
		});
	});
</script>
<title>��Ʋ ����</title>
</head>
<body>
	<jsp:include page="/top.jsp" />
	<jsp:include page="/nav.jsp" />
	<br>
	<h2>
		<center>��Ʋ ����</center>
	</h2>
	<br>
	<br>
	<br>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>��ȣ</th>
					<th>����</th>
					<th>���� ����</th>
					<th>���� ����</th>
					<th>����Ʈ</th>
					<th>������</th>
					<th>�ο���</th>
					<th>���ӻ���</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>01</td>
					<td>�������û��</td>
					<td>����</td>
					<td>10</td>
					<td>1000</td>
					<td>TEST05</td>
					<td>1/2</td>
					<td>���</td>
				</tr>
			</tbody>
		</table>
		<hr />
		<div class="col-md-12 portfolio-item" align="right">
			<a class="btn btn-default pull-right" href="#makeRoom" data-toggle="modal" id="btnPopup">�游���</a>
		</div>

		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
	</div>

	<!-- �游��� ��� -->
	<div class="modal fade" id="makeRoom" data-backdrop="static">
		<form class="form-horizontal" action="battleCreation.jsp">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3>��Ʋ �� �����</h3>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">������</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="br_subject"
									id="BR_SUBJECT" placeholder="������ �Է����ּ���">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">����Ʈ</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="br_point"
									id="BR_POINT" placeholder="����Ʈ�� �Է����ּ���">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">������</label>
							<div class="col-sm-10">
								<select class="form-control" name="br_cnt" id="br_cnt">
									<option>5</option>
									<option>10</option>
									<option>15</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">����
								����</label>
							<div class="col-sm-10">
								<select class="form-control" name="br_type" id="br_type">
									<option value="A">����</option>
									<option value="B">�ͼ���</option>
									<option value="C">���</option>
									<option value="D">�ȳ�</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
						<!-- battleCreation.jsp�� �ѱ��. -->
						<button type="submit" class="btn btn-primary">�����</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- �游��� ��� ����-->
</body>
</html>