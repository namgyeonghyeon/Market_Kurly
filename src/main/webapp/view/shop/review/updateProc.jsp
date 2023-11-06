<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String passwd = request.getParameter("passwd");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	int check = bdao.updateArticle(writer, subject,content, num, passwd); 
	 
	if (check == 1) {
		 int count = bdao.getArticleCount();
		 int pageSize = 10; 
		 int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
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