<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>equipment</title>
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
			<div class="section-title">장비 조회</div>
			<form action="#" method="post" id="frm">
				<input type="hidden" name="table" id="gubun" />
				<input type="hidden" name="code" id="code" />
				<table border=1 id="equipment">
					<tr class="sch-box">
						<td colspan="10">
							<span>종류</span>
							<input type="radio" name="gubun" value="모니터" id="g-monitor"/>
							<label for="g-monitor">모니터	</label>
							<input type="radio" name="gubun" value="pc" id="g-pc"/>
							<label for="g-pc">PC</label>
							<input type="radio" name="gubun" value="핸드폰" id="g-phone"/>
							<label for="g-phone">핸드폰</label>
						</td>
					</tr>
					<tr class="sch-box">
						<td colspan="10">
							<select name="schThem">
								<option>전체</option>
								<option value="m_name">사용자</option>
								<option value="ma_name">제조자</option>
								<option value="name">제품명</option>
							</select>
							<input type="text" name="schVal" placeholder="검색어를 입력해주세요."/>
							<button onclick="schEquipment();" class="btn">검색</button>
						</td>
					</tr>
					<tr class="table-top">
						<td>번호</td>
						<td>구분</td>
						<td>소유자</td>
						<td>제품명</td>
						<td>제조사</td>
						<td>CPU</td>
						<td>운영체제</td>
						<td>RAM</td>
						<td>패널</td>
						<td>모양</td>
					</tr>
				</table>
			</form>
		</div>

	</div>
	<script type="text/javascript">
		function schEquipment() {
			document.getElementById('frm').action = "/equipment";
			document.getElementById('frm').method = "get";
			document.getElementById('frm').submit();
		}
		
		function goEquipmentAdd() {
			location.href = "/equipment/add";
		}

		// 	var lists = "${list}";
		// 	console.log(lists);
		function getEquipmentList() {
			var map = new Array();
			const table = document.getElementById('equipment');

			<c:forEach items="${list }" var="item">

			var newRow = table.insertRow();

			// 			newRow.insertCell(0).innerHTML = "<input type='checkbox'/>";
			newRow.insertCell(0).innerHTML = "${item.ROWNUM}";
			newRow.insertCell(1).innerText = "${item.GUBUN}";
			// 			newRow.insertCell(2).innerText = "${item.EMP}";
// 			newRow.insertCell(2).innerHTML = "<a href='#' onclick='getInfo(${item.GUBUN},${item.CODE});'>${item.EMP}</a>";
			newRow.insertCell(2).innerHTML = "<a href='/equipment/getEquipmentInfo?gubun=${item.GUBUN}&code=${item.CODE}'>${item.EMP}</a>";
			newRow.insertCell(3).innerText = "${item.NAME}";
			newRow.insertCell(4).innerText = "${item.MANUFACTURE}";
			newRow.insertCell(5).innerText = "${item.CPU}";
			newRow.insertCell(6).innerText = "${item.OS}";
			newRow.insertCell(7).innerText = "${item.RAM}";
			newRow.insertCell(8).innerText = "${item.PANNEL}";
			newRow.insertCell(9).innerText = "${item.SHAPE}";

			</c:forEach>
		}

// 		function getInfo(gubun, emp) {
// 			document.getElementById('table').value = gubun;
// 			document.getElementById('code').value = emp;

// 			document.getElementById('frm').action = "equipment/getEquipmentInfo";
// 			document.getElementById('frm').submit();
// 		}

		window.onload = getEquipmentList();
	</script>
</body>
</html>