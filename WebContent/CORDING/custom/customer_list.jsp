<%@page import="dto.c_board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>
<jsp:useBean id="dao" class="dao.customermodule.customer"/>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String id ="";

	if(session.getAttribute("u_id")!=null){
	id = (String)session.getAttribute("u_id");
	}
	List list = dao.getBoardList(id);
	
%>


<title>Main</title>
</head>
<script>
function fnRead(sc_num){
	document.frmRead.sc_num.value = sc_num;
	document.frmRead.submit();
}
$(document).ready(function(){
	$("table").css("background","lightblue");

});
</script>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.html"/>

<div class="container">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="customer_main.jsp" class="btn btn-success ">����</a>
        	<a href="#" class="btn btn-info active">���� ����</a>
			</div>
			<div class="col-lg-8" align="right">
			<a href="customer_ques.jsp" class="btn btn-warning" >�����ϱ�</a>	
			</div>
			<br><br>
			<div class="col-lg-12 panel panel-success">
				<br>
				<%if(session.getAttribute("u_id")!=null){%>
				<div class="jumbotron">
	  			<h1>�����Ͻ� ���� �Դϴ�.</h1>
	  			<p>������ �׸��� ���� �亯�ص帮�� ���� ���� �Դϴ�.</p>
	  			<h5>Ŭ���� �亯�� ��Ÿ���ϴ�.</h5>
				</div>
				
				<div class="jumbotron">
				<table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th width="200">�����</th>
				      <th>������</th>
				      <th width="100">ó������</th>
				    </tr>
				  </thead>
				  <tbody>
				   <%
						for(int i=0; i<list.size();i++){
								c_board dto = (c_board)list.get(i);	
					%>			
							<tr class="info">
								<td><%=dto.getSc_regdate()%></td>
								<td><a href="javascript:fnRead('<%=dto.getSc_num()%>')"><%=dto.getSc_title()%></a></td>
								<td><%=dto.getSc_state() %></td>
							</tr>
					<% 		}%>
				  </tbody>
				</table>
				</div>
				<%} else{%>
				
				<br>
					<div class="jumbotron">
		  			<h2>�α��� �� �̿밡���� ���� �Դϴ�.</h2>
		  			<p><a>ȸ������</a> Ȥ�� <a>�α���</a>�� ���ּ���</p>
					</div>
			
				<%} %>
        </div>
	</div>
</div>
<form name="frmRead" method="post" action="customer_read.jsp">
	<input type="hidden" name="sc_num" />
</form>
</body>
</html>