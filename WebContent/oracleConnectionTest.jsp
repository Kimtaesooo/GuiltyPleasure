<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dbcp.DBConnectionMgr"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1> ����Ŭ ���� �׽�Ʈ</h1>
<%
	try{
		DBConnectionMgr pool = DBConnectionMgr.getInstance();
		Connection con = pool.getConnection();		
		
		if(con != null){
			System.out.println("���� ����");
			out.println("���� ����");
		}
		pool.freeConnection(con);
	}
	catch(Exception err){
		System.out.println("���� ���� : " + err);
	}
	finally{
		
	}

%>

</body>
</html>