<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- <c:if test="${empty authInfo}"> --%>
<form:form action="login" name="frm" method="post" id="frm" modelAttribute="loginCommand">
	<body>
		안뇽안뇽
		<br />
		<table border=1>
			<tr>
				<td>아이디</td>
				<td>
					<form:input path="loginId"/>
					<form:errors path="loginId" />
				</td>
				<td rowspan="2"><input type="image" src="" id="img" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="loginPw"/>
					<form:errors path="loginPw" />
				</td>
			</tr>
			<tr>
				<td colspan="3">아이디찾기 / 비밀번호 찾기 / <a href="#">회원가입</a></td>
			</tr>
		</table>
	</body>
</form:form>
<%-- </c:if > --%>
<%-- <c:if test="${!empty authInfo}"> --%>
내정보 | 로그아웃  | 회원리스트 | 공지사항 | 자료실 | 상품목록 | 설문조사 | 설문지 등록 | ajaxTest
<br />
<a href="add">사원등록</a> | 
<br />
<a href="openManufactureForm">제조사 등록</a> | 
<a href="getManufactureList">제조사 조회</a>
<br />
<a href="equipment">장비등록</a>
<%-- </c:if > --%>
</html>