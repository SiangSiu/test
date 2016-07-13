<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%
String infile = "C:/jsp/filerw.jsp";
String outfile = "C:/jsp/filerwcopy.txt";
int ch=0;
File inf=new File(infile);
File outf=new File(outfile);
FileReader filer = new FileReader(inf); 
FileWriter filew = new FileWriter(outf); 
try {   
 while ((ch = filer.read()) != -1) {
  filew.write(ch);
 }
 filer.close();
 filew.close();
} catch (IOException e) { 
 out.println(e.getMessage());
}
%>