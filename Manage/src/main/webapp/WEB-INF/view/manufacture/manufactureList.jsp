<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제조사 목록</title>
</head>
<body>
	<a href="/">홈</a>
	<table border=1>
		<thead>
			<tr>
				<td>번호</td>
				<td>제조사</td>
				<td>제조물품</td>
			</tr>
		</thead>
		<tfoot></tfoot>
		<tbody>
			<c:forEach items="${manuList }" var="list" varStatus="status">
				<tr>
					<td>${list.MA_CODE }</td>
					<td>${list.MA_NAME }</td>
					<td>
						<c:choose>
							<c:when test="${list.MA_KINDS eq '400' }">핸드폰</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>