<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%@page import="java.util.*"%>
<HTML>
	<HEAD>
	<link href="filegb.css" rel="stylesheet" type="text/css">
	<HEAD>
<BODY>
<CENTER>

<%
File board_file = new File("C:/jsp/write.txt");
String s=null;

try {   
  FileReader in1 = new FileReader(board_file); 
  BufferedReader in2 = new BufferedReader(in1); 

  while((s=in2.readLine()) != null) {
    out.println(s);
  }
  in2.close();
} catch(IOException e) {
  out.println(e.getMessage());
}

%>

<CENTER>
<A href=filegb_write_ex6.html>
         <img src="image/write.gif" width="54" height="19" border=0></A>
</CENTER>
</BODY>
</HTML>