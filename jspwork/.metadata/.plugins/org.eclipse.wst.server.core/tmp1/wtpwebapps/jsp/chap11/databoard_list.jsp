<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="databoard.css" rel="stylesheet" type="text/css">
<script language="javascript">
function check(){
	with(document.msgsearch){
		if(sval.value.length==0){
			alert("검색어를 입력해 주세요.?!!");
			sval.focus();
			return false;
		}
		document.msgsearch.submit();
	}
}
function imgchg(p1,p2) {
	if(p2==1)
		document.images[p1].src = "image/open.gif";
	else
		document.images[p1].src = "image/close.gif";
}
</script>
<title>게시판</title>
</head>
<body>
<p>
<p align=center><font color=#0000ff face=굴림 size=3><strong>자유 게시판</strong></font></p>
<p>
<center>
	<table border=0 width=600 cellpadding=4 cellspacing=0>
		<tr align="right">
			<td colspan="6" height="23">&nbsp;
		</tr>
		<tr align="center">
			<td colspan="6" height="1" bgcolor="#1F4F8F"></td>
		</tr>
		<tr align="center" bgcolor="#87E8FF">
			<td width="38" bgcolor="#DFEDFF"><font size="2">번호</font></td>
			<td width="259" bgcolor="#DFEDFF"><font size="2">제목</font></td>
			<td width="65" bgcolor="#DFEDFF"><font size="2">등록자</font></td>
			<td width="51" bgcolor="#DFEDFF"><font size="2">날짜</font></td>
			<td width="111" bgcolor="#DFEDFF"><font size="2">첨부파일</font></td>
			<td width="26" bgcolor="#DFEDFF"><font size="2">조회</font></td>
		</tr>
		<tr align="center">
			<td colspan="6" bgcolor="#1F4F8F" height="1"></td>
		</tr>
<%
session = request.getSession(true);
String where = request.getParameter("go");
Vector name=new Vector();
Vector email=new Vector();
Vector inputdate=new Vector();
Vector subject=new Vector();
Vector rcount=new Vector();

Vector step=new Vector();
Vector keyid=new Vector();
Vector fname= new Vector();

String url = "http://localhost:8080/jsp/chap11/upload/";
String finame=null;
int stepcount=0;
int count=0;
int start=0;
int end=0;
int maxrows=10;
int totalrows = 0;
int totalpages=0;
int j=0;
int totalgroup =0;
int maxpages=10;
int startp=0;
int endp=0;
int cg=0;
int id=0;
Integer i=(Integer)session.getValue("cp");

if(where != null) {
	cg =(i.intValue()-1)/maxpages + 1;
	if(where.equals("N")) {
		startp=cg*maxpages+1;
		endp=startp+maxpages-1;
		count=startp;
		cg +=1;
	} else if(where.equals("p")){
		startp = (cg-2)*maxpages+1;
		cg-=1;
		if(startp<=0) {
			startp =1;
			cg=1;
		}
		endp=startp+ maxpages -1;
		count=startp;
		
	}else {
		startp=(cg-1)*maxpages+1;
		endp=startp+maxpages-1;
		count=Integer.parseInt(where);
	}
}else {
	startp=1;
	endp=startp+maxpages-1;
	count=startp;
	cg=1;
}


