<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<B>request ��ü����</B><P>

<%="���ڵ� ��� : " + request.getCharacterEncoding() + "<P>" %>
<%="MIME Ÿ�� : " + request.getContentType()+"<P>"%>
<%="��û���� ���� : " +request.getContentLength()+"<P>"%>
<%="��� �̸� : " + request.getHeaderNames()+"<P>"%>
<%="�� ���� ��� : " +request.getPathInfo()+"<P>"%>
<%="Ŭ���̾�Ʈ �̸� : " + request.getRemoteHost()+"<P>"%>
<%="Ŭ���̾�Ʈ IP �ּ� : " + request.getRemoteAddr() +"<P>"%>
<%="Ŭ���̾�Ʈ URL : " + request.getRequestURL() +"<P>"%>
<%="���۹�� : " + request.getMethod() +"<P>"%>
<%="�������� �̸� : " + request.getProtocol() +"<P>"%>
<%="���� �̸� : " + request.getServerName() +"<P>"%>
<%="���� ��Ʈ ��ȣ : " + request.getServerPort() +"<P>"%>
</body>
</html>