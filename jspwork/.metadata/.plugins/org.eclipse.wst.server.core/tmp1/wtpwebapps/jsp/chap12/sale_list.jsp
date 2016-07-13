<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.text.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���</title>
<script language="javascript">
	function setvalue(f) {
		f.quantity.value=0;
		f.submit();
	}

</script>
</head>
<body>
<p align=center>
	<font  color=#0000ff face=���� size=+1>
		<strong> ���� ��� </strong>
	</font>
</p>
<center>
<table border=0 width=600 cellpadding=4 cellspacing=4 style="font-size:10pt">
	<tr>
		<th width=5% bgcolor=#003399>
			<font color=white face=����><nobr>��ȣ</nobr></font>
		</th>
		<th width=20% bgcolor=#003399>
			<font color=white face=����><nobr>��ǰ��</nobr></font>
		</th>
		<th width=20% bgcolor=#003399>
			<font color=white face=����><nobr>������</nobr></font>
		</th>
		<th width=25% bgcolor=#003399>
			<font color=white face=����><nobr>�ֹ� ����</nobr></font>
		</th>
		<th width=10% bgcolor=#003399>
			<font color=white face=����><nobr>�ǸŰ�(��)</nobr></font>
		</th>
		<th width=15% bgcolor=#003399>
			<font color=white face=����><nobr>�հ�(����*�ǸŰ�)</nobr></font>
		</th>
	</tr>
	<%
	long id =0;
	
	session = request.getSession();
	
	String[] a= session.getValueNames();
	
	String where="1";
	
	String ca="";
	String pn="";
	
	int qty=0;
	int count=0;
	
	
	if(request.getParameter("go") != null)
		if( !(request.getParameter("go").equals("")))
			ca=request.getParameter("go");
	
	if(request.getParameter("cat") != null)
		if( !(request.getParameter("cat").equals("")))
			ca=request.getParameter("cat");

	if(request.getParameter("pname") != null) 
		if(!(request.getParameter("pname").equals("")))
			pn=request.getParameter("pname");
	
	NumberFormat nf = NumberFormat.getInstance();
	
	String pricestr="";
	String hap="";
	int price=0;
	long total=0;
	
	Connection con =null;
	Statement st=null;
	ResultSet rs = null;
	String sql = null;
	
	
	try {
		Class.forName("org.gjt.mm.mysql.Driver");
//		Class.forName("oracle.jdbc.driver.OracleDriver");
		
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
		
		for(int i=0; i< a.length; i++) {
			id=Long.parseLong(a[i].trim());
			qty = ((Integer)session.getValue(a[i])).intValue();
			sql = "select * from product where id="+id;
			rs = st.executeQuery(sql);
			
			if(rs.next()) {
				count = count=1;
				price=rs.getInt("downprice");
				pricestr=nf.format(price);
				hap=nf.format(price*qty);
				total=total+(price*qty);
				%>
				<form method=post action="sale_upd.jsp">
					<tr>
						<th width=5% bgcolor=#eeeeee><%=(i+1) %></th>
						<td width=20% bgcolor=#eeeeee><%=rs.getString("pname") %></td>
						<td width=15% bgcolor=#eeeeee><%=rs.getString("sname") %></td>
						<td width=30% bgcolor=#eeeeee>
							<input type=text name=quantity size=2 value=<%=qty %>>��<br/>
							<input type=hidden name=id value=<%=id %>>
							<input type=hidden name=go value=<%=where %>>
							<input type=hidden name=cat value=<%=ca %>>
							<input type=hidden name=pname value=<%=pn %>>
							<input type=submit value="����">
							<input type=button value="����" onClick="setvalue(this.form);">
						</td>
						<td width=10% bgcolor=#eeeeee align=right><%=pricestr %></td>
						<td width=10% bgcolor=#eeeeee align=right><%=hap %></td>
					</tr>
				</form>
				
				<%
			}
		}
		%>
		<tr>
			<td width=10% align=right colspan=6>
				�ֹ� ��ǰ : <%=count %> ǰ��&nbsp;&nbsp;
				�ֹ� �� �հ� �ݾ� : <%=nf.format(total) %> ��
			</td>
		</tr>
		</table>
		<%
		st.close();
		con.close();
		
		%>
		[<a href="shop_list.jsp?go="<%=where %>&cat=<%=ca %>&pname=<%=pn %>>��� �����ϱ�</a>]
		[<a href="order.jsp?total="<%=total %>&count=<%=count %>>�ֹ��ϱ�</a>]
		<%
		} catch(SQLException e) {
			out.println(e);
		
		}
	
	%>
</center>
</body>
</html>