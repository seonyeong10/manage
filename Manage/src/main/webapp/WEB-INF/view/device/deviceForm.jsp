<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장치 추가</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<%-- <link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet" --%>
<!-- 	type="text/css" /> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>
		<div id="right">
			<form action="#" method="post" name="frm" id="frm"
				modelAttribute="equipmentCommand" onsubmit="return false;">
				<div class="section-title">장치 추가</div>
				<table id="device">
					<tr>
						<td>장치 이름</td>
						<td><input type="text" name="k_name"/></td>
						<td>영문명</td>
						<td><input type="text" name="e_name"/></td>
					</tr>
					<tr>
						<td colspan="4">성능정보 <button onclick="addRow();">추가</button></td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="text" name="k_abilty" placeholder="한글명을 입력하세요."/>
							<input type="text" name="col_name" placeholder="영문명을 입력하세요."/>
							<button onclick="deleteRow();">삭제</button>
						</td>
					</tr>
				</table>
				<button onclick="insertDevice();">등록</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var frm = document.getElementById('frm');
		
		// 행 삭제
		function deleteRow() {
			
		}
		
		// 추가 버튼 클릭
		function addRow() {
			var target = document.getElementById('device');
			
			var newRow = target.insertRow();
			var content = '<input type="text" name="k_abilty" placeholder="한글명을 입력하세요."/> <input type="text" name="col_name" placeholder="영문명을 입력하세요."/> <button onclick="">삭제</button>';
			newRow.insertCell(0).innerHTML = content;
			
			return false;
		}
		
		// 장치 정보 등록
		function insertDevice() {
			frm.action = "insertDevice";
			frm.submit();
		}
	</script>
</body>
</html>