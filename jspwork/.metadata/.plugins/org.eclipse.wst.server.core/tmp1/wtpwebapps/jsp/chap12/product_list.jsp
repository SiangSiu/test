<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ��� </title>
</head>
<body>
<p align="center">
<font color=0000ff face=���� size=+1>
<strong> ��ǰ ��� </strong></font><p>

<form method=post name=search action="product_list.jsp">
<table border=0 width="95%">
	<tr>
		<td align=right>
			<font size=-1>��ǰ������ ã��</font>
			<input type=text name= pname>
			<input type=submit value="�˻�">
		</td>
	</tr>	
	<tr>
		<th>
			<font size=-1>
				[<a href="main.html">��������</a>]
				<a href="product_list.jsp">��ü</a>
				<a href="product_list.jsp?cat=11">����</a>
				<a href="product_list.jsp?cat=22">����/����</a>
				<a href="product_list.jsp?cat=33">�ξ���ǰ</a>
				<a href="product_list.jsp?cat=44">�Ƿ�</a>
				<a href="product_list.jsp?cat=55">���� �� �Ǽ��縮</a>
				<a href="product_list.jsp?cat=66">�ｺ �ⱸ</a>
				<a href="product_list.jsp?cat=77">��ǻ�� ����</a>
				<a href="product_list.jsp?cat=88">��Ÿ</a>
			</font>
		</th>
	</tr>
</table>
</form>

<center>
<table border=0 width=95% cellpadding=4 cellspacing=4 style="font-size:10pt">
	<tr>
		<th width=5% bgcolor=#dfedff>
			<font color=black face=����>
				<nobr>��ȣ</nobr>
			</font>
		</th>
		<th width=25% bgcolor=#dfedff>
			<font color=black face=����>
				<nobr>��ǰ��</nobr>
			</font>
		</th>
		<th width=10% bgcolor=#dfedff>
			<font color=black face=����>
				<nobr>�ڵ��ȣ</nobr>
			</font>
		</th>
		<th width=15% bgcolor=#dfedff>
			<font color=black face=����>
				<nobr>������</nobr>
			</font>
		</th>
		<th width=10% bgcolor=#dfedff>
			<font color=black face=����>
				<nobr>�ǸŽ�����</nobr>
			</font>
		</th>
		<th width=10% bgcolor=#dfedff>
			<font color=black face=����>
				<nobr>�ǸŰ�(��)</nobr>
			</font>
		</th>
		<th width=10% bgcolor=#dfedff>
			<font color=black face=����>
				<nobr>���</nobr>
			</font>
		</th>
		<th width=15% bgcolor=#dfedff>
			<font color=black face=����>
				<nobr>�з�</nobr>
			</font>
		</th>
	</tr>
<%

String cond="";
String ca="";
String pn="";

if(request.getParameter("cat") != null) {
	if( !(request.getParameter("cat").equals(""))){
		ca=request.getParameter("cat");
		cond=" where category = '"+ ca+"'";
	}
}

if(request.getParameter("pname") != null) {
	if(!(request.getParameter("pname").equals(""))){
		pn=request.getParameter("pname");
		cond = " where pname like '%" + pn+"%'";
	}
}

Vector pname = new Vector();
Vector sname = new Vector();
Vector keyid = new Vector();
Vector cat = new Vector();
Vector dprice = new Vector();
Vector inputdate = new Vector();
Vector stock = new Vector();
String category = null;

long id=0;

NumberFormat nf = NumberFormat.getInstance();
String downprice = null;

int where=1;
int totalgroup=0;
int maxpages=2;
int startpage=1;
int endpage=startpage+maxpages-1;
int wheregroup=1;
if(request.getParameter("go")!=null) {
	where = Integer.parseInt(request.getParameter("go"));
	wheregroup = (where-1)/maxpages+1;
	startpage=(wheregroup-1)*maxpages+1;
	endpage=startpage+maxpages-1;
} else if(request.getParameter("gogroup")!=null){
	wheregroup = Integer.parseInt(request.getParameter("gogroup"));
	startpage=(wheregroup-1)*maxpages+1;
	where =startpage;
	endpage=startpage+maxpages-1;
	
}
int nextgroup=wheregroup+1;
int priorgroup=wheregroup-1;

int startrow=0;
int endrow=0;
int maxrows=5;
int totalrows=0;
int totalpages=0;
Connection con =null;
Statement st=null;
ResultSet rs = null;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
//	Class.forName("oracle.jdbc.driver.OracleDriver");
	
}catch(ClassNotFoundException e){
	out.println(e.getMessage());
}

