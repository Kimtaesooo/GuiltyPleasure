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
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
<<<<<<< HEAD
	if(keyWord==null){
		keyWord="";
=======
	if(session.getAttribute("u_id")!=null){
		id = (String)session.getAttribute("u_id");
>>>>>>> branch 'master' of https://github.com/Kimtaesooo/GuiltyPleasure_bak.git
	}
<<<<<<< HEAD
	if(session.getAttribute("u_id")!=null){
		id = (String)session.getAttribute("u_id");
	}
=======
	List list = dao.getBoardList(id,keyField,keyWord);
>>>>>>> branch 'master' of https://github.com/Kimtaesooo/GuiltyPleasure_bak.git
	
	List list = dao.getBoardList(id,keyField,keyWord);
	//����¡
	int totalRecord = list.size();
	int numPerPage = 10;
	int totalPage = 0;
	int nowPage = 0;
	int beginPerPage = 0;
	int pagePerBlock = 3;
	int totalBlock = 0;
	int nowBlock = 0;
	
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock")!=null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	
	beginPerPage = nowPage * numPerPage;
%>


<title>Main</title>
</head>
<script>
function check(){
	if(document.search.keyWord.value == ""){
		alert("�˻�� �Է��ϼ���.");
		document.search.keyWord.focus();
		return;
	}
	document.search.submit();
}
function fnRead(sc_num){
	document.frmRead.sc_num.value = sc_num;
	document.frmRead.submit();
}
$(document).ready(function(){
	$("#list").css("background","lightblue");
<<<<<<< HEAD
	$("#page").css("background","lightblue");
=======
>>>>>>> branch 'master' of https://github.com/Kimtaesooo/GuiltyPleasure_bak.git

});
</script>
<body>
<jsp:include page="/top.jsp"/>
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
			<div class="col-lg-12 panel panel-success">
				<br>
				<%if(session.getAttribute("u_id")!=null){%>
				<div class="jumbotron">
	  			<h1>�����Ͻ� ���� �Դϴ�.</h1>
	  			<p>������ �׸��� ���� �亯�ص帮�� ���� ���� �Դϴ�.</p>
	  			<h5>Ŭ���� �亯�� ��Ÿ���ϴ�.</h5>
				</div>
				
				<div class="jumbotron">
				<form action="customer_list.jsp" name="search" method="post">
					<table border=0 align=center cellpadding=4 cellspacing=0>
					<tr>
						<td align=center valign=bottom>
							<select name="keyField" size="1">
								<option value="sc_title" 
								<% if(keyField!=null&&keyField.equals("sc_title")){%>
								selected="selected"<%} %>> ����
<<<<<<< HEAD
								<%if(id.equals("master")){ %>
								<option value="u_id"
								<% if(keyField!=null&&keyField.equals("u_id")){%>
								selected="selected"<%} %>>�ۼ���
								<%} %>
								<option value="sc_state" 
								<% if(keyField!=null&&keyField.equals("sc_state")){%>
								selected="selected"<%} %>> ó������
							</select>
				
							<input type="text" size="16" name="keyWord" 
							<% if(keyWord != null){%>value="<%=keyWord %>"<%} %>>
							
							<input type="button" value="ã��" onClick="check()">
							<input type="hidden" name="page" value= "0">
						</td>
					</tr>
					</table>
				</form>
				<table class="table table-striped table-hover " id="list">
=======
								<%if(id.equals("Master01")){ %>
								<option value="u_id"
								<% if(keyField!=null&&keyField.equals("u_id")){%>
								selected="selected"<%} %>>�ۼ���
								<%} %>
								<option value="sc_state" 
								<% if(keyField!=null&&keyField.equals("sc_state")){%>
								selected="selected"<%} %>> ó������
							</select>
				
							<input type="text" size="16" name="keyWord" 
							<% if(keyWord != null){%>value="<%=keyWord %>"<%} %>>
							
							<input type="button" value="ã��" onClick="check()">
							<input type="hidden" name="page" value= "0">
						</td>
					</tr>
					</table>
				</form>
				<table class="table table-striped table-hover " id="list"  align=center>
>>>>>>> branch 'master' of https://github.com/Kimtaesooo/GuiltyPleasure_bak.git
				  <thead>
				    <tr>
				      <th width="170">�����</th>
				      <th width="100">�ۼ���</th>
				      <th>������</th>
				      <th width="100">ó������</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<%
							if(list.size() == 0){
					%>
								<tr>
									<td colspan="5" align="center">�����Ͱ� �����ϴ�.</td>
								</tr>
					<% 
							}
							else{
						   for(int i=beginPerPage; i<numPerPage+beginPerPage; i++){
								if(i == totalRecord)
									break;
								
								c_board dto = (c_board)list.get(i);
					%>
							<tr class="info">
								<td><%=dto.getSc_regdate()%></td>
								<td><%=dto.getU_id()%></td>
								<td><a href="javascript:fnRead('<%=dto.getSc_num()%>')"><%=dto.getSc_title()%></a></td>
								<td><%=dto.getSc_state() %></td>
							</tr>
					<% 		}
						}%>
					<tr id="page">
						
						<td  colspan="5" align="center">
							Go to Page
							<% if(nowBlock > 0){%>
								<a href="customer_list.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">����<%=pagePerBlock%>��</a>
							<% }%> 
							[ 
							<%
								for(int i=0; i<pagePerBlock; i++){
									if((nowBlock*pagePerBlock)+i == totalPage)
										break;
							%>
									<a href="customer_list.jsp?nowPage=<%=(nowBlock*pagePerBlock)+i%>&nowBlock=<%=nowBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>"><%= (nowBlock*pagePerBlock)+i+1%></a>&nbsp;&nbsp;&nbsp;
							<%
								}
							%>
							] 
							<% if(totalBlock > nowBlock+1){%>
								<a href="customer_list.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">����<%=pagePerBlock%>��</a>
							<% }%>
								<a href="customer_list.jsp"> ó������</a>
						</td>
						
					</tr>
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
<<<<<<< HEAD
	<input type="hidden" name="keyField" value="<%=keyField%>"/>
	<input type="hidden" name="keyWord" value="<%=keyWord%>"/>
=======
>>>>>>> branch 'master' of https://github.com/Kimtaesooo/GuiltyPleasure_bak.git
</form>
</body>
</html>