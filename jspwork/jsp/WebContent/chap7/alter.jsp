<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 

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
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","apmsetup");
} catch (SQLException e) {
   out.println(e);
}

try {
	st = conn.createStatement();
	st.executeUpdate("alter table woori add email char(30) ");
	st.executeUpdate("alter table woori add password integer ");
	st.executeUpdate("alter table woori modify  name  char(20)  not null ");
	
}catch(SQLException e){
	out.println(e);
}

try {
	rs=st.executeQuery("select * from woori");
	ResultSetMetaData rsmd = rs.getMetaData();
	out.println("���̺��� �����Ǿ����ϴ�. <BR>");
	out.println(rsmd.getColumnCount()+"���� Į��(�ʵ�)�� ������ ������<BR>");
	for(int i=1; i<=rsmd.getColumnCount(); i++){
		out.println(i+"��° �÷��� " + rsmd.getColumnName(i));
		out.println("�̰� ������ " + rsmd.getColumnTypeName(i));
		out.println("�̸� ũ��� " + rsmd.getPrecision(i)+"<BR>");
	}
	rs.close();
	st.close();
	conn.close();
}catch(SQLException e) {
	out.println(e);
}

%>
<A href=main.html>main����</A>