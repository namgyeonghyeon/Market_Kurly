<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); 
%>

<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
	BoardDao bdao = BoardDao.getInstance();
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	int cnt = bdao.replyArticle(bb);
	
	if (cnt == 1) {%>
		<script language="JavaScript">
		 alert("답글 추가 성공");
		 location.href="mall_review.jsp";
		</script>
	 <%}else{%>	 
		<script language="JavaScript">
		 alert("비밀번호가 맞지 않습니다");
		 history.go(-1);
		</script>
		<%
	 }
	%>
