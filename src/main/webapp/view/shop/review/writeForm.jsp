<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
  }}
</style>       

<script>
$(document).ready(function(){
	 
})
</script>

<%
String pageNum = request.getParameter("pageNum");
%>

<%@include file="review_mall_top.jsp"%>
<body>
	<form method="post" name="writeForm" action="writeProc.jsp" onsubmit="return writesave()">
		<table width="450" align="center">
			<tr>
				<th align="right" colspan="2">
					<a href="mall_review.jsp">리뷰목록</a>
				</th>
			</tr>
			<tr>
				<th width="150" align="center">이 름</th>
				<td width="300">
					<input type="text" name="writer" maxlength="10" value="<%=id%>">
				</td>
			</tr>
			<tr>
				<th width="150" align="center">제 목</th>
				<td width="300">
					<input type="text" name="subject" maxlength="50">
				</td>
			</tr>
			<tr>
				<th width="150" align="center">내 용</th>
				<td width="300">
					<textarea name="content" id="ta" rows="15" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th width="150" align="center">비밀번호</th>
				<td width="300">
					<input type="password" name="passwd" maxlength="10" value="1234">
				</td>
			</tr>
			<tr>
				<td width="300" colspan="2">
					<input type="submit" style = "margin-left: 250px" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onClick="location.href='mall_review.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
<%@include file="../../../mall_bottom.jsp"%>