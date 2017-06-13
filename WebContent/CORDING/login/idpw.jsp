<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>
<jsp:useBean id="dao" class="dao.loginmodule.idpw"/>
<style>body{margin-top: 60px}</style>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String [] u_find = dao.getBoardList();
%>

<title>Id/Pw Search</title>
</head>
<body onresize="parent.resizeTo(500,400)" onload="parent.resizeTo(500,400)">
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
        <div class="row">
        	<h2>���̵� / ��й�ȣ ã��</h2><hr>
            <div class="col-lg-12 panel panel-primary" id="id" >
            <h3>���̵� ã��</h3>
            <br>
            <form action="id_proc.jsp" method="post" class="search-id">
            <div class="form-group">
     		 <label for="inputName" class="col-lg-2 control-label">�̸�</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="name" name="name" placeholder="�̸� �Է�">
    			  </div>
    		</div>
    		<br><br>
             <div class="form-group">
     		 <label for="inputEmail" class="col-lg-2 control-label">�̸���</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="email" name="email" placeholder="�̸��� �Է�">
    			  </div>
    		</div>
    		<br><br>
    			<div class="form-group">
			      <div class="col-lg-12 col-lg-offset-2">
			        <button type="submit" class="btn btn-primary">Ȯ��</button>
			        &nbsp;&nbsp;&nbsp;
			        <button type="reset" class="btn btn-default">���</button>
			        <br><br>
			      </div>
			    </div>	
			</form>
            </div><!-- ���̵� ã�� -->
            
            <div class="col-lg-12 panel panel-primary" id="pw" >
            <h3>��й�ȣ ã��</h3>
            <br>
             <form action="pw_proc.jsp" method="post" class="search-id">
            <div class="form-group">
     		 <label for="inputId" class="col-lg-2 control-label">���̵�</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="inputEmail" name="id" placeholder="���̵� �Է�">
    			  </div>
    		</div>
    		<br><br>
            <div class="form-group">
     		 <label for="inputEmail" class="col-lg-2 control-label">�̸���</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="inputEmail" name="email" placeholder="�̸��� �Է�">
    			  </div>
    		</div>
    		<br><br>
    		 <div class="form-group">
     		 <label for="inputQuiz" class="col-lg-2 control-label">�����</label>
     		 <div class="col-lg-10">
    		 <select class="form-control" id="select" name="select">
    		 <%for(int i=0; i<u_find.length ;i++){ %>
    		 	
	          <option><%=u_find[i]%></option>
	          <%} %>
	         </select>
	        </div>
	      	</div>
	      	<br><br>
	      	<div class="form-group">
     		 <label for="inputAn" class="col-lg-2 control-label">�亯</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="inputAn" placeholder="�亯 �Է�" name="answer">
    			  </div>
    		</div>
    		<br><br>
    			<div class="form-group">
			      <div class="col-lg-12 col-lg-offset-2">
			        <button type="submit" class="btn btn-primary">Ȯ��</button>
			        &nbsp;&nbsp;&nbsp;
			        <button type="reset" class="btn btn-default">���</button>
			        <br><br>
			      </div>
			    </div>	
			    </form>
            </div><!-- �н����� ã�� -->     
              
	</div>
</div>
</body>
</html>