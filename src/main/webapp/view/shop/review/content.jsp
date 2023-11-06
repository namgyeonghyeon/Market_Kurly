<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css" type="text/css">

<%
request.setCharacterEncoding("UTF-8"); 
%>

<style type="text/css">
body {
  padding:1.5em;
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 40%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
</style>   

<%
	int num =Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb= bdao.getArticle(num); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%@include file="review_mall_top.jsp"%>
<body>
<table width="500" align="center" style="margin-top: 100px;">
	<tr>
		<th align="center" width="125">글번호</th>
		<td align="center" width="125" ><%=bb.getNum() %></td>
		<th align="center" width="125">조회수</th>
		<td align="center" width="125"><%=bb.getReadcount() %></td>
	</tr>
	<tr>
		<th align="center" width="125">작성자</th>
		<td align="center" width="125"><%=bb.getWriter() %></td>
		<th align="center" width="125">작성일</th>
		<td align="center" width="125"><%= sdf.format(bb.getReg_date()) %></td>
	</tr>
	<tr>
   		<th align="center" width="125">글제목</th>
   		<td width="375"colspan=3 ><%= bb.getSubject() %></td>
   	</tr>
   	
   	<tr>
   		<th align="center" width="125">글내용</th>
   		<td align="left" width="375" height = "100" colspan=3><%= bb.getContent() %></td>
   	</tr>
   	<tr>
   		<td colspan="4">
   			<input type="button" value="글수정" style="margin-left: 220px;" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'" >
			<input type="button" value="답글쓰기" onclick="location.href='replyForm.jsp?ref=<%=bb.getRef()%>&re_step=<%=bb.getRe_step()%>&re_level=<%=bb.getRe_level()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글목록" onClick="location.href='mall_review.jsp?pageNum=<%=pageNum%>'">
   		</td>
   	</tr>
</table>
</body>
<%@include file="../../../mall_bottom.jsp"%>