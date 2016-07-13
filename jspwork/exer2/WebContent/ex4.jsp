<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	for(int i=0; i<10; i++) {
		for(int j=0; j<=i; j++){
			out.print("*");
		}
		out.println("<BR>");
		
	}

%>