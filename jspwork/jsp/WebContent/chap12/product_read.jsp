<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ����(�̹���) ����</title>
<script language="javascript">
	function view(temp) {
		filename = "http://localhost:8080/jsp/chap12/upload/" +temp;
		i = window.open(filename, "win", "height=350,width=450,toolbar=0,menubar=0, scrollbars=1, resizable=1,status=0");
	}

</script>
</head>
<body>
<%
String ca="";
String pn="";

if(request.getParameter("cat")!=null)
	if(!(request.getParameter("cat").equals("")))
		ca=request.getParameter("cat");
if(request.getParameter("pname") != null)
	if(!(request.getParameter("pname").equals("")))
		pn=request.getParameter("pname");

String sql =null;
Connection con = null;
Statement st = null;
ResultSet rs = null;
long id = Long.parseLong(request.getParameter("id"));
 
String url = "http://localhost:8080/jsp/chap12/upload/";

String small=null;

%>
[<a href="product_list.jsp?go=<%=request.getParameter("go") %>&cat<%=ca %>&pname=<%=pn %>">��ǰ �������</a>]
<%
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

try{
	st = con.createStatement();
	sql = "select * from product where id="+id;
	rs = st.executeQuery(sql);
	if(!(rs.next())) {
		out.println("�ش� ������ �����ϴ�.");
	} else {
		small=url+rs.getString("small");
		%>
		<table width=500 border=0 >
			<tr>
				<th rowspan=3>
					<a href=javaScript:view("<%=rs.getString("large") %>")>
					<img width=100 height=100 src="<%=small %>">
					<br>Ȯ��</a>
				</th>
				<th bgcolor=#003399>
					<font face=���� color=white>
						<%=rs.getString("pname") %>(<%=rs.getLong("id") %>)--�ۼ���:<%=rs.getString("wname") %>
					</font>
				</th>
			</tr>
			<tr>
				<td>
					<u>�� ���� : </u><br>
					<%=rs.getString("description") %>
				</td>
			</tr>
			<tr>
				<td align=right>
					����(����)��:<%=rs.getString("sname") %><br>
					���߰�:<strike><%=rs.getString("price") %></strike>��
					�ǸŰ�:<%=rs.getString("downprice") %>��
				</td>
			</tr>
		</table>
		
		<%
	}
	rs.close();
	st.close();
	con.close();
}catch(SQLException e) {
	out.println(e);
}

%>

</body>
</html>