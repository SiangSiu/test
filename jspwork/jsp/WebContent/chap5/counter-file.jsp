<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.io.*" %>
    <jsp:useBean id="cnt" scope="application" class="key.counter"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</title>
</head>
<body>
<%
	int count=0;
	session=request.getSession();
	session.setMaxInactiveInterval(1);
	String first=(String)session.getValue("checkfirst");
	
	String count_file = "c:/jsp/chap5/count.txt";
	if(cnt.getCount()==0){
		int j=0;
		String old=null;
		File infile = new File(count_file);
		try{
			if(infile.exists()){
				BufferedReader input=new BufferedReader(new FileReader(infile));
				if((old=input.readLine())!=null) {
					int i = Integer.parseInt(old);
					for(j=0; j<i; j++){
						cnt.setCount();
					}
					input.close();
				}
			}
		}catch(IOException e){
			out.println(e.getMessage());
		}
	}
	if(first != null) {
		count = cnt.getCount();
	} else {
		cnt.setCount();
		count = cnt.getCount();
		session.putValue("checkfirst", "first");
	}
	if(count % 10 == 0){
		try{
			count_file = "c:/jsp/chap5/count.txt";
			PrintWriter pw = new PrintWriter(new FileWriter(count_file));
			pw.println(count);
			pw.close();
		} catch(IOException e) {
			out.println(e.getMessage());
		}
	}
	out.println("현재까지 방문자 수 : " + count);
%>
</body>
</html>