<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;
String a = null;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e);
}

try {
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","apmsetup");
	  
} catch(SQLException e){
	 	out.println(e);
} 

try {
	st = con.createStatement();
	rs = st.executeQuery("select * from member order by userid");

%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리 회원 정보관리</title>
<link rel="StyleSheet" href="style.css" type="text/css">
</head>
<body>
<center>
	<table width="500" border="1" bordercoloerlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class=style2>
		<th background="image/sky_bar.gif">사용자 ID</th>
		<th background="image/sky_bar.gif">이  름</th>
		<th background="image/sky_bar.gif">주  소</th>
		<% if(!(rs.next())) {%>
		<tr><td colspan=4>등록된 회원이 없습니다.</td></tr>
		<% }else {
				do {
					out.println("<tr>");
					out.println("<td align='center'>"+ rs.getString("userid")+ "</td>");
					out.println("<td align='center'>"+ rs.getString("username")+ " </td>");
					out.println("<td>"+ rs.getString("address1"));
					out.println(rs.getString("address2")+ "</td>");
					out.println("</td>");
				}while(rs.next());
			}
			rs.close();
			st.close();
			con.close();
			} catch (SQLException e) {
				System.out.println(e);
		}
				
	%>
	
	</table>
</center>

</body>
</html>