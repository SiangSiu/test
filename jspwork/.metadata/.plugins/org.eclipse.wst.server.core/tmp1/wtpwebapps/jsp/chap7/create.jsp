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
Connection conn = null;
Statement st = null;
ResultSet rs = null;
String a=null;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e);
}

try{
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr"
			,"root","apmsetup");
}catch (SQLException e){
	out.println(e);
}

try {
	st = conn.createStatement();
	st.executeUpdate("create table woori(id char(10) primary key, name char(10))");
} catch(SQLException e){
	out.println(e);
}

try {
	rs=st.executeQuery("select * from woori");
	ResultSetMetaData rsmd = rs.getMetaData();
	out.println("���ο� ���̺��� �����Ǿ����ϴ�. <BR>");
	out.println(rsmd.getColumnCount()+"���� Į��(�ʵ�)�� ������ ������<BR>");
	out.println("ù��° Į���� " + rsmd.getColumnName(1)+"<BR>");
	out.println("�ι�° Į���� " + rsmd.getColumnName(2)+"<BR>");
	rs.close();
	st.close();
	conn.close();
}catch(SQLException e) {
	out.println(e);
}

%>
<A href=main.html>main����</A>
</body>
</html>