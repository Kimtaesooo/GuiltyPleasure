<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="dao" class="dao.customermodule.customer"/>
<jsp:useBean id="dto" class="dto.c_board"/>
<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		String id = (String)session.getAttribute("u_id");
		if(title!=null&&type!=null&&content!=null&&id!=null){
			dto.setSc_title(title);
			dto.setSc_type(type);
			dto.setSc_content(content);
			dto.setU_id(id);
			dao.regC_board(dto);
		
		}
%>
<title>�� ���</title>
</head>
<body>
<script>
			alert("��ϵǾ����ϴ�.");
			location.replace("customer_list.jsp");  
</script>

</body>
</html>