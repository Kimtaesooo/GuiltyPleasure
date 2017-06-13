<%@page import="dto.Shop"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
<link rel="stylesheet" href="../bootstrap332/css/bootstrap.min.css">
<script src="../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../bootstrap332/js/bootstrap.min.js"></script>

<script>
	$(function() {
		$("a[role='explain']").click(function() {
			$("#explainModal").modal();
		});
	
		$("a[role='update']").click(function() {
			$("#updateModal").modal();
		});
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="dao.shopmodule.ShopManager"></jsp:useBean>
<%
	
	List list=dao.getItemList();
	
	//����¡ ��� �߰�
	int totalRecord = list.size();
	int numPerPage = 5;
	int totalPage = 0;
	int nowPage = 0;
	int beginPerPage = 0;
	
	totalPage =(int)Math.ceil((double)totalRecord/numPerPage);
	
	if(request.getParameter("nowPage")!=null)
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	

	
%>
	<br>
	<h2>����</h2>
	<hr>
	<br>
	<br>
	<br>
	
	<div class="row" align="center">
		<div class="col-md-1">
			<a href="" class="control left" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
		</div>
		<div class="col-md-10">
			<table border="1" cellspacing=0 cellpadding=0>
				<tr>
	<%
		
	
			for(int i=beginPerPage; i<numPerPage+beginPerPage;i++){
				if(i == totalRecord)
					break;
				Shop dto = (Shop)list.get(i);
				
				
	%>
	
	
					<td width="300"><img class="img-responsive" width="100"
						height="100" src="img/victory.png" alt="" align="left"> <b><%=dto.getS_itemname()%></b><br>500��<br>��������:-<br> <br>
						<p>
							<a href="#" class="btn btn-primary btn-sm" role="button">����</a> <a
								href="#" class="btn btn-default btn-sm" role="explain">����</a><a
								href="#" class="glyphicon glyphicon-cog"  role="update"></a>
						</p></td>
					
<%
			}
%>
				</tr>
			</table>
		</div>
		<div class="col-md-1">
			<a href="" class="control right" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
		</div>
	</div>
	
	<!-- ���� ��ư ��� --> 
	 <div class="modal fade" id="explainModal" data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3>������</h3>
							</div>
							<div class="modal-body">
								<p>�󸸵�</p>
								<p>����</p>
							</div>
							<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     					   <button type="button" class="btn btn-primary">����</button>
							</div>
						</div>
					</div>
 	</div>
 	
 	<!-- ���� ��ư ��� --> 
 		 <div class="modal fade" id="updateModal" data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3>������</h3>
							</div>
							<div class="modal-body">
								<p>�췡?</p>
								<p>����</p>
							</div>
							<div class="modal-footer">
     					   <button type="button" class="btn btn-primary">����</button>
     					   <button type="button" class="btn btn-primary">����</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
 	</div>
 
</body>
</html>