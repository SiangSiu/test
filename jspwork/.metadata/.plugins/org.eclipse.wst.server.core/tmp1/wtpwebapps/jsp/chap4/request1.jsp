<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<B>request 객체 정보</B><P>

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