<%@page import="java.util.ArrayList"%>
<%@page import="dto.QuizResult"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
ArrayList list = (ArrayList)request.getAttribute("list");
QuizResult result;
int csum =0 , wsum = 0;
for(int i =0; i<list.size(); i++){
	result = (QuizResult)list.get(i);
	csum+=result.getCa_sum();
	wsum+=result.getWa_sum();
}
	%>
<body>
	<h1>���� ����Դϴ�.</h1>
	���̵� <%=session.getAttribute("u_id") %>
	����� : <%=csum%>
	����� : <%=wsum%>
</body>
</html>