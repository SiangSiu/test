<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%
String admPwd = "manager";
String password = request.getParameter("password");
if(admPwd.equals(password))
		response.sendRedirect(response.encodeRedirectUrl("select_all.jsp"));
else {
	
%>
<script>alert("������ ���� ����� ���� �մϴ�. ���� ��ư�� ��������.");
</script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�츮 ȸ�� ���� ����</title>
<link rel="StyleSheet" href="style.css" type="text/css">
</head>
<body>
	<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
	<th background="image/sky_bar.gif">������ ���� </th>
	<tr>
		<td align="center">
			<form name=form1 method=post action="admin.jsp">
				<br> ������ ��й�ȣ : 
				<input type=password name=password>
				<p>
				<input type=submit name=change value="Ȯ��" > &nbsp;
				<input type="button" value="��    ��" onClicpk="javascript:history.go(-1);">
			</form>
		</td>
	</tr>
	<tr>
		<td align="center">Copyright by JSP STUDY</td>
	</tr>
	</table>
</body>
</html>
<% } %>