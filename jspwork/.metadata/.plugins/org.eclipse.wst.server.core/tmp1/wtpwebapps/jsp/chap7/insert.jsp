<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<%

String id = request.getParameter("id");
int password = Integer.parseInt(request.getParameter("password"));
String name=request.getParameter("name");
String email = request.getParameter("email");
String sql=null;

Connection conn=null;
Statement st = null;
ResultSet rs=null;
int cnt=0;



try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e.getMessage());
}

try{
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr"
    		,"root","apmsetup");
    st=conn.createStatement();
    rs = st.executeQuery("select * from woori where id= '" + id +"'");
    
    if(!(rs.next())){
    	st=conn.createStatement();
    	sql="insert into woori(id,password,name,email)";
    	sql=sql +" values('"+id +"',"+ password+",";
    	sql=sql+"'"+ name + "','"+ email+"')";
    	
    	cnt = st.executeUpdate(sql);
    	if(cnt>0)
    		out.println("�����Ͱ� ���������� �ԷµǾ����ϴ�.");
    	else
    		out.println("�����Ͱ� �Էµ��� �ʾҽ��ϴ�.");   
    
    }else
		out.println("id�� �̹� ��ϵǾ� �ֽ��ϴ�.");
    st.close();
    conn.close();
    
} catch (SQLException e) {
   out.println(e.getMessage());
}

%>
[<A href="main.html">main����</A>]
&nbsp;[<A href="insert.html">ȸ�� ��� ��������</A>]


</body>
</html>