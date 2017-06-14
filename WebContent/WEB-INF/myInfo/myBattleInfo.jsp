<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sub.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#btnInfo').click(function(){
		$('#cmd').val('MYINFO');
		$('#myInfoForm').submit();
	});
	
	$('#btnMain').click(function(){
		$('#cmd').val('MAIN');
		$('#myInfoForm').submit();
	});
});
</script>
</head>
<body>
<form method="post" action="/GuiltyPleasure/myinfo" name="myInfoForm" id="myInfoForm">
<input type="hidden" name="cmd" id="cmd"/>
<div class="subCC">
<h2 class="subTitle">ȸ�� ���� ����</h2>
<table>
	<tr>
		<td style="text-align: right">
		<input type="button" value="���� ����" class="btnStyle2 midBlue"  id="btnInfo" />
		<input type="button" value="��������" class="btnStyle2 midBlack"  id="btnMain" />
		</td>
	</tr>
</table>
	
	<hr class="margin20">
	<h3>�� ����</h3>
	<hr class="margin10">
	<c:if test="${empty dto}">
			<hr class="margin10">
			<h2 style="text-align: center;">���� ������  �����ϴ�.</h2>
	</c:if>
	<c:if test="${!empty dto}">
	<table class="infoTable">
		<colgroup>
			<col style="width:25%;">
			<col style="width:25%;">
			<col style="width:25%;">
			<col style="width:25%;">
		</colgroup>
		<tr>
			<th>������</th>
			<th>��</th>
			<th>��</th>
			<th>�·�</th>
		</tr>
		
		<tr>
			<td style="text-align: center;">${dto.ub_total}</td>
			<td style="text-align: center;">${dto.ub_win }</td>
			<td style="text-align: center;">${dto.ub_lose }</td>
			<td style="text-align: center;">${dto.ub_percent }</td>
		</tr>
	</table>
	</c:if>
	<hr class="margin20">
	<h3>������ ����</h3>
	<hr class="margin10">
	<c:if test="${empty poalist}">
			<hr class="margin10">
			<h2 style="text-align: center;">���� ������  �����ϴ�.</h2>
	</c:if>
	<c:if test="${fn:length(poalist) > 0}">
	<table class="infoTable">
		<colgroup>
			<col style="width:40%;">
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:20%;">
		</colgroup>
		<tr>
			<th>����</th>
			<th>�ѹ���</th>
			<th>����</th>
			<th>�����</th>
		</tr>
		<c:forEach var="poa" items="${poalist}" varStatus="num">
			<tr>
				<td style="text-align: center;">${poa.up_type }</td>
				<td style="text-align: center;">${poa.up_a_cnt }</td>
				<td style="text-align: center;">${poa.up_wa_cnt }</td>
				<td style="text-align: center;">${poa.up_total_percent }</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<hr class="margin20">
	<h3>���� ���� ����</h3>
	<hr class="margin10">
	<c:if test="${empty regqlist}">
		<hr class="margin10">
		<h2 style="text-align: center;">���� ���� ��� �����ϴ�.</h2>
	</c:if>
	<c:if test="${fn:length(regqlist) > 0}">
	<table class="infoTable">
		<colgroup>
			<col style="width:25%;">
			<col style="width:35%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:10%;">
		</colgroup>
		<tr>
			<th>����</th> 
			<th>����</th>
			<th>����</th>
			<th>����</th>
			<th>ó������</th>
		</tr>
		<c:forEach var="quiz" items="${regqlist}">
		<tr>
			<td style="text-align: center;">${quiz.q_type }</td>
			<td style="text-align: center;">${quiz.uq_question }</td>
			<td style="text-align: center;">${quiz.uq_answer }</td>
			<td style="text-align: center;" title="${quiz.uq_wa_a } &#013;${quiz.uq_wa_b } &#013;${quiz.uq_wa_c }">��������</td>
			<td style="text-align: center;">${quiz.uq_adopt }</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>	
	</div>
</form>
</body>
</html>