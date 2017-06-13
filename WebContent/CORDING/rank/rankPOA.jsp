<%@page import="dto.u_single"%>
<%@page import="dto.u_battle"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="dao" class="dao.rankmodule.rank"/>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>
<style>body{margin-top: 40px}</style>
<!-- 
	���߿� �����ؾ��� ����
	��ŷ �Ǽ� 200�� �̻��� ����� �ҷ��ͼ� ����ϴµ� �� ��ŷ�� 200���� �ȵɶ� ��� ó��
 -->
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String type = request.getParameter("up_type");
	if(type==null){
		type = "A";
	}
	String id ="";
	int myrank=0;
	if(session.getAttribute("u_id")!=null){
	id = (String)session.getAttribute("u_id");
	myrank=dao.SingleMyRank(id, type)-1;
	}
	List list = dao.getBoardList2(type);
%>
<title>Ranking</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container" >
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
             
            </div>    
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
                <ul class="nav navbar-nav"  >
                <li>
                <img src="https://cdn0.iconfinder.com/data/icons/chinese-new-year-4/64/treasure-chinese-new-year-heritage-diamond-128.png"
                	width="100px" height="50px">
                	
                </li>
                    <li>
                        <a href="#">�α���</a>
                    </li>
                    <li>
                        <a href="#">ȸ������</a>
                    </li>
                    <li>
                    	<a href="idpw.html">���̵�/��й�ȣ ã��</a>     
                    </li>
                </ul>
            </div>
        </div>
</nav>
    
<div class="container">   
        <div class="row col-lg-12">
            <div class="col-lg-12" >
            <div class="col-lg-12" align="center">
                <h1 class="page-header">����� ��ŷ </h1>
                <a href="rankBattle.jsp">��Ʋ �·�</a> &nbsp;&nbsp;&nbsp;<a href="rankPOA.jsp">�����</a><br><br>
           	<br>
           	<form role="form" action="rankPOA.jsp" method="post">
           	<div class="col-lg-12" align="center">
           		<div class="col-lg-3"></div>
	           	<div class="col-md-2">
	           		����
	           	</div>	
	           	<div class="col-md-2">
		           	<select class="form-control" name="up_type" id="up_type">
		  						<option>A</option>
		  						<option>B</option>
		  						<option>C</option>
					</select>
				</div>
				<div class="col-md-2">
					 <button type="submit">ã��</button>
				</div>	
			</div>	 
           	</form>
           	<br><br><br><br>
            </div>
 <%
			u_single One = (u_single)list.get(0);			
			u_single Two = (u_single)list.get(1);			
			u_single Three = (u_single)list.get(2);			
%>		          	
          <div class="col-lg-12" >
           	<div class="alert alert-dismissible alert-danger col-lg-3">
				 
				  <h4>1�� <%=One.getU_nickname()%></h4>
				  <p><%=One.getU_comment()%></p>		  
			</div>
           <div class="col-lg-1" ></div>
            <div class="alert alert-dismissible alert-info col-lg-3">
				  
				  <h4>2�� <%=Two.getU_nickname()%></h4>
				  <p><%=Two.getU_comment()%></p>
			</div>
             <div class="col-lg-1" ></div>
            <div class="alert alert-dismissible alert-success col-lg-3">
				  
				  <h4>3�� <%=Three.getU_nickname()%></h4>
				  <p><%=Three.getU_comment()%></p>
            </div>
            <br><br>
            <br><br><br><br>
           </div>
        	
            	<h2 class="page-header" align="center">�� ��ŷ</h2>
<%

	if(id.length()>0){
		if(myrank==-1){%>
		<div align="center">
		<h3>200���� ä���� ���߽��ϴ� :(</h3>
		</div>	
		<%}
		else{
		u_single my = (u_single)list.get(myrank);
%>
            	
            	<table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th>����</th>
				      <th>�г���</th>
				      <th>�����</th>
				      <th>�����</th>
				      <th>�����</th>
				      <th>��������</th>
				    </tr>
				  </thead>
				  <tbody>
				  <tr class="active">
				      <td><%=myrank+1%></td>
				      <td><%=my.getU_nickname() %></td>
				      <td><%=my.getA_cnt() %></td>
				      <td><%=my.getWa_cnt()%></td>
				      <td><%=my.getA_cnt()*100/(my.getA_cnt()+my.getWa_cnt())%>%</td>
				      <td><%=my.getUp_type()%></td>
				    </tr>
				  </tbody>
				</table>
<%
	}
}else{
%>		
<div align="center">

<a href="../login/login.html">�α���</a>�� �ʿ��� ���� �Դϴ�.
</div>
<%		
}
%>
				<br><br>
                <h2 class="page-header" align="center">��ü ��ŷ</h2>
                <table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th>����</th>
				      <th>�г���</th>
				      <th>�����</th>
				      <th>�����</th>
				      <th>�����</th>
				      <th>��������</th>
				    </tr>
				  </thead>
				  <tbody>
 <%
	for(int i=0; i<list.size();i++){
			u_single dto = (u_single)list.get(i);	
%>			
		<tr <%if(i%2==0){%>class="info"<%} %>>
			<td><%=i+1%></td>
			<td><%=dto.getU_nickname()%></td>
			<td><%=dto.getA_cnt() %></td>
			<td><%=dto.getWa_cnt() %></td>
			<td><%=dto.getA_cnt()*100/(dto.getA_cnt()+dto.getWa_cnt())%>%</td>
			<td><%=dto.getUp_type() %></td>
		</tr>
<% 		}%>
				  </tbody>
				</table> 
            </div>
        </div>
         <footer>
            <div class="row">
                <div class="col-md-12">
                    <p>Copyright &copy; Guilty Pleasure</p>
                </div>
            </div>

        </footer>
</div>
<!-- container -->   
     
</body>
</html>