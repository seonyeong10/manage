<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberForm.jsp</title>
</head>
<body>
	<form action="addMember" method="post" modelAttribute="memberCommand">
		<table border=1>
			<tr>
				<th>사번</th>
				<td><input type="text" name="code"/></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="m_name"/></td>
			</tr>
			<tr>
				<th>부서</th>
				<td><input type="text" name="m_depart"/></td>
			</tr>
			<tr>
				<th>직책</th>
				<td><input type="text" name="m_job"/></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="m_age"/></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input type="text" name="m_phone"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="m_email"/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="m_address"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="m_gender" value="M"/>남
					<input type="radio" name="m_gender" value="F"/>여
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록"/>
					<input type="button" value="홈으로" onclick="javascript: location.href='main';"/>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>