try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useUnicode=true&characterEncoding=euckr","root","apmsetup");
	//con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "1234");
} catch(SQLException e) {
	out.println(e);
}

try {
	st = con.createStatement();
	String sql = "select * from product";
	sql = sql +cond+ " order by id";
	rs = st.executeQuery(sql);
	if(!(rs.next())){
		out.println("��ǰ�� �����ϴ�.");
	} else {
		do{
			keyid.addElement(new Long(rs.getLong("id")));
			cat.addElement(rs.getString("category"));
			pname.addElement(rs.getString("pname"));
			sname.addElement(rs.getString("sname"));
			dprice.addElement(new Integer(rs.getString("downprice")));
			String idate = rs.getString("inputdate");
			idate = idate.substring(0,8);
			inputdate.addElement(idate);
			stock.addElement(new Integer(rs.getInt("stock")));
		}while(rs.next());
		
		totalrows = pname.size();
		totalpages = (totalrows-1)/maxrows +1;
		startrow = (where-1)*maxrows;
		endrow = startrow+maxrows-1;
		if(endrow >= totalrows)
			endrow=totalrows-1;
		totalgroup = (totalpages-1)/maxpages +1;
		if(endpage>totalpages)
			endpage=totalpages;
		for(int j=startrow;j<=endrow;j++) {
			id=((Long)keyid.elementAt(j)).longValue();
			downprice=nf.format( ((Integer)dprice.elementAt(j)).intValue() );
			switch (Integer.parseInt((String)cat.elementAt(j))){
			case 11:
				category="����";
				break;
			case 22:
				category="����/����";
				break;
			case 33:
				category="�ξ���ǰ";
				break;
			case 44:
				category="�Ƿ�";
				break;
			case 55:
				category="���� �� �Ǽ��縮";
				break;
			case 66:
				category="�ｺ�ⱸ";
				break;
			case 77:
				category="��ǻ�Ͱ���";
				break;
			case 88:
				category="��Ÿ";
				break;
			default:
				break;
			}
			%>
			<tr>
				<th width=5% bgcolor=#eeeeee><%=(j+1) %></th>
				<td width=25% bgcolor=#eeeeee><a href="product_read.jsp?id=<%=id %>&go=<%=where %>&cat=<%=ca %>&pname=<%=pn %>"><%=pname.elementAt(j) %></a></td>
				<td width=10% bgcolor=#eeeeee><%=id %></td>
				<td width=15% bgcolor=#eeeeee><%=sname.elementAt(j) %></td>
				<td width=10% bgcolor=#eeeeee><%=inputdate.elementAt(j) %></td>
				<td width=10% bgcolor=#eeeeee align=right><%=downprice %></td>
				<td width=10% bgcolor=#eeeeee align=right><%=stock.elementAt(j) %></td>
				<td width=10% bgcolor=#eeeeee><%=category %></td>
			
			</tr>
			
			<%
		}
		rs.close();
		%>
		</table>
		<% 
		st.close();
		con.close();
		}
}catch(SQLException e){
	out.println(e);
}

if(wheregroup  > 1) {
	%>
	[<a href="product_list.jsp?gogroup=1&cat<%=ca %>&pname=<%=pn %>">ó��</a>]
	[<a href="product_list.jsp?gogroup=<%=priorgroup %>&cat<%=ca %>&pname=<%=pn %>">����</a>]
	<% 
}else {
	out.println("[ó��]");
	out.println("[����]");
}

if(totalrows != 0) {
	for(int jj=startpage; jj<=endpage; jj++){
		if(jj==where)
			out.println("["+jj+"]");
		else {%>
			[<a href="product_list.jsp?go=<%=jj %>&cat=<%=ca %>&pname=<%=pn %>"><%=jj %></a>]
<%	}
	}
}

if(wheregroup < totalgroup) { %>
	[<a href="profuct_list.jsp?gogroup=<%=nextgroup %>&cat=<%=ca %>&pname=<%=pn %>">����</a>]	
	[<a href="profuct_list.jsp?gogroup=<%=totalgroup %>&cat=<%=ca %>&pname=<%=pn %>">������</a>]	

<% 
}else {
	out.println("[����]");
	out.println("[������]");
}

out.println("��ü��ǰ�� : "+totalrows);


%>
</center>
</body>
</html>