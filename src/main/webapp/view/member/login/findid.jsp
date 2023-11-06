<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
* {
	padding: 0;
	margin: 0;
}

body {
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 14px;
	color: #222;
}

a {
	color: #222;
	text-decoration: none;
	cursor: pointer;
}

a:active, a:hover {
	color: #f28011;
	text-decoration: underline;
}

.purbtn {
	border: 1px solid #5F0080;
	color: #5F0080;
	font-weight: bold; background-color : white; width : 100px;
	height: 60px;
	width: 331px;
	background-color: white;
	margin-top: 10px;
	margin-right: 424px;
}

.loginbtn{
	color: white;
	font-weight: bold;
	height: 60px;
	width: 331px;
	background-color: #5F0080;
	margin-top: 30px;
	margin-right: 424px;
}
.form-control {
	border: 1px solid #999;
	border-radius: 4px;
	background-color: #fff;
	padding: 5px 5px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	height: 30px;
	margin-left: 120px;
}

.form-control[readonly] {
	background-color: #f8f9fa;
}

textarea.form-control {
	height: 170px;
	resize: none;
}

.form-select {
	border: 1px solid #999;
	border-radius: 4px;
	background-color: #fff;
	padding: 4px 5px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	height: 40px;
}

.table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

/* container */
.body-container {
	width: 1000px;
	margin: 40px 550px 10px;
	margin-top: 80px;
}
.table-size{
	width: 80%;
	height: 50px;
}

.table-form td {
	padding: 15px 0;
	
}

.table-form tr td:first-child {
	font-weight: bold;
}

.msg-box {
	text-align: center;
	color: blue;
}
.font1{
	font-size: 12px;
	font-style: inherit;   
	margin-left: 300px;
}
</style>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%@ include file="../../../mall_top.jsp"%>  
	<body>
		<div class="body-container">
			<div class="body-title">
				<h2 style="margin-left: 230px; margin-bottom: 10px;">아이디 찾기</h2>
			</div>
	
			<form method="post" action="findidProc.jsp">
				<table class="table-form table-size">
					<tr>
						<td><input type="text" name="name" id="userId"
							maxlength="10" class="form-control" style="width: 40%; height: 40px;" placeholder ="이름을 입력해주세요">
					</tr>
					<tr>
						<td><input type="text" name="email" maxlength="10"
							class="form-control" style="width: 40%; height: 40px;" placeholder="이메일을 입력해주세요"></td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td align="center">
							<button type="submit" class="loginbtn">아이디 찾기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
<%@ include file="../../../mall_bottom.jsp"%>