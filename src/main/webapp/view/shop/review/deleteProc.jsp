<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteForm.jsp(num,passwd) => deleteProc.jsp<br>
<%
 request.setCharacterEncoding("UTF-8");
%>

<%
 int num = Integer.parseInt(request.getParameter("num"));
 String passwd = request.getParameter("passwd");
 int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
 BoardDao bdao = BoardDao.getInstance();
 int check = bdao.deleteArticle(num, passwd);  

 if (check == 1) {
	 int count = bdao.getArticleCount(); // 31=>30
	 // 필요한 페이지 수
	 int pageSize = 10; 
	 int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);  // pageSize:10 => 14:2 20:2
	if(pageCount<pageNum){
		response.sendRedirect("mall_review.jsp?pageNum=" + (pageNum-1)); 
	}else {
		response.sendRedirect("mall_review.jsp?pageNum=" + pageNum); 
	}
 }else{
%>	 
	<script language="JavaScript">
	 alert("비밀번호가 맞지 않습니다");
	 history.go(-1);
	</script>
	<%
 }
%>
