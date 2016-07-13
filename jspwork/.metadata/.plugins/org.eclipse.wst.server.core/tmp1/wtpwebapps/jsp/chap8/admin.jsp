<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%
String admPwd = "manager";
String password = request.getParameter("password");
if(admPwd.equals(password))
		response.sendRedirect(response.encodeRedirectUrl("select_all.jsp"));
else {
	
%>
<script>alert("인증이 허용된 사람만 가능 합니다. 학인 버튼을 누르세요.");
</script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리 회원 정보 관리</title>
<link rel="StyleSheet" href="style.css" type="text/css">
</head>
<body>
	<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
	<th background="image/sky_bar.gif">관리자 승인 </th>
	<tr>
		<td align="center">
			<form name=form1 method=post action="admin.jsp">
				<br> 관리자 비밀번호 : 
				<input type=password name=password>
				<p>
				<input type=submit name=change value="확인" > &nbsp;
				<input type="button" value="취    소" onClicpk="javascript:history.go(-1);">
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