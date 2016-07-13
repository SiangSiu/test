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
    		out.println("데이터가 성공적으로 입력되었습니다.");
    	else
    		out.println("데이터가 입력되지 않았습니다.");   
    
    }else
		out.println("id가 이미 등록되어 있습니다.");
    st.close();
    conn.close();
    
} catch (SQLException e) {
   out.println(e.getMessage());
}

%>
[<A href="main.html">main으로</A>]
&nbsp;[<A href="insert.html">회원 등록 페이지로</A>]


</body>
</html>