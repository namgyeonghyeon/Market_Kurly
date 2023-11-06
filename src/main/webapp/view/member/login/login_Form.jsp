<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
<script type="text/javascript" src="../../../js/jquery.js"></script> 
<script type="text/javascript">
function check(){
	if($("input[name = 'id']").val() == ""){
		$("input[name = 'id']").focus();
		alert("아이디를 입력하세요");
		return false;
	}
	if($("input[name = 'passwd']").val() == ""){
		$("input[name = 'passwd	']").focus();
		alert("비밀번호를 입력하세요");
		return false;
	}
}; 
</script>

<%@ include file="../../../mall_top.jsp"%>  
	<body>
		<div class="body-container">
			<div class="body-title">
				<h2 style="margin-left: 250px; margin-bottom: 10px;">로그인</h2>
			</div>
	
			<form method="post" action="login_Proc.jsp">
				<table class="table-form table-size">
					<tr>
						<td><input type="text" name="id" id="userId"
							maxlength="10" class="form-control" style="width: 40%; height: 40px;" placeholder ="아이디를 입력해주세요">
					</tr>
					<tr>
						<td><input type="password" name="passwd" maxlength="10"
							class="form-control" style="width: 40%; height: 40px;" placeholder="비밀번호를 입력해주세요"></td>
					</tr>
				</table>
				<div class="font1">
					<a href="findid.jsp">
					아이디 찾기 
				</a> |
					<a href="findpassword.jsp">
						비밀번호 찾기 
					</a>
				</div>
				<table class="table">
					<tr>
						<td align="center">
							<button type="submit" class="loginbtn"
								onclick="return check();">로그인</button>
						</td>
					</tr>
					<tr>
						<td align="center">
							<button type="button" class="purbtn"
								onclick="location.href='../register/register_Form.jsp'">회원가입</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
<%@ include file="../../../mall_bottom.jsp"%>