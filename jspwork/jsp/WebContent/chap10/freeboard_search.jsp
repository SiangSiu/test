<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="filegb.css" rel="stylesheet" type="text/css">
<title>게시판(검색모드)</title>
</head>
<body>
<p>
<p align=center><font color=#0000ff face=굴림 size=3><strong>자유 게시판(검색모드)</strong></font></p>
<form method=post name=search action="freeboard_search.jsp">
	<table border=0 width="95%">
		<tr>
			<td align="left" width="30%" valign=bottom>
				[<a href="freeboard_list.jsp">자유 게시판(일반모드)</a>]</td>
				<td align=right width="70%" valing="bottom">
					<font size=2 face=굴림>
						<select name=stype>
<%
String cond = null;
int what = 1;
String val=null;
if(request.getParameter("stype") != null) {
	what = Integer.parseInt(request.getParameter("stype"));
	val = request.getParameter("sval");
	if(what==1){
		out.println("<option value=1 selected>이름");
		cond =" where name like '%"+ val+"%'";
	} else
		out.println("<option value=1 >이름");
	if(what==2){
		out.println("<option value=2 selected>제목");
		cond =" where subject like '%"+ val+"%'";
	} else
		out.println("<option value=2 >제목");
	if(what==3){
		out.println("<option value=3 selected>내용");
		cond =" where content like '%"+ val+"%'";
	} else
		out.println("<option value=3 >내용");
	if(what==4){
		out.println("<option value=4 selected>이름/제목");
		cond =" where name like '%"+ val+"%'";
		cond = cond + " or subject like '%"+ val+"%'";
	} else
		out.println("<option value=4 >이름/제목");
	if(what==5){
		out.println("<option value=5 selected>이름/내용");
		cond =" where name like '%"+ val+"%'";
		cond =cond + " or content like '%"+ val+"%'";
	} else
		out.println("<option value=5 >이름/내용");
	if(what==6){
		out.println("<option value=6 selected>제목/내용");
		cond =" where subject like '%"+ val+"%'";
		cond = cond + " or content like '%"+ val+"%'";
	} else
		out.println("<option value=6 >제목/내용");
	if(what==7){
		out.println("<option value=7 selected>이름/제목/내용");
		cond =" where name like '%"+ val+"%'";
		cond = cond + " or subject like '%"+ val+"%'";
		cond = cond + " or content like '%"+ val+"%'";
	} else
		out.println("<option value=7 >이름/제목/내용");
	if(val.trim().equals(""))
		cond = "";
}

%>						
						
						
						</select>
					</font>
					<input type=text name="sval" value="<%=request.getParameter("sval") %>">
					<input type=submit value="검색">
				</td>
		</tr>
	</table>


</form>

<center>
	<table border=0 width=600 cellpadding=4 cellspacing=0>
		<tr align="center">
			<td colspan="5" height="1" bgcolor="#1F4F8F"></td>
		</tr>
		<tr>
			<td width="42" bgcolor="#DFEDFF"><font size="2">번호</font></td>
			<td width="340" bgcolor="#DFEDFF"><font size="2">제목</font></td>
			<td width="84" bgcolor="#DFEDFF"><font size="2">등록자</font></td>
			<td width="78" bgcolor="#DFEDFF"><font size="2">날짜</font></td>
			<td width="49" bgcolor="#DFEDFF"><font size="2">조회</font></td>
		</tr>
		<tr>
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
	String sql = "select * from freeboard " + cond;
	sql = sql + " order by id desc";
	rs = st.executeQuery(sql);
	
	if(!(rs.next())) {
		out.println("해당하는 글이 없습니다.");
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
		<tr bgcolor='#ffffff' onMouseOver="bgColor='#DFEDFF'" onMouseOut="bgColor=''">
<%
					}else{
%>
		<tr bgcolor='#f4f4f4' onMouseOver="bgColor='#DFEDFF'" onMouseOut="bgColor='#f4f4f4'"> 
<%} %>
			<td align=center><%=id %></td>
			<td>
			<%
			int stepi=((Integer)step.elementAt(j)).intValue();
			if(stepi > 0) {
				for(int count=0;count <stepi;count++)
					out.print("&nbsp;&nbsp;");
			}	
			String clink ="<a href=freeboard_read.jsp?id=" +keyid.elementAt(j);
			clink = clink +"&page=" +where +">" + subject.elementAt(j) + "</a>";
			%>
			<%=clink %></td>
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
	out.print("[<a href=freeboard_search.jsp?gogroup=1");
	out.print("&stype="+ what+"&sval="+val+">처음</a>]");
	out.print("[<a href=freeboard_list.jsp?gogroup="+priorgroup);
	out.print("&stype="+ what+"&sval="+val+">이전</a>]");
} else {
	out.println("[처음]");
	out.println("[이전]");
}
for(int jj=startpage; jj<=endpage; jj++){
	if(jj==where)
		out.println("["+jj+"]");
	else{
		out.print("[<a href=freeboard_search.jsp?go="+jj);
		out.print("&stype="+ what+"&sval="+ val+">"+jj+"</a>]");
	}
}

if(wheregroup < totalgroup) {
	out.print("[<a href=freeboard_search.jsp?gogroup="+nextgroup);
	out.print("&stype="+ what+"&sval="+val+">다음</a>]");
	out.print("[<a href=freeboard_search.jsp?gogroup="+totalgroup);
	out.print("&stype="+ what+"&sval="+val+">마지막</a>]");
} else {
	out.println("[다음]");
	out.println("[마지막]");
}

out.println("검색된 글 수 : " + totalrows);

%>

</body>
</html>