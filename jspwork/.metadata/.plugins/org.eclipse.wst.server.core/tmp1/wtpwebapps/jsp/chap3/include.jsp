<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	out.print("include 액션 호출 전입니다. <BR>");
%>

<jsp:include page="bottom.jsp" flush="false"/>

<%
	out.print("include 액션 호출 후입니다. <BR>");
%>