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
<center><h3>우리 회원 정보 보기</h3>
<table border=1>
	<tr>
		<th>사용자 ID</th>
		<th>이름</th>
		<th>E-mail</th>
	</tr>
	<% if (!(rs.next())) {%>
	<tr><td colspan=4>등록된 회원이 없습니다.</td></tr>
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
[<A href="main.html">main으로</A>]&nbsp;[<A href="insert.html">회원 등록 페이지로</A>]
</center>

</body>
</html>