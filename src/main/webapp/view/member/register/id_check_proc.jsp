<%@page import="userPkg.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%userDao mdao = userDao.getInstance(); %> 

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");

boolean isCheck = mdao.searchId(id);  
String str = "";

if(isCheck){
	str = "NO";
	out.print(str);//ajax로 요청한쪽으로 str을 보내는 역할
}else{
	str = "YES";
	out.print(str);
}
%>