<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
body {
  padding:1.5em;
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 70%;
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
	BoardDao bdao = BoardDao.getInstance();
	int pageSize = 10; 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String pageNum = request.getParameter("pageNum"); 
	if(pageNum == null){
		pageNum = "1"; 
	}
	int currentPage = Integer.parseInt(pageNum);  
	int startRow = (currentPage-1) * pageSize + 1; 
	int endRow = currentPage * pageSize;
	
	int count = bdao.getArticleCount(); 
	int number = count - (currentPage-1) * pageSize; 
	ArrayList<BoardBean> articleLists = bdao.getArticles(startRow,endRow);
	
%>  
<%@include file="review_mall_top.jsp"%>
<body>
		<table width="700" style="margin: auto; margin-top: 50px;">
			<tr>
				<td align="right">
					<a href="writeForm.jsp">리뷰쓰기</a>
				</td>
			</tr>	
		</table>
		<% 
			if(count == 0){
		%>
				<table class="list" width="700" style="margin: auto;"> 
					<tr>
						<td align="center">
							등록된 리뷰가 없습니다.
						</td>
					</tr>	
				</table>
		<% 							
			}else{
		%>
			<table width="700" align="center">
				<tr align="left">
					<!-- <td width="50">번호</td> -->
					<th width="250">제목</th>
					<th width="100">작성자</th>
					<th width="150">작성일</th>
					<th width="50">조회</th>
				</tr>
				<%
				for(int i=0;i<articleLists.size();i++){
					BoardBean bb = articleLists.get(i);
					%>
					<tr>
						<td height="50px;">
							<%
								int wid = 0;
								if(bb.getRe_level()>0){
									wid = bb.getRe_level() * 20;
							%>
									<img src="images/level.gif" width="<%=wid %>">
									<img src="images/re.gif">
							<%									
								}else{ 
									
								}
							%>
						<a href = "content.jsp?num=<%=bb.getNum()%>&pageNum=<%=currentPage%>">
							<%=bb.getSubject() %>
							</a>
						<%if(bb.getReadcount() >= 10){ %>  
							<!-- <img src="images/hot.gif"> -->
						<%} %>
						</td>
						<td><%=bb.getWriter() %></td>
						<td><%=bb.getReg_date() %></td>
						<td><%=bb.getReadcount() %></td>
					</tr>
					<%
				}
				%>
			</table>
			<%}  %>
		<%
			if(count > 0){
				int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1); 
				int pageBlock = 5;	
				int startPage = ((currentPage-1)/pageBlock * pageBlock)+1;
				int endPage = startPage + pageBlock - 1;
				
				if(endPage > pageCount){ 
					endPage = pageCount;
				}
				if(startPage>5){
		%>
					<a href="review_mall.jsp?pageNum=<%=startPage-3 %>">[이전]</a>
		<%
				}
				for(int i=startPage;i<=endPage;i++){
		%>
					<a href="mall_review.jsp?pageNum=<%=i%>" style="margin-left: 800;">[<%=i%>]</a>
		<%				
				}
				if(endPage < pageCount){
		%>
					<a href="mall_review.jsp?pageNum=<%=startPage+3 %>">[다음]</a>
		<%					
				}
			}
		%>
</body>
<%@include file="../../../mall_bottom.jsp"%>