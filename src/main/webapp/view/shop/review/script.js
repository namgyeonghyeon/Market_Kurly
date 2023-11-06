
function writesave(){
		if($("input[name = writer]").val() == ""){
			$("input[name = writer]").focus();
			alert("이름을 입력하세요");
			return false;
		}
		if($("input[name = subject]").val() == ""){
			$("input[name = subject]").focus();
			alert("제목을 입력하세요");
			return false;
		}
		if($("input[name = email]").val() == ""){
			$("input[name = email]").focus();
			alert("이메일을 입력하세요");
			return false;
		}
		if($("textarea[name = content]").val() == ""){
			$("textarea[name = content]").focus();
			alert("내용을 입력하세요");
			return false;
		}
		if($("input[name = passwd]").val() == ""){
			$("input[name = passwd]").focus();
			alert("비밀번호를 입력하세요");
			return false;
		}
} 
