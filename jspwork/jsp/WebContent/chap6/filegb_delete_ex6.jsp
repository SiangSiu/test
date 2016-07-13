<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
int num = Integer.parseInt(request.getParameter("Num"));
String board_file = "C:/jsp/write.txt";
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
try {
  int count = a/9-1;
  PrintWriter pw = new PrintWriter(new FileWriter(board_file, false));
  for(int i=0; i < aList.size(); i++){
	if(i < startnum && (i+1)%9==0){
		pw.println("</PRE></div><br><br><div align='right'><a href=filegb_modify(edit).jsp?Num="+count
				+">수정</a> <a href=filegb_delete_ex6.jsp?Num="+count
				+">삭제</a></div><div></div></td></tr><tr align='center'><td class='button' height='1'></td></tr><tr align='center'><td bgcolor='#1F4F8F' height='1'></td></tr></table>");
		count--;
	}else if(i < lastnum && i >= startnum){
			
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