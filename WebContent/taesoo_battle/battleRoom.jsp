<%@page import="dto.Battle_Room"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="dao.playmodule.BattlePlay"%>
<%@ page import="java.util.*"%>

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
	<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
	<jsp:useBean id="dto" class="dto.Battle_Room"/>
<%
	List list = dao.getListRoom();
%>
	<jsp:include page="/top.jsp" />
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
				<%if(list.size() ==0){%>
				<tr>
					<td colspan="8" align="center">�����Ͱ� �����ϴ�.</td>
				</tr>
				<%}
				else{%>				
				<%for(int i=0; i<list.size(); i++){
					Battle_Room room = (Battle_Room)list.get(i);
				%>
				<tr>
					<td><%=i+1%></td>
					<td><%=room.getBr_subject() %></td>
					<td><%=room.getBr_type() %></td>
					<td><%=room.getBr_cnt() %></td>
					<td><%=room.getBr_point() %></td>
					<td><%=room.getU_id() %></td>
					<td><%=room.getBr_people() %></td>
					<td><%=room.getBr_gamestate() %></td>
				</tr>
				<%} 
				}%>
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
							<label for="br_subject" class="col-sm-2 control-label">������</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="br_subject"
									id="br_subject" placeholder="������ �Է����ּ���">
							</div>
						</div>
						<div class="form-group">
							<label for="br_pw" class="col-sm-2 control-label">��й�ȣ</label>
							<div class="col-sm-10">
								<input type="text" class="form-control onlyNumber" name="br_pw"
									id="br_pw" placeholder="��й�ȣ 4�ڸ��� �Է��� �ּ���" maxlength="4">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">����Ʈ</label>
							<div class="col-sm-10">
								<input type="text" class="form-control onlyNumber" name="br_point"
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