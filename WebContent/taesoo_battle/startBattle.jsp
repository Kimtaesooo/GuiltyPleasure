<%@page import="dto.Battle_Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
	<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
	<jsp:useBean id="dto" class="dto.Battle_Room"/>
	<jsp:setProperty name="dto" property="*"/>
<%
	String u_id = (String)session.getAttribute("u_id");
	List roominfo = dao.roomInfo(u_id);
	Battle_Room room = (Battle_Room) roominfo.get(0);	
	int br_people = room.getBr_people();	
	if(br_people < 2){
%>
���� �ο��� �� ������ �ʾҽ��ϴ�.
<%
	}
	if(br_people ==2)
		dao.startBattle(u_id);
%>
