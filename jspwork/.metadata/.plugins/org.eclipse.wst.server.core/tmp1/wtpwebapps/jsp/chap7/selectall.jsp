<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.sql.*" %>
    <%request.setCharacterEncoding("euc-kr"); %>
<%
Connection con=null;
Statement st = null;
ResultSet rs = null;
String a=null;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e.getMessage());
}

try{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr"
			,"root","apmsetup");
}catch (SQLException e){
	out.println(e);
}

try{
	st = con.createStatement();
	rs = st.executeQuery("select * from woori order by id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center><h3>�츮 ȸ�� ���� ����</h3>
<table border=1>
	<tr>
		<th>����� ID</th>
		<th>�̸�</th>
		<th>E-mail</th>
	</tr>
	<% if (!(rs.next())) {%>
	<tr><td colspan=4>��ϵ� ȸ���� �����ϴ�.</td></tr>
	<%} else {
		do{
			out.println("<tr>");
			out.println("<td>"+ rs.getString("id")+"</td>");
			out.println("<td>"+ rs.getString("name")+"</td>");
			out.println("<td>"+ rs.getString("email")+"</td>");
			out.println("</tr>");
		}while(rs.next());
	}
	rs.close();
	st.close();
	con.close();
}catch(SQLException e){
	System.out.println(e);
}
%>

</table>
[<A href="main.html">main����</A>]&nbsp;[<A href="insert.html">ȸ�� ��� ��������</A>]
</center>

</body>
</html>