<%@ page contentType="text/html; charset=EUC-KR"%> 
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ㅎ</title>
</head>
<body>
<% 
	String board_file = "C:/jsp/write.txt"; 
	String email=null;
	File check=new File(board_file); 
	
	if (!check.exists()){ 
		 FileWriter filew = new FileWriter(board_file);
		 filew.write("");
		 filew.close();
	}
	
	String old=null;
	File infile = new File(board_file);
	StringBuffer buf = new StringBuffer();
	try{
		BufferedReader input = new BufferedReader(new FileReader(infile));
		while((old = input.readLine())!=null) {
			buf.append(old+"\n");
		}
		input.close();
	}catch(IOException e){
		out.println(e);
	}
	
	old=buf.toString();
	buf.setLength(0);
	
	if (request.getParameter("email") != "") {
		 email = "<A href=mailto:" ;
		 email += request.getParameter("email") ;
		 email += ">" +  request.getParameter("email") ;
		 email += "</A>";
	}
	try {   
		PrintWriter pw = new PrintWriter(new FileWriter(board_file, false)); %>
		<table border='0' width='600' cellspacing='0' cellpadding='2'>
		<tr align='right'>
		<td height='22'>&nbsp;</td></tr>
		<tr align='center'>
		<td height='1' bgcolor='#1F4F8F'></td>
		</tr>
		<tr align='center' bgcolor='#DFEDFF'>
		<td class='button' bgcolor='#DFEDFF'>
		<% pw.println("<div align='left'><font size='2'>"+request.getParameter("subject")); %>
		</div></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		<td align='center' bgcolor='#F4F4F4'> 
		<table width='100%' border='0' cellpadding='0'cellspacing='4'>
		<tr bgcolor='#F4F4F4'>
		<td width='13%' height='7'></td>
		<% pw.println("<td width='38%' height='7'>글쓴이:" + request.getParameter("name") + "</td>");%>
		<% pw.println("<td width='38%' height='7'>E-mail: "+ email +"</td>");%>
		<td width='11%' height='7'></td>
		</tr>
		<tr bgcolor='#F4F4F4'>
		<td width='13%'></td>
		<% pw.println("<td colspan=2>작성일:" + (new java.util.Date()).toLocaleString() + "</td>"); %>
		<td width='11%'></td>
		</tr></table>
		</td></tr>
		<tr align='center'>
		<td bgcolor='#1F4F8F' height='1'></td>
		</tr>
		<tr align='center'>
		<td style='padding:10 0 0 0'>
		<div align='left'><br>
		<% pw.println("<font size='3' color='#333333'><PRE>"+request.getParameter("content"));%>
		</PRE></div>
		<br>
		</td></tr>
		<tr align='center'>
		<td class='button' height='1'></td>
		</tr>
		<tr align='center'>
		<td bgcolor='#1F4F8F' height='1'></td>
		</tr>
		</table> 
<% 		pw.println(old);
		pw.close();
	} catch(IOException e) {
		out.println(e.getMessage());
	}
%>
</body>
<jsp:forward page="filegb_show.jsp"/>