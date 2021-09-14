<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="<c:url value="/resources/css/login.css"/>" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="content">
		<div class="input-area">
			<h2>아이디로 로그인</h2>
			<form class="frm" method="post">
				<table>
					<tr>
						<td colspan="2"><input type="text" name="email" placeholder="아이디" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="email" placeholder="비밀번호" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="로그인" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="nav-area">
			<a href="#">비밀번호 재설정</a> <a href="#">계정 찾기</a>
		</div>
<!-- 		<div class="btn-area"> -->
<!-- 			<a href="/view/main.html"><i class="fas fa-angle-left fa-2x"></i>뒤로</a> -->
<!-- 		</div> -->
	</div>
</body>
</html>