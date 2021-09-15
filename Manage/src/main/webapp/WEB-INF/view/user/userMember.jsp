<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userMember.jsp</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
</script>


</head>
<body>
	<div id="content">
		<div id="right">
			
			<div style="width:930px; overflow: auto; position:absolute; left:50%; transform:translateX(-50%);">
			<div class="section-title">사원 목록</div>
			<div>
			<table border=1 id="employee" >
				<thead>
					<tr class="table-top" onclick="event.cancelBubble=true">
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
	</div>
	<script type="text/javascript">
	
	window.onload = getEmployeeList();

	window.onload= getCode();
	
	function getEmployeeList() {
		const table = document.getElementById('employee');
		
		<c:forEach items="${empList }" var="item">

			var newRow = table.insertRow();
			
			
			newRow.insertCell(0).innerHTML = "${item.CODE}";
			newRow.insertCell(1).innerHTML = "${item.M_NAME}";
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
	
	
	function getCode(){
		$("table").on('click', 'tr', function(e) {

			
			var tr = $(this);
			var td = tr.children();
			var num = td.eq(0).text();
			console.log(tr);
			console.log(td);
			console.log(num);
			
			$("#parent_code", opener.document).val(num);
			
			window.close();
		});
			
	}
	
	
	</script>
</body>
</html>