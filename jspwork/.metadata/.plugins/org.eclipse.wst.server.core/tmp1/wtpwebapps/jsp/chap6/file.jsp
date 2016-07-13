<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>

<%
String indir = "C:/jsp"; 
String infile = "temp.txt";
int i=0; 
File dir=new File(indir); 
File afile=null; 
File check=new File(indir,infile);
if (check.exists())
 out.println(indir+"경로에 "+infile+"파일이 존재합니다."); 
else // infile 변수 값의 파일명이 해당 경로에 없으면 다음 소스 출력
 out.println(indir+"경로에 "+infile+"파일은 없습니다."); 

out.println("<P>");

String [] dirlist = dir.list();
out.println("localhost 디렉토리에 있는 파일/폴더들<BR>"); 
out.println("<SELECT size=10>");
for(i=0;i<dirlist.length;i++) { 
 afile=new File(indir,dirlist[i]);
 out.print("<OPTION>"+dirlist[i]); 
 if (afile.isFile())  out.print("("+afile.length()+" Byte)");
 out.print("</OPTION>");  
}
out.println("</SELECT>");
%>