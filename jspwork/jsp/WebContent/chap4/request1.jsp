<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<B>request ��ü ����</B><P>

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