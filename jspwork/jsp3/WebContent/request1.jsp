<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<B>request 객체정보</B><P>

<%="인코딩 방식 : " + request.getCharacterEncoding() + "<P>" %>
<%="MIME 타입 : " + request.getContentType()+"<P>"%>
<%="요청정보 길이 : " +request.getContentLength()+"<P>"%>
<%="헤더 이름 : " + request.getHeaderNames()+"<P>"%>
<%="웹 전달 경로 : " +request.getPathInfo()+"<P>"%>
<%="클라이언트 이름 : " + request.getRemoteHost()+"<P>"%>
<%="클라이언트 IP 주소 : " + request.getRemoteAddr() +"<P>"%>
<%="클라이언트 URL : " + request.getRequestURL() +"<P>"%>
<%="전송방식 : " + request.getMethod() +"<P>"%>
<%="프로토콜 이름 : " + request.getProtocol() +"<P>"%>
<%="서버 이름 : " + request.getServerName() +"<P>"%>
<%="서버 포트 번호 : " + request.getServerPort() +"<P>"%>
</body>
</html>