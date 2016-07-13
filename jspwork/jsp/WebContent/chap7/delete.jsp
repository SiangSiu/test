<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
Connection con=null;
Statement st = null;
String sql = null;


try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e.getMessage());
}

try{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr"
			,"root","apmsetup");
	
	st = con.createStatement();
	sql = "delete from woori where id= '" + id + "'";
	st.executeUpdate(sql);
	
	con.close();
	st.close();
	
}catch (SQLException e){
	out.println(e);
}
%>
<jsp:forward page="selectall.jsp" />

</body>
</html>