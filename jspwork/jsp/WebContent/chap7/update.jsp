<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr");%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");

String sql=null;
Connection con=null;
Statement st=null;

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

try {
	st = con.createStatement();
	
	sql = "update woori set";
	sql = sql + " name ='" + name +"'," + "email ='" + email + "'";
	sql = sql + "  where id ='" + id + "'";
	st.executeUpdate(sql);
	con.close();
	st.close();
}catch (SQLException e) {
	out.println(e);
}
%>
<jsp:forward page="selectall.jsp" />
</body>
</html>