session.putValue("cp", new Integer(count));

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
	String sql = "select * from databoard order by";
	sql = sql + " masterid desc, replynum asc, step desc, id asc";
	rs = st.executeQuery(sql);
	
	if(!(rs.next())) {
		out.println("자료실에 올린 글이 없습니다.");
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
			fname.addElement(rs.getString("filename"));
		}while(rs.next());
		totalrows = name.size();
		totalpages = (totalrows-1)/maxrows+1;
		totalgroup = (totalpages-1)/maxpages +1;
		if(startp > totalpages){
			startp = (totalgroup-1)*maxpages+1;
			endp=startp+maxpages-1;
			count=startp;
			session.putValue("cp", new Integer(count));
		}
		if(endp > totalpages)
			endp=totalpages;
		
		start = count * maxrows -maxrows;
		end=start+maxrows;
		if(end > totalrows) {
			end= totalrows;
		}
		
		for(j=start; j<end; j++){
			String temp= (String)email.elementAt(j);
			if(temp != null && temp!="")
				em ="<a href=mailto:" + temp + ">" + name.elementAt(j) + "</a>";
			finame=(String)fname.elementAt(j);
			if(finame.length() != 0)
				finame="<a href=down.jsp?file="+finame+">"+finame+"</a>";
			id = totalrows-j;
					
			if(j%2 ==0){
%>
		<tr align='center' onMouseOver="bgColor='#DFEDFF'" onMouseOut="bgColor=''"/>
<%
					}else{
%>
		<tr align='center' onMouseOver="bgColor='#DFEDFF'" onMouseOut="bgColor=''"/> 
<%} %>
			<td align=center><%=id %></td>
			<td align=left>
			<%
			Integer stepi=(Integer)step.elementAt(j);
			int imgcount = j-start;
			if(stepi.intValue() > 0) {
				for(stepcount=0;stepcount <stepi.intValue();stepcount++)
					out.print("&nbsp;&nbsp;");
				out.println("<img src=image/arrow.gif>");
			}
			out.println("<img name=icon"+imgcount+" src=image/close.gif>");				
			out.print("<a href=databoard_read.jsp?id=");
			out.print(keyid.elementAt(j)+"&page="+session.getValue("cp")+"\"");
			out.print(" onmouseover=\"imgchg("+imgcount+",1)\"");
			out.print(" onmouseout=\"imgchg("+imgcount+",2)\">");
			out.println(subject.elementAt(j)+"</a></td>");
			%>
			<td>
			<% if(em != null){ %>
			<%=em %></td>
			<% } else { %>
			<%=name.elementAt(j) %></td>
			<% } %>
			<td><%=inputdate.elementAt(j) %></td>
			<td><%=finame %></td>
			<td><%=rcount.elementAt(j) %></td>
		</tr>
		<%} %>
		<tr align="center">
			<td colspan="6" height="1" class="button"></td>
		</tr>
		<tr align="center">
			<td colspan="6" height="1" bgcolor="#1f4f8f"></td>
		</tr>
		<tr align="center">
			<td colspan="6" style="padding:10 0 0 0">
			<%if (cg >0){ %>
			[<a href="databoard_list.jsp?go=P">이전</a>]
			<%} else { %>
			[이전]
			<% } 
			int jj=startp;
			while(jj <= endp) {
				if(jj!=count) { %>
				[<a href="databoard_list.jsp?go=jj">jj</a>]
						<%} else { %>
						[<%=jj %>]
				<%} 
				jj +=1;
			}
			if(cg <totalgroup){ %>
			[<a href="databoard_list.jsp?go=N">다음</a>]
					<%} else { %>
					[다음]
			<%} %>
			
			
	 	전체 글수 : <%=totalrows %>
		</tr>
	</table>
<%
		
		}
		rs.close();
		st.close();
		con.close();
	} catch (SQLException e) {
		out.println(e);
	}
%>

<form method="post" name="msgsearch" action="databoard_search.jsp">
<table border=0 width=600 cellpadding=0 cellspacing=0>
	<tr>
		<td align="right" width="241">
			<select name=stype>
				<option value=1 >이름
				<option value=2 >제목
				<option value=3 >내용
				<option value=4 >이름+제목
				<option value=5 >이름+내용
				<option value=6 >제목+내용
				<option value=7 >이름+제목+내용
				<option value=8 >파일이름
			</select>
		</td>
		<td width="127" align="center">
			<input type=text size=17 name=sval>
		</td>
		<td width="115">&nbsp;<a href="#" onClick="check();"><img src="image/search.gif" border=0></a></td>
		<td align=right valign=bottom width=117><a href="databoard_write.html"><img src="image/write.gif" border="0"></a></td>
	</tr>
</table>
</form>
</center>
</body>
</html>