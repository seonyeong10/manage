<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="<c:url value="/resources/css/login.css"/>" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div id="content">
		<div class="input-area">
			<h2>아이디로 로그인</h2>
			<form class="frm" method="post" id="frm">
				<table>
					<tr>
						<td colspan="2"><input type="text" name="id" placeholder="아이디" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="pw" placeholder="비밀번호" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="로그인" onclick="login();"/></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="nav-area">
			<a href="#">비밀번호 재설정</a> <a href="#">계정 찾기</a> <a href="/login2/user">회원가입</a>
		</div>
<!-- 		<div class="btn-area"> -->
<!-- 			<a href="/view/main.html"><i class="fas fa-angle-left fa-2x"></i>뒤로</a> -->
<!-- 		</div> -->
	</div>
</body>
<script type="text/javascript">
	function login() {
		var params = $('#frm').serialize();
		
		$.ajax({
			type : "POST"
			,url : "/login2"
			,data : params
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				
				if(msg === 'success') {
					location.href="/";
				} else if(msg === 'noUser') {
					alert('사용자가 없습니다.');
				} else if(msg === 'noMatch') {
					alert('비밀번호가 일치하지 않습니다.');
				} 
			}
		});
	}
</script>
</html>