<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("euc-kr");%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>
<body>
<%
String fileurl="/jspwork/jsp/WebContent/chap12/upload/";
String saveFolder="upload";
String encType="euc-kr";
int Maxsize = 5*1024*1024;

ServletContext context = getServletContext();
MultipartRequest multi = null;
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
multi = new MultipartRequest(request,fileurl, Maxsize,encType,policy);

String wn = multi.getParameter("wname");
String cat = multi.getParameter("category");
String pn = multi.getParameter("pname");
String sn = multi.getParameter("sname");
int price = Integer.parseInt(multi.getParameter("price"));
int dprice = Integer.parseInt(multi.getParameter("dprice"));
int stock = Integer.parseInt(multi.getParameter("stock"));
String des = multi.getParameter("description");

long id = 0;
int pos=0;

while((pos=des.indexOf("\'",pos))!=-1){
	String left=des.substring(0, pos);
	String right=des.substring(pos, des.length());
	des = left +"\'"+right;
	pos +=2;
}

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");

String ymd = myformat.format(yymmdd);

String sql = null;
Connection con = null;
Statement st = null;
ResultSet rs = null;
int cnt = 0;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
//	Class.forName("oracle.jdbc.driver.OracleDriver");
	
}catch(java.lang.ClassNotFoundException e){
	out.println(e.getMessage());
}

try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useUnicode=true&characterEncoding=euckr","root","apmsetup");
	//con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "1234");
	st = con.createStatement();
	sql = "select max(id) from product where category= '"+ cat+"'";
	
	rs = st.executeQuery(sql);
	rs.next();
	id = rs.getLong(1);
	
	if(id==0)
		id=Integer.parseInt(cat+"00001");
	else
		id = id + 1;
	
	Enumeration files = multi.getFileNames();
	String fname1 = (String) files.nextElement();
	String filename1 = multi.getFilesystemName(fname1);
	String fname2 = (String) files.nextElement();
	String filename2 = multi.getFilesystemName(fname2);
	
	if(filename2 == null)
		filename2 = filename1;
	sql = "insert into product(id,category,wname,pname, sname, price, downprice";
	sql = sql + ",inputdate,stock,small,large,description) values("+id+",'";
	sql = sql + cat+"','"+wn+"','"+pn+"','"+sn+"',"+price+","+dprice+",'"+ymd;
	sql = sql + "'," + stock+",'"+ filename2+"','"+filename1+"','"+des+"')";
	
	cnt = st.executeUpdate(sql);
	
	if(cnt > 0)
		out.println("상품을 등록했습니다.");
	else
		out.println("상품이 등록되지 않았습니다.");
	
	st.close();
	con.close();
}catch (SQLException e) {
	out.println(e);
}


%>
<p>
<a href="product_list.jsp">[상품 목록으로]</a> &nbsp;
<a href="product_write.html">[상품 올리는 곳으로]</a>


</body>
</html>