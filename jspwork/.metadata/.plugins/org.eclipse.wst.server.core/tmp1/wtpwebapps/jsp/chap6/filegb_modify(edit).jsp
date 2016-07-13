<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<% 
 int num = Integer.parseInt(request.getParameter("Num"));
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
%>

<HTML>
<HEAD>
<SCRIPT language="javascript">
function check() 
{
  with(document.filegbwrite){
	
    if(subject.value.length == 0){
      alert("제목을 입력해 주세요!!");
      subject.focus();
      return false;
    }
		
    if(name.value.length == 0){
      alert("이름을 입력해 주세요!!");
      name.focus();
      return false;
    }
		
    if(content.value.length == 0){
      alert("내용을 입력해주세요!!");
      content.focus();
      return false;
    }
		
    document.filegbwrite.submit();
  }
}
</SCRIPT> 
<link href="filegb.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</HEAD>

<BODY>
<FORM name=filegbwrite method=post action="filegb_modify.jsp">
<CENTER>
<table width="600" cellspacing="0" cellpadding="2">
<tr> 
<td colspan="2" bgcolor="#1F4F8F" height="1"></td>
</tr>
<tr> 
<td colspan="2" bgcolor="#DFEDFF" height="20"  class="style1">&nbsp;&nbsp;글 쓰 기</td>
</tr>
<tr> 
<td colspan="2" bgcolor="#1F4F8F" height="1"></td>
</tr>
<tr> 
<td width="124" bgcolor="#f4f4f4" class="style2"> 
<div align="center">이 름</div>
</td>
<td width="494" > 
<input type=text name=name class="input_style1" value="<%=aList.get(startnum+1)%>">
</td></tr>
<tr> 
<td colspan="2" bgcolor="#dddddd" height="1"></td>
</tr>
<tr> 
<td width="124"  bgcolor="#f4f4f4" class="style2"> 
<div align="center">E-mail</div>
</td>
<td width="494" height="25"> 
<input type=text name=email class="input_style1" value="<%=aList.get(startnum+5)%>">
</td></tr>
<tr> 
<td colspan="2" bgcolor="#dddddd" height="1"></td>
</tr>
<tr> 
<td width="124"  bgcolor="#f4f4f4" class="style2"> 
<div align="center">제 목</div>
</td>
<td width="494" height="25"> 
<input type=text name=subject size="60" maxlength="60" class="input_style2" value="<%=aList.get(startnum+3)%>">
</td></tr>
<tr> 
<td colspan="2" bgcolor="#dddddd" height="1"></td>
</tr>
<tr> 
<td width="124" height="162" bgcolor="#f4f4f4" style="padding-top:5px;" valign="top" class="style2"> 
<div align="center">내 용</div>
</td>
<td width="494" valign="top"> 
<textarea cols="65" rows="10" name=content maxlength="2000" class="textarea_style1"> <%=aList.get(startnum+7)%></textarea>
</td></tr>
<tr> 
<td colspan="2" height="1"></td>
</tr>
<tr> 
<td colspan="2" height="1" bgcolor="#1F4F8F"></td>
</tr>
<tr> 
<td colspan="2" height="10"></td>
</tr>
<tr> 
<td colspan="2" align="right"> 
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr> 
<td width="28%">&nbsp;</td>
<td width="51%">&nbsp;</td>
<td width="12%"><a href="filegb_show_ex6.jsp"><img src="image/cancle.gif" width="46" height="20" border="0"></td>
<td width="9%"><a href="#" onClick="check(this.form);"><img src="image/ok.gif" width="46" height="20" border="0"></a></td>
</tr></table>
</td></tr>
</table>
<input type=hidden name=Num size="60" maxlength="60" value="<%=num%>">
</FORM>
</BODY>
</HTML>l>