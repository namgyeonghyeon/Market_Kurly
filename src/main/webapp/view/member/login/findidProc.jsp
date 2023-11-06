<%@page import="userPkg.userBean"%>
<%@page import="userPkg.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findidProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	userDao mdao = userDao.getInstance();
	userBean mb  = mdao.getMemberByNameAndEmail(name,email); 
	String viewPage;
	String id;
	if(mb != null){
		id = mb.getId();
	}else{
		id = "가입하지 않은 회원";
	}
	viewPage = "login_Form.jsp";
%>

<script type="text/javascript">
	alert("<%=id%>" + "입니다");
	location.href = "<%=viewPage%>";
</script>