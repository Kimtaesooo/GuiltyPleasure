<%@ page import="java.util.List"%>
<%@ page import="dao.playmodule.BattlePlay"%>
<%@ page import="dto.Battle_Room"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

	String u_id = (String)session.getAttribute("u_id");
%>
	<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
	<jsp:useBean id="dto" class="dto.Battle_Room"/>
	<jsp:setProperty name="dto" property="*"/>

<%
	dao.regRoom(dto, u_id);
	response.sendRedirect("serverPlayRoom.jsp");
%>

<%
	// RoomManager : Room�� ����/������ �����ϴ� Ŭ�����̴�. Room�� ������ ���� �� ����
	// GameRoom : ���� ���� ����(���� ���� ����)�� ó���ϱ� ���� Ŭ�����̴�.  GameUser�� ������ ���� �� ����
	// GameUser : Ŭ���̾�Ʈ�� ������ ����(�г���, ������, �÷��̾� ���� ��)�� ������ Ŭ�����̸�, �߿��� ���� "����" �� ������ �־�� �Ѵ�.
%>