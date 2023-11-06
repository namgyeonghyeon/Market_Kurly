<%@page import="userPkg.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="ub" class="userPkg.userBean"/>
<jsp:setProperty property="*" name="ub"/>

<%
userDao udao = userDao.getInstance();
int cnt = udao.insertuser(ub);  
String msg,url;

if(cnt > 0){
	msg = "회원가입 성공";
	url = request.getContextPath()+"/view/member/login/login_Form.jsp";
}else{
	msg = "회원가입 실패";
	url = request.getContextPath()+"/view/member/register/register_Form.jsp";
}
System.out.print(request.getRequestURI());
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>