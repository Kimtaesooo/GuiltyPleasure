<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
	<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard"/>
	<jsp:useBean id="dto2" class="dto.Reply"/>
	<jsp:setProperty name="dto2" property="*"/>	

<%
	dao.replyBoard(dto2);
	response.sendRedirect("BoardRead.jsp?b_num="+dto2.getB_num());
%>