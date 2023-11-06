<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
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
  margin: auto;
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

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function del(){
		if($('input[name=passwd]').val() == ""){
			alert("비밀번호를 입력하세요.");
			$('input[name=passwd]').focus();
			return false;
		}
	}
</script>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>

<%@include file="review_mall_top.jsp"%>
<body>
<form method="post" action="deleteProc.jsp?pageNum=<%=pageNum %>" onSubmit="return del()">
	<table border="1">
		<tr><th>비밀번호를 입력해주세요.</th></tr>
		<tr>
			<td style="text-align: center;">
			비밀번호 : <input type="password" name="passwd">
			<input type="hidden" name="num" value="<%=num %>">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" style="margin-left: 280px" value="글삭제">
				<input type="button" value="글목록" onClick="location.href='mall_review.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
</form>
</body>
<%@include file="../../../mall_bottom.jsp"%>