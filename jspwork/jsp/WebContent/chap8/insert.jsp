<%@ page info="insert" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.text.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
String userid = request.getParameter("userid");
String username = request.getParameter("username");
String password = request.getParameter("password");
String securitynum1 = request.getParameter("securitynum1");
String securitynum2 = request.getParameter("securitynum2");
String securitynum = securitynum1+"-"+securitynum2;
String email = request.getParameter("email");
String zipcode1 = request.getParameter("zipcode1");
String zipcode2 = request.getParameter("zipcode2");
String zipcode = zipcode1+"-"+zipcode2;
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String phone = phone1+"-"+ phone2+"-"+phone3;
String query = new String();

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
int check_count =0;

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
String regdate=myformat.format(yymmdd);

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e);
}
try{
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr"	,"root","apmsetup");
	stmt = conn.createStatement();

	query = "insert into member values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, userid);
	pstmt.setString(2, username);
	pstmt.setString(3, password);
	pstmt.setString(4, securitynum);
	pstmt.setString(5, email);
	pstmt.setString(6, zipcode);
	pstmt.setString(7, address1);
	pstmt.setString(8, address2);
	pstmt.setString(9, phone);
	pstmt.setString(10, regdate);
	pstmt.executeUpdate();
	

	
}catch (SQLException e){
	out.println("<script>alert('����ó���� ���� �ʾҽ��ϴ�. �ٽ� �õ��� �ּ���.'); history.back();</script>");	
} finally {
	conn.close();
}

%>

<!DOCTYPE html>
<html>
<head>
<title>���� �Ϸ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%-- �ܺ� ��Ÿ�Ͻ�Ʈ ���� --%>

<link rel="StyleSheet" href="style.css" type="text/css">
<script language="JavaScript">
<!--
function doSubmit() {
	form = document.join;
	if(!form.userid.value){
		alert('���̵� �Է����� �ʾҽ��ϴ�.');
		form.userid.focus();
		return;
	}
	form.submit();
}
//-->

</script>

</head>
<body text="#000000" bgcolor="#FFFFFF">
<br>
<br>
<form name="join" method="post" action="modify.jsp">
	<input type=hidden name="userid" value="<%=userid %>">
	<input type=hidden name="mode" value="modify">
	<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
		<tr align="center">
			<td colspan="2" background="image/sky_bar.gif">������ ���ϵ帳�ϴ�. �Է��Ͻ� ������ Ȯ���ϼ���.</td>
		</tr>
		<tr>
			<td width="15%" align="right">���̵�</td>
			<td width="75%"><%=userid %></td>
		</tr>
		<tr>
			<td width="15%" align="right">�̸�</td>
			<td width="75%"><%=username %></td>
		</tr>
		<tr>
			<td width="15%" align="right">��й�ȣ</td>
			<td width="75%">���Ȼ� �������� �ʽ��ϴ�.</td>
		</tr>		
		<tr>
			<td width="15%" align="right">�ֹε�Ϲ�ȣ</td>
			<td width="75%"><%=securitynum %></td>
		</tr>
		<tr>
			<td width="15%" align="right">EMAIL</td>
			<td width="75%"><%=email %></td>
		</tr>
		<tr>
			<td width="15%" align="right">�����ȣ</td>
			<td width="75%"><%=zipcode %></td>
		</tr>
		<tr>
			<td width="15%" align="right">�ּ�1</td>
			<td width="75%"><%=address1 %></td>
		</tr>
		<tr>
			<td width="15%" align="right">�ּ�2</td>
			<td width="75%"><%=address2 %></td>
		</tr>
		<tr>
			<td width="15%" align="right">�޴���</td>
			<td width="75%">
			<%
				if(phone.equals("--")) {
					out.println("<font color='blue'>�������� �ʾҽ��ϴ�.</font>");
				} else {
					out.println(phone);
				}
			%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="Ȯ    ��" onClick="location='siangsiu.html'">
				<input type="button" value="��    ��" onClick="doSubmit()"></td>
		</tr>
	</table>





</body>
</html>