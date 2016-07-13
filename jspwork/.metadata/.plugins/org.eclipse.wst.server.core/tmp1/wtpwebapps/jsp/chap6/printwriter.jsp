<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%    
String infile = "C:/jsp/bufrw.jsp";
String outfile ="C:/jsp/pwcopy.txt";
String strline=null;
FileReader filer = new FileReader(new File(infile));
FileWriter filew = new FileWriter(new File(outfile));
BufferedReader bufr =new BufferedReader(filer);
PrintWriter pw = new PrintWriter(filew);
try { 
 while ((strline = bufr.readLine()) != null) {
  pw.println(strline+"<BR>");
 }  
 pw.close();
} catch(IOException e) {
 out.println(e.getMessage());
}    
bufr =new BufferedReader(new FileReader(outfile));
try {   
 while ((strline = bufr.readLine()) != null) {
  out.println(strline);
 }  
 bufr.close();
} catch(IOException e) {
 out.println(e.getMessage());
}    
%>