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
<%
String id = request.getParameter("id");
String password = request.getParameter("password").trim();
String sql = "select * from woori where id=?";
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch(ClassNotFoundException e){
	out.println(e.getMessage());
}

try{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&true&characterEncoding=euckr"
			,"root","apmsetup");
}catch (SQLException e){
	out.println(e);
}

try {
	pst = con.prepareStatement(sql);
	pst.setString(1,id);
	
	rs = pst.executeQuery();
	
	if(!(rs.next())) {%>
	해당되는 회원이 없습니다.
	<% } else { 
		if(password.equals(rs.getString("password"))) { %>
		사용자 ID가 <%=id %> 인 회원의 정보는 다음과 같습니다.
		정보를 변경하려면 내용을 입력한 다음 <수정하기>버튼을 누르세요.
		<form name="form1" method="post" action="update.jsp">
			<INPUT type="hidden" name="id" value="<%=id %>">
			<br> 이름 : 
			<INPUT type="text" name="name" value="<%=rs.getString("name")%>">
			<br> E-mail : 
			<INPUT type="text" name="email" value="<%=rs.getString("email")%>">
			<INPUT type="submit" name="change" value="수정하기">
			<A href="delete.jsp?id=<%=id %>"> 삭제하기</A>
		
		</form>
		
		<%} else { %>
		 비밀번호가 틀립니다.
		<% }
	}
	rs.close();
	con.close();
	pst.close();
}catch(SQLException e) {
	out.println(e);
}
%>
<A href="main.html"> 메인으로</A>&nbsp;
<A href="select.html">조회페이지로</A>
</body>
</html>