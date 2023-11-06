<%@page import="userPkg.userBean"%>
<%@page import="userPkg.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	 
	userDao udao = userDao.getInstance(); 
	userBean ub  = udao.getUserInfo(id,passwd);   
	String viewPage;
	
	if(ub != null){
		String _id = ub.getId();
		if(_id.equals("admin")){ //관리자
			viewPage = request.getContextPath() + "/view/shop/manager/admin_mall.jsp";
		}else{//일반회원
			viewPage = request.getContextPath() +"/view/shop/user/mall.jsp";
		}
		session.setAttribute("id", id);
		session.setAttribute("memno", ub.getNo());
	}else{
		viewPage = request.getContextPath() +"/view/member/login/login_Form.jsp";%>
		
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다");
		</script>
	<%}%>

<script type="text/javascript">
	location.href = "<%=viewPage%>";
</script>