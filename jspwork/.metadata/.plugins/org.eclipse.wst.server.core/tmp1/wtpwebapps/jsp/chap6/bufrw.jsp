<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%
String infile = "C:/jsp/bufrw.jsp";
String outfile ="C:/jsp/bufrwcopy.txt";
String strline=null;
FileReader filer = new FileReader(new File(infile));
FileWriter filew = new FileWriter(new File(outfile));
BufferedReader bufr =new BufferedReader(filer);
BufferedWriter bufw = new  BufferedWriter(filew);
try {   
 while ((strline = bufr.readLine()) != null) {
  strline = strline+"<BR>";
  bufw.write(strline,0,strline.length());
  bufw.newLine();
 }
 bufw.close();
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