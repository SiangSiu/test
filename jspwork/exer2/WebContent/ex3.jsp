<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int sum=0;
	for(int i=1; i<=100; i++) {
		if(i%5!=0){
			continue;
		}
		sum+=i;
	}
	out.println("1에서부터 100까지의 5의 배수의 합은 : " + sum);
%>
