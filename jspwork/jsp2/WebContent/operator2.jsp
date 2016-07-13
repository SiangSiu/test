<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int a=5, b=10;
	boolean what;
	boolean c = true, d = false;
	
	out.print("a의 값은 : " + a + " b의 값은 : " + b + "<P>");
	out.print("a < b 의 값은 : " + (a<b) + "<P>");
	out.print("a <= b 의 값은 : " + (a<=b) + "<P>");
	out.print("a == b 의 값은 : " + (a==b) + "<P>");
	out.print("a > b 의 값은 : " + (a>b) + "<P>");
	out.print("a >= b 의 값은 : " + (a>=b) + "<P>");
	out.print("c의 값은 : " + c + " d의 값은 : " + d + "<P>");
	out.print("c && d 의 값은 : " +(c&&d) + "<P>");
	out.print("c || d 의 값은 : " +(c||d) + "<P>");
	
	what=a>b? true:false;
	out.print("a>b? " + what + ", !(a>b)=" + !what);
%>