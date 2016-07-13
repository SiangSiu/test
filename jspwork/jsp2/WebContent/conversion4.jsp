<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	public float divide() {
		int a=10, b=5, c;
		c=a/b;
		
		return c;
	}
%>

<%= "divide() 메서드의 호출 결과는 : " + divide() %>