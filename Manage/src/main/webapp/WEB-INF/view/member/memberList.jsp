<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberForm.jsp</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/list.css"/>" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>
		<div id="right">
			
			<div style="width:930px; overflow: auto; position:absolute; left:50%; transform:translateX(-50%);">
			<div class="section-title">사원 목록</div>
			<div>
			<table border=1 id="employee" >
				<thead>
					<tr class="table-top">
						<td>사번</td>
						<td>이름</td>
						<td>부서</td>
						<td>직책</td>
						<td>생년월일</td>
						<td>핸드폰</td>
						<td>이메일</td>
						<td>주소</td>
						<td>성별</td>
					</tr>
				</thead>
				<tfoot></tfoot>
				<tbody>
					
				</tbody>
			</table>
			</div>
			
		</div>
	</div>
	<script type="text/javascript">
	
	window.onload = getEmployeeList();
	
	function getEmployeeList() {
		const table = document.getElementById('employee');
		
		<c:forEach items="${empList }" var="item">

			var newRow = table.insertRow();
	
			newRow.insertCell(0).innerHTML = "${item.CODE}";
			newRow.insertCell(1).innerHTML = "<a href='/employee/info?code=${item.CODE}'>${item.M_NAME}</a>";
			newRow.insertCell(2).innerText = "${item.M_DEPART}";
			newRow.insertCell(3).innerText = "${item.M_JOB}";
			newRow.insertCell(4).innerText = "${item.M_AGE}";
			newRow.insertCell(5).innerText = "${item.M_PHONE}";
			newRow.insertCell(6).innerText = "${item.M_EMAIL}";
			newRow.insertCell(7).innerText = "${item.M_ADDRESS}";
			
			<c:if test="${item.M_GENDER eq 'M'}">
				newRow.insertCell(8).innerText = "남성";
			</c:if>
			<c:if test="${item.M_GENDER eq 'F'}">
				newRow.insertCell(8).innerText = "여성";
			</c:if>

		</c:forEach>
	}
	
	</script>
</body>
</html>