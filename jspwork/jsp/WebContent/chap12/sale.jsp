<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<%
try {
	session=request.getSession();
	String id = request.getParameter("id");
	int qty = Integer.parseInt(request.getParameter("quantity"));
	
	String ca="";
	String pn="";
	
	if(request.getParameter("cat") != null)
		if( !(request.getParameter("cat").equals("")))
			ca=request.getParameter("cat");
		
	

	if(request.getParameter("pname") != null) 
		if(!(request.getParameter("pname").equals("")))
			pn=request.getParameter("pname");
	
	String[] a = session.getValueNames();
	
	for(int i=0; i<a.length; i++){
		if(id.equals(a[i])){
			int old=((Integer)session.getValue(id)).intValue();
			qty = qty+old;
		}
	}
	
	session.putValue(id, new Integer(qty));
	%>
	�ٱ��Ͽ� �־����ϴ�.
	[<a href="shop_list.jsp?go=<%=request.getParameter("go") %>&cat=<%=ca %>&pname=<%=pn %>">��� �����ϱ�</a>]	
	[<a href="sale_list.jsp?go=<%=request.getParameter("go") %>&cat=<%=ca %>&pname=<%=pn %>">��ٱ��� ����</a>]	
	
	<%
	
} catch (Exception e) {
	out.println(e);
}

%>
</body>
</html>