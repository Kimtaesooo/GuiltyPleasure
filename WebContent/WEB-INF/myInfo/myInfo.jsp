<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sub.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnBattleInfo").click(function(){
			$("#cmd").val("MYBATTLEINFO");
			$("#myInfoForm").submit();
		});
		
		function movemain(){
			$("#cmd").val("MAIN");
			$("#myInfoForm").submit();
		}
		
		$("#btnDelete").click(function(){
			if(confirm('Ż�� ���� ���� 3�������� ���������� �����Ǹ� �α����� �����մϴ�.\n�� �Ⱓ ���� ���� ��û�� �����ϸ� 3�������� ���������� �����˴ϴ�.\nŻ���û �Ͻðڽ���?')){
				if($("#delete").val() != 'N'){
					alert("�̹� Ż�� ��û�Ͻ� ����� �Դϴ�.");
					return ;
				}
				userDeleteAjax();
			}	
		});
		
		function userDeleteAjax(){
			$.ajax({
				type:"POST",
				url :'/GuiltyPleasure/myinfo?cmd=DELETE',
				success:function(args){   
			    	alert("Ż��ó�� ����");
			    	movemain();
			    },     
			    error:function(e){
			    	for(var key in e){
			    		alert(key+" = "+e[key]);
			    	}
			    	alert("Ż��ó�� ����");
			    }  
			});
		}
		
		$("#btnMain").click(movemain);
	});
</script>
</head>
<body>
<form method="post" action="/GuiltyPleasure/myinfo" name="myInfoForm" id="myInfoForm">
<input type="hidden" name="cmd" id="cmd"/>
<input type="hidden" name="delete" id="delete" value="${dto.delete }"/>
<div class="subCC">
<h2 class="subTitle">ȸ�� ���� ����</h2>
<table>
	<tr>
		<td style="text-align: right">
			<input type="button" value="Ż���û" class="btnStyle2 midBlue"  id="btnDelete" />
			<input type="button" value="���� ��ŷ" class="btnStyle2 midBlue" id="btnBattleInfo" />
			<input type="button" value="��������" class="btnStyle2 midBlue" id="btnMain" />
		</td>
	</tr>
</table>
	<hr class="margin20">
	<table class="infoTable">
		<colgroup>
			<col style="width:30%;">
			<col style="width:40%;">
		</colgroup>	
			<tr>
				<th>���̵�</th>
				<td>${dto.id }</td>
			</tr>
			<tr>
				<th>����</th>
				<td>${dto.nickname }</td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td>${dto.email }</td>
			</tr>
			<tr>
				<th>��ȭ</th>
				<td>${dto.phone }</td>
			</tr>
			<tr>
				<th>�ּ�</th>				
				<td>${dto.addr }</td>
			</tr>
			<tr>
				<th>�������</th>
				<td>${dto.date}</td>
			</tr>
			<tr>
				<th>����</th>
				<td>${dto.gender }</td>
			</tr>
			<tr>
				<th>�Ұ�</th>
				<td>${dto.introduce }</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>