<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="kor">
<!-- ���̵� ã�� ���μ��� -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Search ID/PW</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="/GuiltyPleasure/CORDING/login/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/GuiltyPleasure/CORDING/login/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/GuiltyPleasure/CORDING/login/assets/css/form-elements.css">
        <link rel="stylesheet" href="/GuiltyPleasure/CORDING/login/assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="/GuiltyPleasure/CORDING/login/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/GuiltyPleasure/CORDING/login/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/GuiltyPleasure/CORDING/login/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/GuiltyPleasure/CORDING/login/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/GuiltyPleasure/CORDING/login/assets/ico/apple-touch-icon-57-precomposed.png">
		<jsp:useBean id="search" class="dao.loginmodule.idpw"/>
		<%
		// ���ڵ�
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		String rightId = (String)request.getAttribute("rightId"); // DB�� ��ȸ�� ID ��
		String id = (String)request.getAttribute("id"); // ������ �Է��� ID ��
		String name = (String)request.getAttribute("name"); // ������ �Է��� �̸�
		%>
    </head>
	
    <body>
    	
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>GuiltyPleasure</strong> ���̵� ã��</h1>
                            <div class="description">
                            	<p>                           
	                            	���� Guilty Pleasure �������� ���Ű��� ȯ���մϴ�.<br> �ƹ��� ������ �ȵǴ� ��� Ǯ�� �ð��� �����غ�����.
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>���̵� ã��</h3>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="/GuiltyPleasure/CORDING/login/idpw.jsp" method="post" class="login-form">
<%
								if(rightId.equals("success")){
%>									
									<h4>ȸ������ ���̵�� </h4><h3><%=id%> �Դϴ�.</h3>
<%
								}else{
%>
									<h3><%=id%></h3>
<%
								}
%>
									<br>
			                        <button type="submit" class="btn">���ư���</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<div>
                        		<br>
	                        	<a href="resistration.html"><font size="4em" color="white">ȸ������&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="idpw.jsp"><font size="4em" color="white">���̵�/��й�ȣ ã��&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="/GuiltyPleasure/CORDING/custom/customer_main.jsp"><font size="4em" color="white">������</font></a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="/GuiltyPleasure/CORDING/login/assets/js/jquery-1.11.1.min.js"></script>
        <script src="/GuiltyPleasure/CORDING/login/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/GuiltyPleasure/CORDING/login/assets/js/jquery.backstretch.min.js"></script>
        <script src="/GuiltyPleasure/CORDING/login/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>