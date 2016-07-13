<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
String na = request.getParameter("name");
String em = request.getParameter("email");
String sub = request.getParameter("subject");
String cont = request.getParameter("content");
String ymd = (new java.util.Date()).toLocaleString();
String sql = null;
Connection con = null;
Statement st = null;

int pos = 0;
while ((pos=cont.indexOf("\'", pos)) != -1) {
	String left=cont.substring(0, pos);
	String right = cont.substring(pos, cont.length());
	cont = left + "\'" +right;
	pos += 2;
}



int cnt = 0;

 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e ) {
  out.println(e);
 }

try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gboard?useUnicode=true&characterEncoding=euckr", "root", "apmsetup");
	st=con.createStatement();
	
	sql = "insert into guestboard(name,email,inputdate,subject,content)";
	sql = sql + " values('"+ na +"','"+ em + "','" + ymd+ "','";
	sql = sql + sub + "','" + cont + "')";
	
	cnt = st.executeUpdate(sql);
	
/* 	if(cnt > 0) {
		out.println("데이터가 성공적으로 입력되었습니다.");
	} else {
		out.println("데이터가 입력되지 않았습니다.");
	} */
	st.close();
	con.close();
} catch (SQLException e) {
	out.println(e);
}

%>
<!-- <P>
<a href="dbgb_show.jsp">[방명록 보기]</a>&nbsp;
<a href="dbgb_write.html">[글 올리는 곳으로]</a> -->
<jsp:forward page="dbgb_show.jsp"/>



