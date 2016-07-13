<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int year = 5;

	switch(year) {
	case 1:
	case 2:
	case 3:
		out.print("저학년이군요");
		break;
	case 4:
	case 5:
	case 6:
		out.print("고학년이군요");
		break;
	}
%>