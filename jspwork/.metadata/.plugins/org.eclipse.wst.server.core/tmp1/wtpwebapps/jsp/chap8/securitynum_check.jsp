<%@ page info="securitynum check" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.sql.*, java.net.*" %>
<% 
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String securitynum = request.getParameter("securitynum");
String query = new String();

int check_count = 0;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e);
}
try{
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr"
			,"root","apmsetup");
	stmt = conn.createStatement();
	
	query = "Select count(*) as count from member where securitynum='" + securitynum +"'";
	rs = stmt.executeQuery(query);
	rs.next();
	check_count = rs.getInt("count");
	rs.close();
}catch (SQLException e){
} finally {
	conn.close();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주민등록번호 중복검사</title>
<link rel="StyleSheet" href="style.css" type="text/css">
</head>
<body text="#000000" bgcolor="#FFFFFF">
<br/>
<br/>
<table width="300" border="1" height="40" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style1">
	<tr>
		<td>
		<%
			if(check_count > 0) {
		%>
		▶ [<%=securitynum%>]은 등록되어 있는 주민등록번호입니다.
		<%
			}else{
		%>
		▶ [<%=securitynum%>]은 사용 가능합니다.
		<%
			}
		%>
		</td>
	</tr>
</table>
<br/>
<table width="300" border="0" cellspacing="3" cellpadding="0" align="center">
	<tr>
		<td align="center">
			<input type="button" value="확인" onClick="self.close()" class="oneborder">
		</td>
	</tr>
</table>

</body>
</html>