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
	<!-- form태그 안에 form태그 사용 -->
	<form:form action="memberJoin" method="get" name="frm" id="frm"
		modelAttribute="memberCommand">
		<table border=1>
			<tr>
				<th>아이디</th>
				<!-- 아이디는 한글사용 불가능 : pattern -->
				<td>
					<form:input path="userId" id="userId" />
					<form:errors path="userId" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<form:password path="userPw" id="userPw" />
					<form:errors path="userPw" />
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<form:password path="userPwCon" id="userPwCon" />
					<form:errors path="userPwCon" />
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<form:input path="userName" id="userName" />
					<form:errors path="userName" />
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="date" name="userBirth" id="userBirth"
						placeholder="1999-12-12" />
					<!-- validator는 받아올 수 있음 -->
					<form:errors path="userBirth" /> 
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<form:radiobutton path="userGender" id="userGender" value="M"
						checked="checked" />
					남
					<form:radiobutton path="userGender" id="userGender" value="F" />
					여
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<form:input path="userEmail" id="userEmail" />
					<form:errors path="userEmail"/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<form:input path="userAddr" id="userAddr" />
					<form:errors path="userAddr"/>
				</td>
			</tr>
			<tr>
				<th>연락처1</th>
				<td>
					<form:input path="userPh1" id="userPh1"
						placeholder="123-123-1234, 123-1234-1234" />
					<form:errors path="userPh1"/>
				</td>
			</tr>
			<tr>
				<th>연락처2</th>
				<td>
					<form:input path="userPh2" id="userPh2"
						placeholder="123-123-1234, 123-1234-1234" />
					<form:errors path="userPh2"/>
				</td>
			</tr>
			<tr>
				<th>관심분야</th>
				<td>
					<input type="checkbox" name="interest" value="HTML" />
					HTML
					<input type="checkbox" name="interest" value="CSS" />
					CSS
					<input type="checkbox" name="interest" value="JSP" />
					JSP
					<form:errors path="interest"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="가입완료" />
					<input type="reset" value="다시 작성" />
					<input type="button" value="메인으로"
						onclick="javascript:location.href='../main'" />
				</th>
			</tr>
		</table>
	</form:form>
</body>
</html>