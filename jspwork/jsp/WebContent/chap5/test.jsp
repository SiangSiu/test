<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>session �׽�Ʈ	</title>
</head>
<body>
<%
	session = request.getSession();
	String[] a= session.getValueNames();
	out.println("���� ID : " + session.getId()+"<BR>");
	out.println("���� ���� �ð� :" + session.getMaxInactiveInterval()+"<BR>");
	if(a.length==0){
		session.putValue(session.getId(), "A");
	} else {
		String what = (String)session.getValue(a[0]);
		out.println("�̸� : "+a[0]+" ��:"+what+"<BR>");
		session.putValue(session.getId(), what+"A");
	}
%>
<A href=test.jsp>�ٽ� �б�</A>
</body>
</html>