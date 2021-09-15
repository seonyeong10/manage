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
<link href="<c:url value="/resources/css/list.css"/>" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
	<%@ include file="../include/top.jsp"%>
		<div id="content">
			<%@ include file="../include/left.jsp"%>
		<div id="right">
			
			<div >
			<div class="section-title">회원 목록</div>
			<div>
			<table border=1 id="users" >
				<thead>
					<tr class="table-top" onclick="event.cancelBubble=true">
						<td>권한</td>
						<td>아이디</td>
						<td>사번</td>
						<td>이름</td>
						<td>부서</td>
						<td>직책</td>
						<td>비고</td>
<!-- 						<td>생년월일</td> -->
<!-- 						<td>핸드폰</td> -->
<!-- 						<td>이메일</td> -->
<!-- 						<td>주소</td> -->
<!-- 						<td>성별</td> -->
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

// 	window.onload= getCode();
	
	function getEmployeeList() {
		const table = document.getElementById('users');
		
		<c:forEach items="${userList }" var="item">

			var newRow = table.insertRow();
			
			if("${item.AUTH}" === 'ADMIN') {
				newRow.insertCell(0).innerHTML = "관리자";
				
			} else if("${item.AUTH}" === 'NORMAL') {
				newRow.insertCell(0).innerHTML = "일반";
				
			}
			
			newRow.insertCell(1).innerHTML = "${item.ID}";
			newRow.insertCell(2).innerText = "${item.CODE}";
			newRow.insertCell(3).innerText = "${item.M_NAME}";
			newRow.insertCell(4).innerText = "${item.D_NAME}";
			newRow.insertCell(5).innerText = "${item.D_TIM}";
			
			if("${item.AUTH}" === 'ADMIN') {
				newRow.insertCell(6).innerHTML = "<button class='small-btn' value='${item.ID}' onclick='revoke(this);'>권한삭제</button>";
				
			} else if("${item.AUTH}" === 'NORMAL') {
				newRow.insertCell(6).innerHTML = "<button class='small-btn' value='${item.ID}' onclick='grant(this);'>권한부여</button>";
				
			}		
			
		</c:forEach>
			
			

	}
	
	function grant(btn) {
		console.log(btn.value);
	}
	
	function revoke(btn) {
		console.log(btn.value);
	}
	
	
// 	function getCode(){
// 		$("table").on('click', 'tr', function(e) {

			
// 			var tr = $(this);
// 			var td = tr.children();
// 			var text = td.eq(0).text();
// 			console.log(tr);
// 			console.log(td);
// 			console.log(text);
			
// // 			$("#parent_code", opener.document).val(num);
			
// // 			window.close();
// 		});
			
// 	}
	
	
	</script>
</body>
</html>