<%@page import="java.util.List"%>
<%@page import="dto.Board"%>
<%@page import="dao.boardmodule.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�����Խ���</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/style.css">
<style>
.table-hover>tbody>tr:hover {
	background-color: #EEEEEE
}


</style>
<script>
	function check() {
		if (document.search.keyword.value == "") {
			alert("�˻�� �Է��ϼ���.");
			document.search.keyword.focus();
			return;
		}
		document.search.submit();
	}

	function fnRead(b_num) {
		document.frmRead.b_num.value = b_num;
		document.frmRead.submit();
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
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		String reload = request.getParameter("reload");

		List list = dao.getBoardList(keyword, keyfield);

		// ����¡ ��� �߰�
		int totalRecord = list.size(); //��ü ���� ����
		int numPerPage = 10; //�� ������ �� ������ ���� ����
		int totalPage = 0;
		int nowPage = 0; //���� ���� ������(���� �ִ�) ������ ��ȣ
		int beginPerPage = 0; //�� �������� ���۹�ȣ
		int pagePerBlock = 3; //�� ���� ���� ��������
		int totalBlock = 0; // ���� �� ��ȣ
		int nowBlock = 0; // �������� ���� ��ȣ, �Ȱ��� ���� �ߺ��Ǽ� �����ִ� ���� ����

		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);//���� - > �Ǽ� -> ���������� ��ȯ

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

		beginPerPage = nowPage * numPerPage;
%>
<div class="row">
	<div style="padding-top:0px; height:90px; background-color: #4fd2c2">
		<div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
			<h2 class="fh5co-lead animate-single product-animate-1 fadeIn animated">���� �Խ���</h2>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-4">
					<table align=center border=0 width=100%>
						<tr>
							<td align=left>Total : <%=list.size()%> ( <font color=red>
									<%=nowPage + 1%> / <%=totalPage%> pages
							</font>)
							</td>
						</tr>
					</table>
				</div>
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>
		</div>
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<td width="73">��ȣ</td>
						<td width="379">����</td>
						<td width="73">�ۼ���</td>
						<td width="164">�ۼ���</td>
						<td width="58">��ȸ��</td>
					</tr>
				</thead>
				<%
					if (list.size() == 0) {
				%>
				<tbody>
					<tr height="25" align="center">
						<td></td>
						<td>�����Ͱ� �����ϴ�.</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
				<%
					} else {
						for (int i = beginPerPage; i < numPerPage + beginPerPage; i++) {
							if (i == totalRecord)
								break;
							Board board = (Board) list.get(i);
				%>
				<tbody>
					<tr height="25" align="center">
						<td><%=i + 1%></td>
						<td><a href="javascript:fnRead('<%=board.getB_num()%>')"><%=board.getB_title()%></a></td>
						<td><%=board.getU_nickname()%></td>
						<td><%=board.getB_regdate()%></td>
						<td><%=board.getB_count()%></td>
					</tr>
				</tbody>
				<%
					}
					}
					%>
			</table>
			<div class="row">
				<div class="col-md-2">
					<%
							if (nowBlock > 0) {
					%>
					<a href="BoardList.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>">����<%=pagePerBlock%>��</a>
					<%}%>:::
					<%
 					for (int i = 0; i < pagePerBlock; i++) {
 						if ((nowBlock * pagePerBlock) + i == totalPage)
 							break;
 					%>
					<a href="BoardList.jsp?nowPage=<%=(nowBlock*pagePerBlock)+i%>&nowBlock=<%=nowBlock%>"><%=(nowBlock*pagePerBlock)+i+1%></a>&nbsp;
					<%}%>:::
					<%
						if (totalBlock > nowBlock + 1) {
					%>
					<a href="BoardList.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>">����<%=pagePerBlock%>��</a>
					<%}%>
				</div>
				<div class="col-md-7"></div>
				<div class="col-md-3" align="right">
					<%
						if (session.getAttribute("u_id") != null) {
					%>
					<button type="button" class="btn btn-primary" onclick="window.location='BoardWrite.jsp'">�۾���</button>
					<%}%>
					<button type="button" class="btn btn-default" onclick="window.location='BoardList.jsp'">���</button>
				</div>
			</div>
		</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form action="BoardList.jsp" name="search" method="post">
					<div class="form-group">
						<div class="col-xs-4">
							<select class="form-control" name="keyfield">
								<option value="u_nickname"
									<%if (keyfield != null && keyfield.equals("u_nickname")) {%>
									selected="selected" <%}%>>�ۼ���
								<option value="b_title"
									<%if (keyfield != null && keyfield.equals("b_title")) {%>
									selected="selected" <%}%>>����
								<option value="b_content"
									<%if (keyfield != null && keyfield.equals("b_content")) {%>
									selected="selected" <%}%>>����
							</select>
						</div>
						<input type="hidden" name="page" value="0">
						<div class="input-group">
							<input type="search" name="keyword" class="form-control"
								<%if ("null".equals(keyword) || keyword == null) {keyword = "";}%>
								value=<%=keyword%>>
							<div class="input-group-btn">
								<button class="btn btn-info" onClick="check()">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		<div class="col-md-2" align="right"></div>
	<div class="col-md-2"></div>
</div>
	<form name="frmRead" method="post" action="BoardRead.jsp">
		<input type="hidden" name="b_num" /> <input type="hidden" name="keyfield" value="<%=keyfield%>" /> 
		<input type="hidden" name="keyword" value="<%=keyword %>" />
	</form>
</body>
</html>