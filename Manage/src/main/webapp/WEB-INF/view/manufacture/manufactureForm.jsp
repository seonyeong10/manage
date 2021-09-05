<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제조사 등록</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<div class="section-title">장비 등록</div>
			<form action="insertManufacture" method="post" name="frm">
				<table>
					<tr>
						<td>제조사 코드</td>
						<td><input type="text" name="ma_code" /></td>
					</tr>
					<tr>
						<td>제조사 이름</td>
						<td><input type="text" name="ma_name" /></td>
					</tr>
					<tr>
						<td>제조물품</td>
						<td><input type="text" name="ma_kinds" /></td>
					</tr>
					<tr>
						<td colspan="2" class="btn-area"><input type="submit"
							value="등록" class="btn submit" />
							<button onclick="location.href='/'" class="btn">취소</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>