<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="info" scope="request" class="key.user"/>

현재 값 : 
<jsp:getProperty name="info" property="name" />
<jsp:getProperty property="num" name="info"/>

<BR>
Form으로부터 설정된 값 : 
<jsp:setProperty name="info" property="name" />
<jsp:setProperty name="info" property="num" param="id"/>
<jsp:getProperty name="info" property="name" />
<jsp:getProperty name="info" property="num" />

<BR>
직접 설정한 값 : 
<jsp:setProperty name="info" property="name" value="모짜르트"/>
<jsp:setProperty name="info" property="num" value="123456"/>
<jsp:getProperty name="info" property="name" />
<jsp:getProperty name="info" property="num" />