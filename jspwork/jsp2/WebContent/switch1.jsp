<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int score  = 96;
	char grade;
	
	switch (score/10) {
	case 10:
	case 9:
		grade = 'A';
		out.println("������ : " + score + " �̰� ������ : " + grade);
		break;
	case 8:
		grade = 'B';
		out.println("������ : " + score + " �̰� ������ : " + grade);
		break;
	case 7:
		grade = 'C';
		out.println("������ : " + score + " �̰� ������ : " + grade);
		break;
	case 6:
		grade = 'D';
		out.println("������ : " + score + " �̰� ������ : " + grade);
		break;
	default:
		grade = 'F';
		out.println("������ : " + score + " �̰� ������ : " + grade);
		
	
	
	}

%>