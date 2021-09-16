<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 목록</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/list.css"/>" rel="stylesheet"
	type="text/css" />
</head>
<body>
<c:if test="${empty authInfo}">
<script type="text/javascript">location.href="/login"</script>
</c:if>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<form id="frm" onsubmit="return false;">
			<input type=hidden name="d_id" />
			<div class="section-title">부서 목록</div>
			
			<table border=1>
				<thead>
					<tr class="table-top">
						<td>부서명</td>
						<td>팀 이름</td>
						<td>비고</td>
					</tr>
				</thead>
				<tfoot></tfoot>
				<tbody>
					<c:forEach items="${list }" var="list" varStatus="status">
						<tr>
							<td>${list.D_NAME }</td>
							<td>${list.D_TIM }</td>
							<td>
								<c:if test="${authInfo.auth eq 'ADMIN' }">
								<button onclick="updateDept('${list.D_ID}');" class="small-btn">수정</button>
								<button onclick="deleteDept('${list.D_ID}');" class="small-btn">삭제</button>
								</c:if>
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
	
	// 삭제 버튼 클릭
	function deleteDept(d_id) {
		document.getElementsByTagName('input')[name='d_id'].value = d_id;
		
		frm.action = '/department/delete';
		frm.method = 'POST';
		frm.submit();
	}
	
	// 수정 버튼 클릭
	function updateDept(d_id) {
		document.getElementsByTagName('input')[name='d_id'].value = d_id;
		frm.action = '/department/info';
		frm.method = 'POST';
		frm.submit();
	}
	</script>
</body>
</html>