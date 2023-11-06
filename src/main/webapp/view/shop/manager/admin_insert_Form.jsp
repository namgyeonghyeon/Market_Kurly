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
function check(){
	
}; 
</script>
</head>
<%@ include file="admin_mall_top.jsp"%>  
	<body>
		<div class="body-container">
			<div class="body-title">
				<h1 style="margin-left: 250px; margin-bottom: 30px;">상품 등록</h1>
				<h5 style="margin-left: 560px; margin-bottom: 10px;">
					<font color="red">* </font><b style="color: gray">필수입력사항</b>
				</h5>
				<hr width="640px" style="height: 2px; background-color: black;">
			</div>
	
			<form method="post" action="admin_insert_Proc.jsp" enctype="multipart/form-data" style="margin-left: 20px; margin-top: 20px;">
				<table class="table-form"> 	
					<tr>
						<td>제 목 <font color="red">*</font></td>
						<td><input type="text" name="ptitle" id="userId"
							class="form-control" style="width: 50%;" placeholder ="제목 입력해주세요">
					</tr>
	
					<tr>
						<td>사진 <font color="red">*</font></td>
						<td><input type="file" name="proimg" style="margin-left: 10px;"></td>
					</tr>
	
					<tr>
						<td>상품 이름 <font color="red">*</font></td>
						<td><input type="text" name="pname"
							class="form-control" style="width: 50%;" placeholder = "상품이름을 입력해주세요"></td>
					</tr>
	
					<tr>
						<td>가격 <font color="red">*</font></td>
						<td><input type="text" name="price" maxlength="10"
							class="form-control" style="width: 50%;" placeholder = "가격을 입력해주세요"></td>
					</tr>
	
					<tr>
						<td>수량<font color="red">*</font></td>
						<td>
						<input type="text" name="count" maxlength="3" class="form-control" style="width: 50%;" placeholder = "수량을 입력해주세요">
					</tr>
	
					<tr>
						<td>포장타입<font color="red">*</font></td>
						<td><select name="packaging" class="form-select" style="width: 20%; margin-left: 10px;">
								<option value="">선 택</option>
								<option value="냉장">실온</option>
								<option value="냉장">냉장</option>
								<option value="냉동">냉동</option>
						</select></td>
					</tr>
					<tr>
						<td>원산지<font color="red">*</font></td>
						<td>
						<input type="text" name="origin" maxlength="3" class="form-control" style="width: 50%;" placeholder = "원산지를 입력해주세요">
					</tr>
				</table>
	
				<table class="table">
					<tr>
						<td align="center">
							<button type="submit" class="registerbtn"
								onclick="return check();">상품 등록</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
	</html>
<%@ include file="../../../mall_bottom.jsp"%>