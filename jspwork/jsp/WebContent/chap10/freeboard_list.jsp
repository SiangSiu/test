<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="filegb.css" rel="stylesheet" type="text/css">
<script language="javascript">
function check(){
	with(document.msgsearch){
		if(sval.value.length==0){
			alert("�˻�� �Է��� �ּ���.?!!");
			sval.focus();
			return false;
		}
		document.msgsearch.submit();
	}
}

function rimgchg(p1, p2){
	if(p2==1)
		document.images[p1].src = "image/open.gif";
	else
		document.images[p1].src = "image/arrow.gif";
}

function imgchg(p1,p2) {
	if(p2==1)
		document.images[p1].src = "image/open.gif";
	else
		document.images[p1].src = "image/close.gif";
}
</script>
<title>�Խ���</title>
</head>
<body>
<p>
<p align=center><font color=#0000ff face=���� size=3><strong>���� �Խ���</strong></font></p>
<p>
<center>
	<table border=0 width=600 cellpadding=4 cellspacing=0>
		<tr align="center">
			<td colspan="5" height="1" bgcolor="#1F4F8F"></td>
		</tr>
		<tr align="center" bgcolor="#87E8FF">
			<td width="42" bgcolor="#DFEDFF"><font size="2">��ȣ</font></td>
			<td width="340" bgcolor="#DFEDFF"><font size="2">����</font></td>
			<td width="84" bgcolor="#DFEDFF"><font size="2">�����</font></td>
			<td width="78" bgcolor="#DFEDFF"><font size="2">��¥</font></td>
			<td width="49" bgcolor="#DFEDFF"><font size="2">��ȸ</font></td>
		</tr>
		<tr align="center">
			<td colspan="5" bgcolor="#1F4F8F" height="1"></td>
		</tr>
<%

Vector name=new Vector();
Vector email=new Vector();
Vector inputdate=new Vector();
Vector subject=new Vector();
Vector rcount=new Vector();

Vector step=new Vector();
Vector keyid=new Vector();

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
int maxrows=5;
int totalrows=0;
int totalpages=0;

int id=0;


String em=null;
Connection con=null;
Statement st = null;
ResultSet rs = null;

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

try{
	st=con.createStatement();
	String sql = "select * from freeboard order by";
	sql = sql + " masterid desc, replynum, step, id";
	rs = st.executeQuery(sql);
	
	if(!(rs.next())) {
		out.println("�Խ��ǿ� �ø� ���� �����ϴ�.");
	} else {
		do{
			keyid.addElement(new Integer(rs.getInt("id")));
			name.addElement(rs.getString("name"));
			email.addElement(rs.getString("email"));
			String idate = rs.getString("inputdate");
			idate = idate.substring(0,8);
			inputdate.addElement(idate);
			subject.addElement(rs.getString("subject"));
			rcount.addElement(new Integer(rs.getInt("readcount")));
			step.addElement(new Integer(rs.getInt("step")));
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
				String temp= (String)email.elementAt(j);
				if((temp == null) || (temp.equals("")))
					em =(String)name.elementAt(j);
				else
					em ="<a href=mailto:" + temp + ">" + name.elementAt(j) + "</a>";
				
					id = totalrows-j;
					
					if(j%2 ==0){
%>
		<tr onMouseOver="bgColor='#DFEDFF'" onMouseOut="bgColor=''">
<%
					}else{
%>
		<tr onMouseOver="bgColor='#DFEDFF'" onMouseOut="bgColor=''"> 
<%} %>
			<td align=center><%=id %></td>
			<td>
			<%
			int stepi=((Integer)step.elementAt(j)).intValue();
			int imgcount = j-startrow;
			if(stepi > 0) {
				for(int count=0;count <stepi;count++)
					out.print("&nbsp;&nbsp;");
				out.println("<img name=icon"+imgcount+" src=image/arrow.gif>");
				out.print("<a href=freeboard_read.jsp?id=");
				out.print(keyid.elementAt(j)+"&page="+where);
				out.print(" onmouseover=\"rimgchg("+imgcount+",1)\"");
				out.print(" onmouseout=\"rimgchg("+imgcount+",2)\">");
			}	else {
				out.println("<img name=icon"+imgcount+" src=image/close.gif>");
				out.print("<a href=freeboard_read.jsp?id=");
				out.print(keyid.elementAt(j) + "&page=" + where );
				out.print(" onmouseover=\"imgchg("+imgcount+",1)\"");
				out.print(" onmouseout=\"imgchg("+imgcount+",2)\">");
			}
			out.println(subject.elementAt(j)+"</td>");
			%>
			<td align=center><%=em %></td>
			<td align=center><%=inputdate.elementAt(j) %></td>
			<td align=center><%=rcount.elementAt(j) %></td>
		</tr>
<%
		
	}
	rs.close();
	}
	out.println("</table>");
	st.close();
	con.close();
} catch (SQLException e) {
	out.println(e);
}
if(wheregroup > 1) {
	out.println("[<a href=freeboard_list.jsp?gogroup=1>ó��</a>]");
	out.println("[<a href=freeboard_list.jsp?gogroup="+priorgroup+">����</a>]");
} else {
	out.println("[ó��]");
	out.println("[����]");
}
 if (name.size() !=0) { 
for(int jj=startpage; jj<=endpage; jj++){
	if(jj==where)
		out.println("["+jj+"]");
	else
		out.println("[<a href=freeboard_list.jsp?go="+jj+">"+ jj +"</a>]");
}
 }
if(wheregroup < totalgroup) {
	out.println("[<a href=freeboard_list.jsp?gogroup="+nextgroup+">����</a>]");
	out.println("[<a href=freeboard_list.jsp?gogroup="+totalgroup+">������</a>]");
} else {
	out.println("[����]");
	out.println("[������]");
}

out.println("��ü �ۼ� : " + totalrows);

%>
<!-- <table border=0 width=600 cellpadding=0 cellspacing=0>
	<tr>
		<td align=right valign=bottom>
			<a href="freeboard_write.html"><img src="image/write.gif" width="66" height="21" border=0></a>
		</td>
	</tr>
</table> -->
<form method="post" name="msgsearch" action="freeboard_search.jsp">
<table border=0 width=600 cellpadding=0 cellspacing=0>
	<tr>
		<td align="right" width="241">
			<select name=stype>
				<option value=1 >�̸�
				<option value=2 >����
				<option value=3 >����
				<option value=4 >�̸�+����
				<option value=5 >�̸�+����
				<option value=6 >����+����
				<option value=7 >�̸�+����+����
			</select>
		</td>
		<td width="127" align="center">
			<input type=text size=17 name=sval>
		</td>
		<td width="115">&nbsp;<a href="#" onClick="check();"><img src="image/search.gif" border=0 align='center'></a></td>
		<td align=right valign=bottom width=117><a href="freeboard_write.html"><img src="image/write.gif" border="0"></a></td>
	</tr>
</table>
</form>
</center>
</body>
</html>