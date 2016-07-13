<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="filegb.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<%

Vector name=new Vector();
Vector email=new Vector();
Vector inputdate=new Vector();
Vector subject=new Vector();
Vector content=new Vector();


int where=1;
int totalgroup = 0;
int maxpages=2;
int startpage=1;
int endpage=startpage+maxpages-1;
int wheregroup=1;
if(request.getParameter("go") != null){
		where = Integer.parseInt(request.getParameter("go"));
		wheregroup = (where-1)/maxpages +1;
		startpage = (wheregroup-1)*maxpages+1;
		endpage = startpage+maxpages-1;
} else if(request.getParameter("gogroup") != null) {
	wheregroup = Integer.parseInt(request.getParameter("gogroup"));
	startpage=(wheregroup-1) * maxpages+1;
	where =startpage;
	endpage=startpage+maxpages-1;
}
int nextgroup = wheregroup+1;
int priorgroup = wheregroup-1;
int nextpage=where+1;
int priorpage = where-1;
int startrow=0;
int endrow=0;
int maxrows=2;
int totalrows=0;
int totalpages=0;




String em=null;
Connection con=null;
Statement st = null;
ResultSet rs = null;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch (ClassNotFoundException e){
	out.println(e.getMessage());
}

try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gboard?useUnicode=true&characterEncoding=euckr", "root", "apmsetup");
	st=con.createStatement();
	rs = st.executeQuery("select * from guestboard order by inputdate desc");
	
	if(!(rs.next())) {
		out.println("블로그에 올린 글이 없습니다.");
	} else {
		do{
			name.addElement(rs.getString("name"));
			email.addElement(rs.getString("email"));
			inputdate.addElement(rs.getString("inputdate"));
			subject.addElement(rs.getString("subject"));
			content.addElement(rs.getString("content"));
		}while(rs.next());
		totalrows = name.size();
		totalpages = (totalrows-1)/maxrows+1;
		startrow=(where-1)*maxrows;
		endrow=startrow+maxrows-1;
		if(endrow >= totalrows)
			endrow=totalrows-1;
		totalgroup = (totalpages-1)/maxpages +1;
		if(endpage > totalpages)
			endpage=totalpages;
		
		for(int j=startrow; j<=endrow; j++){
%>
	<table border='0' width='600' cellspacing='0' cellpadding='2'>
		<tr align='right'>
			<td height='22'>&nbsp;</td>
		</tr>
		<tr align='center'>
			<td height='1' bgcolor='#1F4F8F'></td>
		</tr>
		<tr align='center' bgcolor='#DFEDFF'>
			<td class='button' bgcolor='#DFEDFF'>
			<div align='left'><font size='2'><%=subject.elementAt(j) %></font>
			</div></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
			<td align='center' bgcolor='#F4F4F4'>
			<table width='100%' border='0' cellpadding='0' cellspacing='4'>
				<tr bgcolor='#F4F4F4'>
					<td width='13%' height='7'></td>
					<td width='38%' height='7'>글쓴이:<%=name.elementAt(j) %></td>
					<%
					String temp= (String)email.elementAt(j);
					if((temp != null) && (!(temp.equals(""))))
							em = "<a href=mailto:" + temp + ">" + temp + "</a>";
					%>
					<td width='38%' height='7'>E-mail: <%=em %> </td>
					<td width='11%' height='7'></td>
				</tr>
				<tr bgcolor='#F4F4F4'>
					<td width='13%'></td>
					<td colspan=2>작성일: <%=inputdate.elementAt(j) %></td>
					<td width='11%'></td>
				</tr>
			</table>
	</td>
</tr>
<tr align='center'>
	<td bgcolor='#1F4F8F' height='1'></td>
</tr>
<tr align='center'>
	<td style='padding:10 0 0 0'>
		<div align='left'><br>
			<font size='3' color='#333333'><pre><%=content.elementAt(j) %></pre></font>
		</div>
		<br>
	</td>
</tr>
<tr align='center'>
	<td class='button' height='1'></td>
</tr>
<tr align='center'>
	<td bgcolor='#1F4F8F' height='1'></td>
</tr>
</table><p>
		
		
<%
		}
	}
	rs.close();
	st.close();
	con.close();
} catch (SQLException e) {
	out.println(e);
}
if(wheregroup > 1) {
	out.println("[<a href=\"dbgb_show.jsp?go=1\">처음</a>]");
	out.println("[<a href=\"dbgb_show.jsp?gogroup="+priorgroup+"\">이전</a>]");
} else {
	out.println("[처음]");
	out.println("[이전]");
}
for(int jj=startpage; jj<=endpage; jj++){
	if(jj==where)
		out.println("["+jj+"]");
	else
		out.println("[<a href=\"dbgb_show.jsp?go="+jj+"\">"+ jj +"</a>]");
}

if(wheregroup < totalgroup) {
	out.println("[<a href=\"dbgb_show.jsp?gogroup="+nextgroup+"\">다음</a>]");
	out.println("[<a href=\"dbgb_show.jsp?gogroup="+totalgroup+"\">마지막</a>]");
} else {
	out.println("[다음]");
	out.println("[마지막]");
}

out.println(where+"/"+totalpages);

%>
<p>
<a href="dbgb_write.html">
<img src="image/write.gif" width="54" height="19" border=0></a>

</center>
</body>
</html>