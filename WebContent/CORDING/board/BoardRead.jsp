<%@page import="dto.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
	<!-- Owl Carousel -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/owl.carousel.min.js"></script>
	<!-- toCount -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.countTo.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/main.js"></script>
<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/icomoon.css">
	<!-- Simple Line Icons-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/simple-line-icons.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/magnific-popup.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.theme.default.min.css">
	<!-- Salvattore -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/salvattore.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
<!-- nav바 수정부분 -->
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
<!-- nav바 수정부분 여기까지 -->
</style>
<title>자유게시판 글 조회</title>
</head>
<script>
	function fnList() {
		document.frmList.submit();
	}

	function fnRead2(b_num) {
		document.frmRead2.b_num.value = b_num;
		document.frmRead2.submit();
	}

	function inputBtn(b_num) {
		var id = document.getElementById('sid').value;
		var reply = document.getElementById("reply").value;
		var form = document.replyform;
		if(id.length<1){
			alert("로그인한 유저만 댓글을 작성할수있습니다.");
			return ;
		}
		if (reply.length>0) {
			form.submit();
		} else {
			alert("내용을 입력해주세요.");
			return ;
		}
	}

	function delBtn(r_reply) {
		var delForm = document.delReplyForm;
		delForm.r_reply.value = r_reply;
		delForm.submit();
	}
</script>
<body>
<jsp:include page="../../test_nav.jsp" />
<br><br><br><br>
	<%
	request.setCharacterEncoding("euc-kr");
%>
	<%
	response.setCharacterEncoding("euc-kr");
%>
	<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
	<jsp:useBean id="dto" class="dto.Board" />
	<jsp:useBean id="dto2" class="dto.Reply" />
	<%
		String b_num = request.getParameter("b_num");
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");

		dto = dao.getBoard(b_num, true);

		pageContext.setAttribute("dto", dto);
		
		String sid = (String) session.getAttribute("u_id")==null?"":session.getAttribute("u_id").toString();
		String u_id = dto.getU_id();

		ArrayList<Reply> rep_list = dao.getReplyList(b_num);
		pageContext.setAttribute("list", rep_list);
%>
<input type="hidden" value="<%=sid %>" id="sid"/>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" align=center>

			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
					<td width="5"><img src="img/table_left.gif" width="5"
						height="30" /></td>
					<td>자유게시판</td>
					<td width="5"><img src="img/table_right.gif" width="5"
						height="30" /></td>
				</tr>
			</table>
			<div class="row">
				<table width="413">
					<br>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성자</td>
						<td width="319"><jsp:getProperty property="u_nickname"
								name="dto" /></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">조회수</td>
						<td width="319"><jsp:getProperty property="b_count"
								name="dto" /></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성일</td>
						<td width="319"><jsp:getProperty property="b_regdate"
								name="dto" /></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">제 목</td>
						<td width="319"><jsp:getProperty property="b_title"
								name="dto" /></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td width="399" colspan="2" height="200"><jsp:getProperty
								property="b_content" name="dto" /></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
					</tr>
				</table>
			</div>
			<div class="row">
				<br>
				<button type="button" class="btn btn-default" onclick="fnList()">목록</button>
				<%
											if (sid.equals(u_id)) {
 										%>
				<button type="button" class="btn btn-primary"
					OnClick="window.location='BoardUpdate.jsp?b_num=<%=b_num%>'">수정</button>
				<button type="button" class="btn btn-primary"
					OnClick="window.location='BoardDelete_proc.jsp?b_num=<%=b_num%>'">삭제</button>
				<%
											}
										%>
				<br>
			</div>
			<br>
			<div class="row">
				<form name="delReplyForm" method="post"
					action="ReplyDelete_proc.jsp">
					<input type="hidden" name="r_reply"> <input type="hidden"
						name="b_num" value="<%=b_num%>">
					<table>
						<%
										if (rep_list.size() == 0) {
									%>
						<tr height="25" align="center">
							<td></td>
							<td></td>
							<td>댓글을 등록해주세요.</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<%
										} else {
											for (int i = 0; i < rep_list.size(); i++) {
												dto2 = (Reply) rep_list.get(i);
									%>
						<tr height="25" align="center">
							<td><%=dto2.getU_id()%></td>
							<td>&nbsp;&nbsp;</td>
							<td><%=dto2.getR_content()%></td>
							<td>&nbsp;&nbsp;</td>
							<td><%=dto2.getR_regdate()%></td>
							<%
											if (sid.equals(dto2.getU_id())) {
										%>
							<td>&nbsp;</td>
							<td>
								<button type="button" name="delReply" class="btn btn-default"
									onclick="delBtn('<%=dto2.getR_reply()%>')">X</button>
							</td>
							<%
											}
										%>
							<%
											}
											}
										%>
						</tr>
					</table>
				</form>
			</div>
			<br>
			<div class="row">
				<form name="replyform" method="post" action="Reply_proc.jsp">
					<input type="hidden" name="b_num" value="<%=b_num%>"> <input
						type="hidden" name="u_id" value="<%=sid%>">
					<table>
						<tr align="center">
							<td></td>
							<td><textarea id="reply" name="r_content"
									class="form-control" rows="1" cols="50" maxlength="45"></textarea>
							</td>
							<td>&nbsp;</td>
							<td>
								<button type="button" name="input" class="btn btn-primary"
									onclick="inputBtn(b_num)">등록</button>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table align="center">
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<%
 	if(dto.getPrevnum() != null){
 %>
					<td>이전 글</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><a href="javascript:fnRead2('<%=dto.getPrevnum()%>')"><%=dto.getPrevtitle()%></a></td>
					<%
 	}
%>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<%
	if(dto.getNextnum() != null){
%>
				<tr>
					<td>다음 글</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><a href="javascript:fnRead2('<%=dto.getNextnum()%>')"><%=dto.getNexttitle()%></a></td>

					<%
	} 
%>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
	<form name="frmList" method="post" action="BoardList.jsp">
		<input type="hidden" name="keyfield" value="<%=keyfield %>" /> <input
			type="hidden" name="keyword" value="<%=keyword %>" />
	</form>
	<form name="frmRead2" method="post" action="BoardRead.jsp">
		<input type="hidden" name="b_num" />
	</form>
</body>
</html>