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
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right" >
			<form action="#" method="post" id="frm" >
			<div class="section-title">장비 조회</div>
				<input type="hidden" name="table" id="gubun" />
				<input type="hidden" name="code" id="code" />
				
			
			<div style="overflow: auto; position:absolute; transform:translateX(-50%);">
			<div class="sch-box">
				<div>
					<span>종류</span>
					<input type="radio" name="gubun" value="MONITOR" id="g-monitor"/>
					<label for="g-monitor">모니터	</label>
					<input type="radio" name="gubun" value="PC" id="g-pc" />
					<label for="g-pc">PC</label>
					<input type="radio" name="gubun" value="PHONE" id="g-phone" />
					<label for="g-phone">핸드폰</label>
				</div>
				<br />
				<div>
					<select name="schThem">
						<option value="">선택하세요.</option>
						<option value="name">제품명</option>
						<option value="ma_name">제조사</option>
					</select>
					<input type="text" name="schVal" placeholder="검색어를 입력하세요."/>
					<button onclick="schDevice();" class="btn">검색</button>
				</div>
			</div>
			<br />
				<table border=1 id="equipment"  style="width: 1800px">
					<tr class="table-top">
						<td width="50px">번호</td>
						<td width="100px">구분</td>
						<td width="150px">제품명</td>
						<td width="100px">제조사</td>
						<td width="200px">AP</td>
						<td width="200px">CPU</td>
						<td width="200px">운영체제</td>
						<td width="50px">RAM</td>
						<td width="50px">저장공간</td>
						<td width="50px">배터리</td>
						<td width="200px">GPU</td>
						<td width="50px">패널</td>
						<td width="50px">주사율</td>
						<td width="100px">해상도</td>
						<td width="50px">응답속도</td>
						<td width="50px">모양</td>
					</tr>
				</table>
			</div>
			</form>
		</div>

	</div>
	<script type="text/javascript">
		
		// 검색
		function schDevice() {
			document.getElementById('frm').action = "/device/schList";
			document.getElementById('frm').method = "post";
			document.getElementById('frm').submit();
		}
		
		function goEquipmentAdd() {
			location.href = "/device/add";
		}

		function getEquipmentList() {
			var map = new Array();
			const table = document.getElementById('equipment');
			
			<c:forEach items="${list }" var="item">

			var newRow = table.insertRow();
			var gubun = "${item.GUBUN}"
			if(gubun === 'MONITOR') gubun = "모니터";
			else if(gubun === 'PHONE') gubun = "핸드폰";

			// 			newRow.insertCell(0).innerHTML = "<input type='checkbox'/>";
			newRow.insertCell(0).innerHTML = "${item.ROWNUM}";
			newRow.insertCell(1).innerText = "${item.GUBUN}";
			newRow.insertCell(2).innerHTML = "<a href='/device/info?id=${item.ID}'>${item.NAME}</a>";
			newRow.insertCell(3).innerText = "${item.MANUFACTURE}";
			newRow.insertCell(4).innerText = "${item.AP}";
			newRow.insertCell(5).innerText = "${item.CPU}";
			newRow.insertCell(6).innerText = "${item.OS}";
			newRow.insertCell(7).innerText = "${item.RAM}";
			newRow.insertCell(8).innerText = "${item.CAPACITY}";
			newRow.insertCell(9).innerText = "${item.BATTERY}";
			newRow.insertCell(10).innerText = "${item.GPU}";
			newRow.insertCell(11).innerText = "${item.PANNEL}";
			newRow.insertCell(12).innerText = "${item.HZ}";
			newRow.insertCell(13).innerText = "${item.RESOLUTION}";
			newRow.insertCell(14).innerText = "${item.SPEED}";
			newRow.insertCell(15).innerText = "${item.SHAPE}";
			
			</c:forEach>
			
			if('${schParam}' != '') {
				console.log('${schParam}');
			}
		}


		window.onload = getEquipmentList();
	</script>
</body>
</html>