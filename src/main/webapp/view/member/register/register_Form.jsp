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
	height: 40px;
	width: 120px;
	background-color: white;
	margin-left: 10px;
}

.registerbtn{
	color: white;
	font-weight: bold;
	height: 60px;
	width: 250px;
	background-color: #5F0080;
	margin-top: 30px;
	margin-right: 900px;
}
.form-control {
	border: 1px solid #999;
	border-radius: 4px;
	background-color: #fff;
	padding: 5px 5px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	height: 30px;
	margin-left: 10px;
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

.body-container {
	width: 1500px;
	margin: 40px 550px 10px;
}

.table-form{
	width: 50%
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
</style>
<script type="text/javascript" src="../../../js/jquery.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	var isBlank = false;
	var use;
	var isCheck = false;
	var pwuse;
	
	$('#id_check').click(function(){
		isCheck = true;
		if($('input[name="id"]').val()==""){
			alert("아이디를 입력하세요");
			isBlank = true;
			return;	
		}
		isBlank = false;
		
		$.ajax({
				url : "id_check_proc.jsp",
				data : ({
						id : $('input[name="id"]').val()
				}),
				success : function(data){
					if(jQuery.trim(data)=='YES'){
						$('#idmessage').html("<font color=blue>사용 가능합니다</font>");
						$('#idmessage').show();
						use = "possible";
					}else{
						$('#idmessage').html("<font color=red>사용중인 아이디</font>");
						$('#idmessage').show();
						use = "impossible";
					}
				}	
		});
	}); 
	$('#sub').click(function(){
		if($("input[name = 'passwd']").val() == ""){
			$("input[name = 'passwd']").focus();
			alert("비밀번호를 입력하세요");
			return false;
		}
		if($("input[name = 'passwdcheck']").val() == ""){
			$("input[name = 'passwdcheck']").focus();
			alert("비밀번호 확인을 입력하세요");
			return false;
		}
		if($("input[name = 'name']").val() == ""){
			$("input[name = 'name']").focus();
			alert("이름을 입력하세요");
			return false;
		}
		if($("input[name = 'email']").val() == ""){
			$("input[name = 'email']").focus();
			alert("이메일을 입력하세요");
			return false;
		}
		if($("select[name = 'tel1']").val() == ""){
			$("input[name = 'tel1']").focus();
			alert("핸드폰번호를 입력하세요");
			return false;
		}
		if($("input[name = 'tel2']").val().length != 4){
			$("input[name = 'tel2']").focus();
			alert("핸드폰번호를 4자리로 입력하세요");
			return false;
		}
		if($("input[name = 'tel3']").val().length != 4){
			$("input[name = 'tel3']").focus();
			alert("핸드폰번호를 4자리로 입력하세요");
			return false;
		}
	})
}); 
function passwdcheck_keyup(){
	if($('input[name="passwd"]').val()== $('input[name="passwdcheck"]').val()){
		$('#pwmessage').html("<font color = blue>비번 일치</font>");
		pwuse = "same";
	}else{
		$('#pwmessage').html("<font color = red>비번 불일치</font>");
		pwuse = "nosame";
	}
}
function passwdcheck(){
	pvalue = $('input[name="password"]').val();
	var regexp = /^[a-z0-9]{3,8}$/;
	if(pvalue.search(regexp) == -1){
		alert('길이는 3~8글자로 입력하세요');
		return false;
	}
	
	var chk_eng = pvalue.search(/[a-z]/i); //i는 대문자도 포함하게함
	var chk_num = pvalue.search(/[0-9]/);
	
	if(chk_eng < 0 || chk_num < 0){
		alert('영문 영소문자/숫자 조합이 아닙니다');
		return false;
	}
}
</script>
</head>
<%@ include file="../../../mall_top.jsp"%>  
	<body>
		<div class="body-container">
			<div class="body-title">
				<h1 style="margin-left: 250px; margin-bottom: 30px;">회원 가입</h1>
				<h5 style="margin-left: 520px; margin-bottom: 10px;">
					<font color="red">* </font><b style="color: gray">필수입력사항</b>
				</h5>
				<hr width="640px" style="height: 2px; background-color: black;">
			</div>
	
			<form method="post" action="register_Proc.jsp" style="margin-left: 20px; margin-top: 20px;">
				<table class="table-form">
					<tr>
						<td>아&nbsp;이&nbsp;디 <font color="red">*</font></td>
						<td><input type="text" name="id" id="userId"
							maxlength="10" class="form-control" style="width: 50%;" placeholder ="아이디를 입력해주세요">
							<input type="button" value="중복확인" class="purbtn" id = "id_check" style="cursor: pointer;">
							<span id = "idmessage" style="display: none;"></span>
						</td>
					</tr>
					<tr>
						<td>패스워드 <font color="red">*</font></td>
						<td><input type="password" name="passwd" maxlength="10"
							class="form-control" style="width: 50%;" placeholder="비밀번호를 입력해주세요"></td>
					</tr>
					<tr>
						<td>패스워드 확인 <font color="red">*</font></td>
						<td><input type="password" name="passwdcheck" onkeyup="passwdcheck_keyup()"
							class="form-control" maxlength="10" style="width: 50%;" placeholder = "비밀번호를 한번 더 입력해주세요">
							<span id ="pwmessage"></span>
						</td>
					</tr>
					<tr>
						<td>이&nbsp;&nbsp;&nbsp;&nbsp;름 <font color="red">*</font></td>
						<td><input type="text" name="name" maxlength="20"
							class="form-control" style="width: 50%;" placeholder = "이름을 입력해주세요"></td>
					</tr>
					<tr>
						<td>이 메 일 <font color="red">*</font></td>
						<td>
						<input type="text" name="email" maxlength="30" class="form-control" style="width: 50%;" placeholder = "marketkorly@korly.com">
					</tr>
					<tr>
						<td>휴대폰 <font color="red">*</font></td>
						<td><select name="tel1" class="form-select" style="width: 20%">
								<option value="">선 택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="02">02</option>
								<option value="070">070</option>
								<option value="031">031</option>
						</select>
						<input type="text" name="tel2" maxlength="4" class="form-control" style="width: 20%;">
						<input type="text" name="tel3" maxlength="4" class="form-control" style="width: 20%;"></td>
					</tr>
					<tr>
						<td>직&nbsp;&nbsp;&nbsp;&nbsp;업</td>
						<td>
							<input type="text" name="job" maxlength="10"
								class="form-control" style="width: 50%;" placeholder = "직업을 입력해주세요">
						</td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td align="center">
							<button type="submit" class="registerbtn" id = "sub">가입하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
	</html>
<%@ include file="../../../mall_bottom.jsp"%>