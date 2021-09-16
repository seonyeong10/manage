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
<c:if test="${empty authInfo }">
	<script>location.href="/";</script>
</c:if>
<c:if test="${authInfo.auth ne 'ADMIN' }">
	<script>
		alert('권한이 없습니다.');
		location.href="/";
	</script>
</c:if>
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
						<td cols>비고</td>
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
			
			<c:if test="${authInfo.auth eq 'ADMIN' }">
			
			if("${item.AUTH}" === 'ADMIN') {
				newRow.insertCell(6).innerHTML = "<button class='small-btn' value='${item.ID}' onclick='openUpdate(this);'>수정</button>  <button class='small-btn' value='${item.ID}' onclick='grant(this, 1);'>권한회수</button>";
				
			} else if("${item.AUTH}" === 'NORMAL') {
				newRow.insertCell(6).innerHTML = "<button class='small-btn' value='${item.ID}' onclick='openUpdate(this);'>수정</button>  <button class='small-btn' value='${item.ID}' onclick='grant(this, 2);'>권한부여</button>";
				
			}
			
			</c:if>
			
			<c:if test="${authInfo.auth ne 'ADMIN' }">
			
				if("${item.AUTH}" != 'ADMIN') {
					newRow.insertCell(6).innerHTML = "<button class='small-btn' value='${item.ID}' onclick='delUser(this);'>삭제</button>";
				}
			
			</c:if>
			
		</c:forEach>
			
			

	}
	
	function delUser(btn) {
		var id = btn.value;
		
		$.ajax({
			type : "POST"
			,url : "/userinfo/delete"
			,data : {"id" : id}
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				
				if(msg === 'success') {
					alert('계정이 삭제되었습니다.');
					location.reload();
				}
			}
		});
	}
	
	function grant(btn, no) {
		var id = btn.value;
		var auth = null;
		if(no == 1) auth = 'NORMAL';
		else if(no == 2) auth = 'ADMIN';
		
		$.ajax({
			type : "POST"
			,url : "/userinfo/grant"
			,data : {"id" : id, "auth" : auth}
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				
				if(msg === 'success') {
					alert('권한이 변경되었습니다.');
					location.reload();
				}
			}
		});
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