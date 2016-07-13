<%@ page contentType="text/html; charset=euc-kr"%> 
<%@ page import="java.io.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
String board_file = "C:/jsp/write.txt";
String email = null;
String old = null;
String s = null;
File infile = new File("C:/jsp/write.txt"); 
StringBuffer buf = new StringBuffer();
ArrayList aList = new ArrayList();
try{
   BufferedReader input=new BufferedReader(new FileReader(infile));
   while((old = input.readLine())!=null) {
       aList.add(old); 
    }
   input.close();          
  }catch(IOException e){
     out.println(e);
  }
  int aa = aList.size();
  int num=(aa/9)+1;

 
try {
  PrintWriter pw = new PrintWriter(new FileWriter(board_file, false));
  pw.println("<table border='0' width='600' cellspacing='0' cellpadding='2'>");
		  pw.println("<tr align='right'><td height='22'>&nbsp;</td></tr><tr align='center'>");
				  pw.println("<td height='1' bgcolor='#1F4F8F'></td></tr>");
				  pw.println("<tr align='center' bgcolor='#DFEDFF'><td class='button' bgcolor='#DFEDFF'>");
						  pw.println("<div align='left'><font size='2'>");
  pw.println(request.getParameter("subject"));
  pw.println ("</div></td></tr><tr align='center' bgcolor='#FFFFFF'>");
  pw.println("<td align='center' bgcolor='#F4F4F4'><table width='100%' border='0' cellpadding='0'cellspacing='4'>");
		  pw.println("<tr bgcolor='#F4F4F4'><td width='13%' height='7'></td><td width='38%' height='7'>글쓴이: ");
  pw.println(request.getParameter("name"));
  pw.println("</td><td width='38%' height='7'>E-mail: <A href=mailto:"+request.getParameter("email")+">");
  pw.println(request.getParameter("email"));
  pw.println("</a></td><td width='11%' height='7'></td></tr><tr bgcolor='#F4F4F4'><td width='13%'></td><td colspan=2>작성일: "
  +(new java.util.Date()).toLocaleString()
  +"</td><td width='11%'></td></tr></table></td></tr><tr align='center'><td bgcolor='#1F4F8F' height='1'></td></tr><tr align='center'><td style='padding:10 0 0 0'><div align='left'><br><font size='3' color='#333333'><PRE>");
  pw.println(request.getParameter("content"));
  pw.println("</PRE></div><br><br><div align='right'>");
  pw.println("<a href=filegb_modify(edit).jsp?Num="+num+">수정</a><a href=filegb_delete.jsp?Num="+num
	  +">삭제</a></div><div></div></td></tr><tr align='center'><td class='button' height='1'></td></tr><tr align='center'><td bgcolor='#1F4F8F' height='1'></td></tr></table>");
  
  for(int i=0; i < aList.size(); i++){
	pw.println(aList.get(i));
  }

  pw.close();
}catch(IOException e) {
  out.println(e.getMessage());
}
%>
<jsp:forward page="filegb_show_ex6.jsp" />