<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String password = request.getParameter("password").trim();
String sql = "select * from woori where id=?";
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e.getMessage());
}

try{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&true&characterEncoding=euckr"
			,"root","apmsetup");
}catch (SQLException e){
	out.println(e);
}

try {
	pst = con.prepareStatement(sql);
	pst.setString(1,id);
	
	rs = pst.executeQuery();
	
	if(!(rs.next())) {%>
	�ش�Ǵ� ȸ���� �����ϴ�.
	<% } else { 
		if(password.equals(rs.getString("password"))) { %>
		����� ID�� <%=id %> �� ȸ���� ������ ������ �����ϴ�.
		������ �����Ϸ��� ������ �Է��� ���� <�����ϱ�>��ư�� ��������.
		<form name="form1" method="post" action="update.jsp">
			<INPUT type="hidden" name="id" value="<%=id %>">
			<br> �̸� : 
			<INPUT type="text" name="name" value="<%=rs.getString("name")%>">
			<br> E-mail : 
			<INPUT type="text" name="email" value="<%=rs.getString("email")%>">
			<INPUT type="submit" name="change" value="�����ϱ�">
			<A href="delete.jsp?id=<%=id %>"> �����ϱ�</A>
		
		</form>
		
		<%} else { %>
		 ��й�ȣ�� Ʋ���ϴ�.
		<% }
	}
	rs.close();
	con.close();
	pst.close();
}catch(SQLException e) {
	out.println(e);
}
%>
<A href="main.html"> ��������</A>&nbsp;
<A href="select.html">��ȸ��������</A>
</body>
</html>