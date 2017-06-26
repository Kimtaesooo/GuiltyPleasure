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

<script>
function check(){
	if(document.ans.sca_answer.value == ""){
		alert("������ �Է����ּ���.");
		document.ans.answer.focus();
		return;
	}
	document.ans.submit();
}
function delete1(){
	if(document.del.pwcheck.value == ""){
		alert("��й�ȣ�� �Է����ּ���.");
		document.del.pw.focus();
		return;
	}
	document.del.submit();
}
$(document).ready(function(){
	$(".pw").hide(0);
	$("#submit").hide(0);
	$("#cancel").hide(0);
	$("#delete").click(function(){
		$(".pw").show(1000);
		$("#submit").show(1000);
		$("#cancel").show(1000);
	});
	$("#cancel").click(function(){
		$(".pw").hide(1000);
		$("#submit").hide(1000);
		$("#cancel").hide(1000);
	});

});
</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String sc_num = request.getParameter("sc_num");
	c_board dto = new c_board();
	dto = dao.getRead(sc_num);
	String answer = dao.getReadAs(sc_num);
	String id="";
	if(session.getAttribute("u_id")!=null){
		id = (String)session.getAttribute("u_id");
	}
%>


<title>�� �б�</title>
</head>
<body>
<jsp:include page="/top.jsp"/>
<<<<<<< HEAD
<jsp:include page="/nav.jsp"/>

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
			<div class="jumbotron">
			<H2><span class="glyphicon glyphicon-user"></span>���ǳ���</H2>
			<pre>������ : <%=dto.getSc_title() %></pre>
			<pre>����� : <%=dto.getSc_regdate() %></pre>
			<pre>ó������ : <%=dto.getSc_state() %> </pre>
			<pre><%=dto.getSc_content() %>
			
			
			
			</pre>
			
			<H2><span class="glyphicon glyphicon-arrow-right"></span>�亯</H2>
			<%if(answer==null){ %>
			
				<%if(id.equals("master")){%>
				<form action="customer_ans_proc.jsp" method="post" name="ans">
				<input type="hidden" value="<%=dto.getSc_num()%>" name="sc_num">
				<textarea class="form-control" rows="10" id="content" name="sca_answer"></textarea>
				<br>
		        <a href="javascript:check()" class="btn btn-primary">�亯�ϱ�</a>
				</form>
				<%}else{ %>
				<h2>���� ó������ ���� ���ǳ��� �Դϴ�..</h2>
				<%} %>
				<br>
			<%}else{ %>
			<pre><%=answer %>
			</pre>
			<%} %>
			<%if(id.equals("master")==false){ %>
=======
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
			<div class="jumbotron">
			<H2><span class="glyphicon glyphicon-user"></span>���ǳ���</H2>
			<pre>������ : <%=dto.getSc_title() %></pre>
			<pre>����� : <%=dto.getSc_regdate() %></pre>
			<pre>ó������ : <%=dto.getSc_state() %> </pre>
			<pre><%=dto.getSc_content() %>
			
			
			
			</pre>
			
			<H2><span class="glyphicon glyphicon-arrow-right"></span>�亯</H2>
			<%if(answer==null){ %>
			
				<%if(id.equals("MASTER")){%>
				<form action="customer_ans_proc.jsp" method="post" name="ans">
				<input type="hidden" value="<%=dto.getSc_num()%>" name="sc_num">
				<textarea class="form-control" rows="10" id="content" name="sca_answer"></textarea>
				<br>
		        <a href="javascript:check()" class="btn btn-primary">�亯�ϱ�</a>
				</form>
				<%}else{ %>
				<h2>���� ó������ ���� ���ǳ��� �Դϴ�..</h2>
				<%} %>
				<br>
			<%}else{ %>
			<pre><%=answer %>
			</pre>
			<%} %>
			<%if(id.equals("MASTER")==false){ %>
>>>>>>> branch 'master' of https://github.com/Kimtaesooo/GuiltyPleasure_bak.git
			<form action="customer_delete_proc.jsp" method="post" name="del">
					<input type="hidden" value="<%=dto.getSc_num()%>" name="sc_num">
					<input type="hidden" value="<%=dto.getU_id()%>" name="u_id">
		        	<a class="btn btn-primary" id="delete">�����ϱ�</a>
		        	<input type="password" size="20" name="pwcheck" placeholder="��й�ȣ�� �Է��ϼ���" class="pw">
		        	<a href="javascript:delete1()" class="btn btn-danger" id="submit">Ȯ��</a>
		        	<a class="btn btn-success" id="cancel">���</a>
			</form>
			<BR>
			<%} %>
			<a href="customer_list.jsp" class="btn btn-primary ">�������</a>
			</div>
	</div>
</div>
</body>
</html>