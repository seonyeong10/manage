<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userForm.jsp</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

function checkParam() {
	var param = document.getElementsByTagName('input');
	
	if(param[name="id"].value == '' || param[name="id"].value == null) {
		alert('아이디를 입력하세요.');
		param[name="id"].focus();
		return false;
	} else if(param[name="checkidCheck"].value == '' || param[name="checkidCheck"].value == null) {
		alert('아이디 중복확인을 하세요.');
		return false;
	} else if(param[name="pw"].value == '' || param[name="pw"].value == null) {
		alert('비밀번호 입력하세요.');
		param[name="pw"].focus();
		return false;
	} else if(param[name="pwPatternCk"].value == '' || param[name="pwPatternCk"].value == '') {
		alert('비밀번호 형식이 올바르지 않습니다.');
		return false;
	} else if(param[name="pwtwo"].value == '' || param[name="pwtwo"].value == null) {
		alert('비밀번호 확인을 진행하세요.');
		param[name="pwtwo"].focus();
		return false;
	} else if(param[name="pw"].value != param[name="pwtwo"].value) {
		alert('비밀번호가 일치하지 않습니다.');
		param[name="pwtwo"].focus();
		return false;
	}  else if(param[name="m_code"].value == '' || param[name="m_code"].value == null ) {
		alert('사원정보를 선택 하세요.');
		param[name="m_code"].focus();
		return false;
	}  

}
	
	
	
	function idCheck() {
		var id = document.getElementsByTagName('input')[name = 'id'].value;
		
		// 입력 값 확인
		if (id == '' || id == null) {
			alert('아이디를 입력하세요.');
			document.getElementsByTagName('input')[name = 'id'].focus();
			return;
		}

		$.ajax({
			type : "post",
			url : "/userinfo/idCheck",
			data : {
				"id" : id
			},
			dataType : "json",
			error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : "
						+ request.responseText);
				//				alert('error');
			},
			success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				var cnt = responseText.cnt;
				var input = document.getElementsByTagName('input');

				if (msg === 'success' && cnt > 0) {
					alert('이미 등록된 아이디입니다.');
				} else if (msg === 'success' && cnt == 0) {
					input[name = 'checkidCheck'].value = 'true';
					alert('등록 가능한 아이디 입니다.');
				}
			}
		});
	}
	
	function pwCheck(){
		var password = document.getElementById('pw');
		var passwordCheck = document.getElementById('pwtwo');
		var confirmMsg = document.getElementById('checkmsg');
		console.log(password);
		console.log(passwordCheck);
		
		var wrongColor ="#ff0000";
		
		if(password.value == passwordCheck.value){
			checkmsg.innerHTML ="비밀번호 일치";
		}else{
			checkmsg.innerHTML ="비밀번호 불일치";
		}
		
	}
	
	function memList(){
		window.open('/userinfo/userMem');
	}
	
	function patternPw(){
		
		var param = document.getElementsByTagName('input');
		console.log(param[name="pw"].value)
		if(!pwPattern.test(param[name="pw"].value)) {
			document.getElementById('password-err').innerText = '최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자로 형식으로 입력해 주세요.';
		} else {
			document.getElementById('password-err').innerText = '';
			param[name="pwPatternCk"].value = 'true';
		}
		
	}
	
	
	
</script>



</head>
<body>
 <%@ include file="../include/top.jsp"%>
	<div id="content">
	<%@ include file="../include/left.jsp"%>
		<div id="right">
			<div class="section-title">회원가입</div>
			<form action="addUser" method="post" onsubmit="return checkParam();">
			<input type="hidden" name="checkidCheck" value=""/>
			<input type="hidden" name="pwPatternCk" value=""/>
				<table border=1>
					<tr>
						<th>아이디</th>
						<td>
						<input type="text" name="id" class="not-duplicate"/>
						<input type="button" value="중복검사" onclick="idCheck();" style="float: right">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
						<input type="password" id="pw" name="pw" onchange="patternPw()" style="width: 90%; line-height: 40px; font-size: 20px; border: none"/>
						<div style="height: 16px"><span id="password-err" style="font-size: 2px; color: gray; float: right" > </span></div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
						<input type="password" id="pwtwo" name="pwtwo" onkeyup="pwCheck()" style="width: 90%; line-height: 40px; font-size: 20px; border: none"/>
						<div style="height: 14px"><span id="checkmsg" style="font-size: 2px; color: gray; float: right"></span></div>
						</td>
					</tr>
					<tr>
						<th>사원 번호</th>
						<td><input type="text" id="parent_code" name="code" class="not-duplicate" readonly="readonly"/><input type="button" value="사원조회" onclick="memList()" style="float: right"></td>
					</tr>
					<tr >
						<th colspan="2" class="btn-area">
						<input type="submit" value="등록"  class="btn submit"/>
						<input type="button" value="홈으로" onclick="javascript: location.href='/';" class="btn"/>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>