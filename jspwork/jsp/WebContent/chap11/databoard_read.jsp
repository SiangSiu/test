<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 읽기</title>
<link href="filegb.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
String sql=null;
Connection con= null;
PreparedStatement st = null;
ResultSet rs = null;
int cnt=0;
int id = Integer.parseInt(request.getParameter("id"));
String url = "http://localhost:8080/jsp/chap11/upload/";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
}catch (ClassNotFoundException e){
	out.println(e.getMessage());
}

try {
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "1234");
}catch(SQLException e){
	out.println(e);
}

try { 
	sql = "select * from databoard where id=? ";
	st= con.prepareStatement(sql);
	st.setInt(1, id);
	rs = st.executeQuery();
	
	if(!(rs.next())) {
		out.println("해당 내용이 없습니다.");
	} else {
		String finame = rs.getString("filename");
		if((finame != null)&&(!(finame.equals("")))) {
			finame = "<a href = down.jsp?file="+finame+">"+finame+"</a>";
			finame = finame +"(" + rs.getInt("filesize") + " Bytes)";
		}
		sql = "update databoard set readcount = readcount + 1 where id= ?" ;
		st =  con.prepareStatement(sql);
		st.setInt(1,id);
		st.executeUpdate();
		sql = "select * from databoard where id=?";
		st = con.prepareStatement(sql);
		st.setInt(1, id);
		
		rs = st.executeQuery();
		rs.next();
		
%>

<table width="600" cellspacing="0" cellpadding="2" align="center" >
	<tr>
		<td height="22">&nbsp;</td>
	</tr>
	<tr align="center">
		<td height="1" bgcolor="#1f4f8f" ></td>
	</tr>
	<tr align="center" bgcolor="#dfedff">
		<td class="button" bgcolor="#dfedff">
		<div align="left"><font size="2"><%=rs.getString("subject") %></font></div></td>
	</tr>
	<tr align="center" bgcolor="#ffffff">
		<td align="center" bgcolor="#f4f4f4">
		<table width="100%" border="0" cellpadding="0" cellspacing="4" height="1">
				<tr bgcolor="#f4f4f4">
					<td width="13%" height="7"></td>
					<td width="38%" height="7">글쓴이: <%=rs.getString("name") %></td>
					<td width="38%" height="7">파일이름 : <%=finame %></td>
					<td width="11%" height="7"></td>
				</tr>
				<tr bgcolor="#f4f4f4">
					<td width="13%"></td>
					<td width="51%">작성일: <%=rs.getString("inputdate") %></td>
					<td width="25%">조회: <%=rs.getInt("readcount") %></td>
					<td width="11%"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr align="center">
		<td bgcolor="#1f4f8f" height="1"></td>
	</tr>
	<tr align="center">
		<td style="padding:10 0 0 0">
		<div align="left"><br>
			<font size="3" color="#333333"><pre><%=rs.getString("content") %></pre></font>
		</div>
		<br>
		</td>
	</tr>
	<tr align="center">
		<td class="button" height="1">
	</tr>
	<tr align="center">
		<td bgcolor="#1f4f8f" height="1"></td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="5" align="center" >
	<tr>
		<td width="56"><a href="databoard_upd.jsp?id=<%=request.getParameter("id") %>&page=<%=request.getParameter("page") %>"><img src="image/edit.jpg" border=0 width="66" height="21"></a></td>
		<td width="56"><a href="databoard_del.jsp?id=<%=request.getParameter("id") %>&page=<%=request.getParameter("page") %>"><img src="image/del.jpg" border=0 width="66" height="21"></a></td>
		<td width="66"><a href="databoard_rwrite.jsp?id=<%=request.getParameter("id") %>&page=<%=request.getParameter("page") %>"><img src="image/reply.jpg" border=0 width="66" height="21"></a></td>
		<td width="406">&nbsp;</td>
		<td width="16"><a href="databoard_list.jsp?id=<%=request.getParameter("id") %>&page=<%=request.getParameter("page") %>"><img src="image/list.jpg" border=0 width="66" height="21"></a></td>
	</tr>
</table>
<%
	}
	rs.close();
	st.close();
	con.close();
}catch (SQLException e){
	out.println(e);
}
%>

</body>
</html>