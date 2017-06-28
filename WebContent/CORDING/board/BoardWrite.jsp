<%@ page contentType="text/html; charset=EUC-KR" %>
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
<!-- nav�� �����κ� -->
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
<!-- nav�� �����κ� ������� -->
.table-hover>tbody>tr:hover {
	background-color: #EEEEEE
}
</style>
<title>�����Խ���-�۾���</title>
<script>
function writeCheck(){
 var form = document.writeform;
if( !form.title.value ){
  alert("������ �Է����ּ���");
  form.title.focus();
  return;
 }

if(!form.content.value){
  alert("������ �Է����ּ���");
  form.content.focus();
  return;
 }

form.submit();
}
</script>
</head>
<body>
	<jsp:include page="../../test_nav.jsp" />
<br><br><br><br>
<form name="writeform" method="post" action="Boardwrite_proc.jsp">
<table align=center>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>�����Խ��� �� ���</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
   <br>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center"> �� �� &nbsp;&nbsp;</td>
      <td><input  class="form-control" name="title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center"> �ۼ��� &nbsp;&nbsp;</td>
      <td><input  class="form-control" name="u_id" size="50" maxlength="50" value=<%=session.getAttribute("u_id")%> readonly="readonly">
      </td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center"> �� �� &nbsp;&nbsp;</td>
      <td>
      <textarea name="content" class="form-control" rows="13" cols="50"></textarea>
      </td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><br>
       <button type="button" class="btn btn-primary" onclick="javascript:writeCheck();">���</button>
       <button type="button" class="btn btn-default" onclick="javascript:history.back(-1)">���</button>
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
</body>
</html>