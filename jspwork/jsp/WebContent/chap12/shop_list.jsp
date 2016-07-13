<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ϱ�</title>
<script language="javascript">
	function view(temp) {
		if(temp.length > 0) {
			url ="http://localhost:8080/jsp/chap12/upload/" + temp;
			window.open(url, "win", "height=350, width=450,toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0");
		}
	}

</script>
</head>
<body>
<p align=center>
	<font color=#0000ff face=���� size=3>
		<strong>�����ϱ�</strong>
	</font>
</p>

<form method=post name=search action="shop_list.jsp">
<table border=0 width=95%>
	<tr>
		<th align=right>
			<font size=-1>.��ǰ������ ã��</font>
			<input type=text name=pname>
			<input type=submit value="�˻�">
		</th>
	</tr>
	<tr>
		<th>
			<font size=-1>
				[<a href="main.html">��������</a>]
				<a href="shop_list.jsp">��ü</a>
				<a href="shop_list.jsp?cat=11">����</a>
				<a href="shop_list.jsp?cat=22">����/����</a>
				<a href="shop_list.jsp?cat=33">�ξ���ǰ</a>
				<a href="shop_list.jsp?cat=44">�Ƿ�</a>
				<a href="shop_list.jsp?cat=55">���� �� �Ǽ��縮</a>
				<a href="shop_list.jsp?cat=66">�ｺ �ⱸ</a>
				<a href="shop_list.jsp?cat=77">��ǻ�� ����</a>
				<a href="shop_list.jsp?cat=88">�ⱸ</a>
			</font>
		</th>
	</tr>
</table>
</form>

<center>
<table width=95% sthle="font-size:10pt">
<%
String cond="";
String ca="";
String pn="";

if(request.getParameter("cat")!=null) {
	if(!(request.getParameter("cat").equals(""))){
		ca=request.getParameter("cat");
		cond = " where category ='"+ ca+"'";
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
Vector price = new Vector();
Vector dprice = new Vector();
Vector stock = new Vector();
Vector small = new Vector();
Vector large = new Vector();
Vector description = new Vector();

String url = "http://localhost:8080/jsp/chap12/upload/";

NumberFormat nf = NumberFormat.getInstance();

int stocki;
String pricestr=null;
String dpricestr=null;
String filename="";

int where=1;

if(request.getParameter("go")!=null)
	where = Integer.parseInt(request.getParameter("go"));

int nextpage = where+1;
int priorpage = where-1;
int startrow=0;
int endrow=0;
int maxrows=3;
int totalrows=0;
int totalpages=0;

long id = 0;

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
	String sql = "select * from product" ;
	sql = sql+ cond + " order by id desc";
	rs= st.executeQuery(sql);
	if(!(rs.next())){
		out.println("��ǰ�� �����ϴ�.");
	} else {
		do{
			keyid.addElement(new Long(rs.getLong("id")));
			pname.addElement(rs.getString("pname"));
			sname.addElement(rs.getString("sname"));
			price.addElement(new Integer(rs.getInt("price")));
			dprice.addElement(new Integer(rs.getString("downprice")));
			stock.addElement(new Integer(rs.getInt("stock")));
			description.addElement(rs.getString("description"));
			small.addElement(rs.getString("small"));
			large.addElement(rs.getString("large"));
		}while(rs.next());
	
		totalrows = pname.size();
		totalpages = (totalrows-1)/maxrows +1;
		
		startrow = (where-1)*maxrows;
		endrow = startrow+maxrows-1;
	
		if(endrow >= totalrows)
			endrow=totalrows-1;
		
		for(int j=startrow;j<=endrow;j++) {
			id=((Long)keyid.elementAt(j)).longValue();
			stocki=((Integer)stock.elementAt(j)).intValue();
			filename = url+(String)small.elementAt(j);
			pricestr = nf.format(price.elementAt(j));
			dpricestr=nf.format(dprice.elementAt(j));
			
			%>
			<tr>
				<th rowspan=4>
					<a href=javaScript:view("<%=large.elementAt(j) %>")><img border=0 width=70 height=70 src="<%=filename %>">
						<br>Ȯ��
					</a>
				</th>
				<td bgcolor="#dfedff">
					<font face="����ü" color=black><%=pname.elementAt(j) %>(�ڵ�:<%=id %>)</font>
				</td>
			</tr>
			<tr>
				<td bgcolor=#eeeeee><%=description.elementAt(j) %></td>
			</tr>
			<tr>
				<td align=right>
					���߰� : <strike><%=pricestr %></strike>��&nbsp;&nbsp;
					�ǸŰ� : <%=dpricestr %>��
				</td>
			</tr>
			<form method=post name=search action="sale.jsp">
				<tr>
					<td align=right>
						����(����)�� : <%=sname.elementAt(j) %>&nbsp;&nbsp;
			
		<%	if(stocki>0) { %>
						�ֹ�����
						<input type=text name=quantity size=2 value=1>��
						<input type=hidden name=id value=<%=id %>>
						<input type=hidden name=go value=<%=where %>>
						<input type=hidden name=cat value=<%=ca %>>
						<input type=hidden name=pname value=<%=pn %>>
						<input type=submit value="�ٱ��Ͽ� ���">
	
				
	<% }else
				out.println("ǰ��"); %>
					</td>
				</tr>
			</form>
	<% 		
		}
		rs.close();
	}
	
	%>
	</table>
	<%
	st.close();
	con.close();
} catch(SQLException e){
	out.println(e);
}
	

if(where< totalpages) { %>
[<a href="shop_list.jsp?go=<%=nextpage %>&cat=<%=ca %>&pname=<%=pn %>">����</a>]	
[<a href="shop_list.jsp?go=<%=totalpages %>&cat=<%=ca %>&pname=<%=pn %>">������</a>]	

<% 
}else {
out.println("[����]");
out.println("[������]");


}

out.println(where+"/"+totalpages);
out.println("��ü ��ǰ�� : "+ totalrows);
%>


</center>


</body>
</html>