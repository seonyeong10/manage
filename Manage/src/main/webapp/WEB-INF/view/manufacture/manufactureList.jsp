<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제조사 목록</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/list.css"/>" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<form id="frm">
			<input type="hidden" name="ma_code" />
			<div class="section-title">제조사 조회</div>
			<table border=1>
				<thead>
					<tr class="table-top">
						<td>제조사 코드</td>
						<td>제조사</td>
						<td>제조물품</td>
						<td>비고</td>
					</tr>
				</thead>
				<tfoot></tfoot>
				<tbody>
					<c:forEach items="${manuList }" var="list" varStatus="status">
						<tr>
							<td>${list.MA_CODE }</td>
							<td>${list.MA_NAME }</td>
							<td><c:choose>
									<c:when test="${list.MA_KINDS eq '100' }">PC</c:when>
									<c:when test="${list.MA_KINDS eq '300' }">모니터</c:when>
									<c:when test="${list.MA_KINDS eq '400' }">핸드폰</c:when>
								</c:choose></td>
							<td>
								<button onclick="updateManu(${list.MA_CODE});">수정</button>
								<button onclick="deleteManu(${list.MA_CODE});">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
	var frm = document.getElementById('frm');
	var param = document.getElementsByTagName('input');
	
		// 제조사 수정
		function updateManu(ma_code) {
			param[name='ma_code'].value = ma_code;
			frm.action = "/manufacture/update";
			frm.method = "post"
			frm.submit();
		}
		
		// 제조사 삭제
		function deleteManu(ma_code) {
			param[name='ma_code'].value = ma_code;
			frm.action = "/manufacture/delete";
			frm.method = "post"
			frm.submit();
		}
	</script>
</body>
</html>