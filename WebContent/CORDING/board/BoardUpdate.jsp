<%@page import="dto.Board"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����Խ��� �� ����</title>
<script>
	var form;
	function check() {
		form = document.updateform;
		if (!form.b_title.value) {
			alert("������ �����ּ���");
			form.b_title.focus();
			return;
		}

		if (!form.b_content.value) {
			alert("������ �����ּ���");
			form.b_content.focus();
			return;
		}
		form.submit();
	}
</script>
</head>
<body>
<jsp:include page="/top.jsp" />
<jsp:include page="/nav.jsp" />
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />
<%
	String b_num = request.getParameter("b_num");
	dto = dao.getBoard(b_num, false);

	String sid = (String) session.getAttribute("u_id");
%>
	<div class="row">
	<div style="padding-top:0px; height:90px; background-color: #4fd2c2">
		<div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
			<h2 class="fh5co-lead animate-single product-animate-1 fadeIn animated">����</h2>
		</div>
	</div>
</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" align=center>
			<form name="updateform" method="post" action="/GuiltyPleasure/Board?cmd=BOARDUPDATEPROC">
				<input type="hidden" name="b_num" value="<%=b_num%>" />
				<table class="table table-condensed">
					<br>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">�� �� &nbsp;&nbsp;</td>
						<td><input class="form-control" name="b_title" size="50"
							maxlength="100" value="<%=dto.getB_title()%>"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">�ۼ��� &nbsp;&nbsp;</td>
						<td><input class="form-control" name="id" size="50"
							maxlength="50" value="<%=sid%>" readonly="readonly"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">�� �� &nbsp;&nbsp;</td>
						<td><textarea name="b_content" class="form-control" rows="13"
								cols="50"><%=dto.getB_content()%></textarea></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4"></td>
					</tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2"><br>
							<button type="button" class="btn btn-primary" onclick="check()">����</button>
							<button type="button" class="btn btn-default"
								onclick="javascript:history.back(-1)">���</button>
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>