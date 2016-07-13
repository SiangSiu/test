<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
int num = Integer.parseInt(request.getParameter("Num"));
String board_file = "C:/jsp/write.txt";
String name = request.getParameter("name");
String email = request.getParameter("email");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
 
ArrayList aList = new ArrayList();

try{
 	File file = new File("C:/jsp/write.txt");
 	FileReader fr = new FileReader(file);
  	BufferedReader buffer = new BufferedReader(fr);
  	String str;
 	while((str=buffer.readLine()) != null){
  		aList.add(str);
	}
 	buffer.close();
 }catch(FileNotFoundException e){
  	out.println("<h3> 에러 : 파일을 찾을 수 없습니다.</h3>");
 }catch(IOException e2){
  	out.println("<h3> 에러 : 파일을 읽어오는 중에 에러가 발생했습니다. </h3>");
 }
	int a = aList.size();
	int startnum = a-(num*9);
	int lastnum = startnum+9;

String inputV[]={
		"<table border='0' width='600' cellspacing='0' cellpadding='2'><tr align='right'><td height='22'>&nbsp;</td></tr><tr align='center'><td height='1' bgcolor='#1F4F8F'></td></tr><tr align='center' bgcolor='#DFEDFF'><td class='button' bgcolor='#DFEDFF'><div align='left'><font size='2'>"
,request.getParameter("subject")
,"</div></td></tr><tr align='center' bgcolor='#FFFFFF'><td align='center' bgcolor='#F4F4F4'><table width='100%' border='0' cellpadding='0'cellspacing='4'><tr bgcolor='#F4F4F4'><td width='13%' height='7'></td><td width='38%' height='7'>글쓴이: "
,request.getParameter("name")
,"</td><td width='38%' height='7'>E-mail: <A href=mailto:"+request.getParameter("email")+">"
,request.getParameter("email")
,"</a></td><td width='11%' height='7'></td></tr><tr bgcolor='#F4F4F4'><td width='13%'></td><td colspan=2>작성일: "+(new java.util.Date()).toLocaleString()+"</td><td width='11%'></td></tr></table></td></tr><tr align='center'><td bgcolor='#1F4F8F' height='1'></td></tr><tr align='center'><td style='padding:10 0 0 0'><div align='left'><br><font size='3' color='#333333'><PRE>"
,request.getParameter("content")
,"</PRE></div><br><br><div align='right'><a href=filegb_modify(edit).jsp?Num="+num+">수정</a><a href=filegb_delete_ex6.jsp?Num="+num+">삭제</a></div><div></div></td></tr><tr align='center'><td class='button' height='1'></td></tr><tr align='center'><td bgcolor='#1F4F8F' height='1'></td></tr></table>"};	
try {
  int count = 0;
  PrintWriter pw = new PrintWriter(new FileWriter(board_file, false));
  for(int i=0; i < aList.size(); i++){
	if(i < lastnum && i >= startnum){
		pw.println(inputV[count]);
		count++;
	}else{
  		pw.println(aList.get(i));
	}
  }
  pw.close();
}catch(IOException e) {
  out.println(e.getMessage());
}
%>
<jsp:forward page="filegb_show_ex6.jsp" />