<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
<html>
<head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Guilty Pleasure Login</title>

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

    </head>

    <body>
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>GuiltyPleasure</strong> �α���</h1>
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
                        			<h3>�α���</h3>
                            		<p>���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="/GuiltyPleasure/logcheck?cmd=login" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="form-username" placeholder="���̵�" class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="form-password" placeholder="�н�����" class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn">�α���</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<div>
                        		<br>
	                        	<a href="/GuiltyPleasure/CORDING/login/resistration.html"><font size="4em" color="white">ȸ������&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="/GuiltyPleasure/CORDING/login/idpw.jsp"><font size="4em" color="white">���̵�/��й�ȣ ã��&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="/GuiltyPleasure/CORDING/custom/customer_main.jsp"><font size="4em" color="white">������&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="/GuiltyPleasure/main.jsp"><font size="4em" color="white">����&nbsp;&nbsp;&nbsp;</font></a>
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