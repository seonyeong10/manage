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
					<input type="radio" name="gubun" value="MONITOR" id="g-monitor" onclick="activeBox(this.value);"/>
					<label for="g-monitor">모니터	</label>
					<input type="radio" name="gubun" value="PC" id="g-pc" onclick="activeBox(this.value);"/>
					<label for="g-pc">PC</label>
					<input type="radio" name="gubun" value="PHONE" id="g-phone" onclick="activeBox(this.value);"/>
					<label for="g-phone">핸드폰</label>
				</div>
				<br />
				<div>
					<select name="ability" id="sch-ability"></select>
					<input type="text" name="aVal" placeholder="검색어를 입력하세요."/>
				</div>
				<br />
				<div>
					<select name="schThem">
						<option value="m_name">사용자</option>
						<option value="ma_name">제조자</option>
						<option value="name">제품명</option>
						<option value="os">운영체제</option>
					</select>
					<input type="text" name="schVal" placeholder="검색어를 입력하세요."/>
					<button onclick="schEquipment();" class="btn">검색</button>
				</div>
			</div>
			<br />
				<table border=1 id="equipment"  style="width: 1800px">
					<tr class="table-top">
						<td width="50px">번호</td>
						<td width="100px">구분</td>
						<td width="100px">소유자</td>
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
		function activeBox(gubun) {
			var target = document.getElementById('sch-ability');
			let monitors =  new Map([
					['패널', 'pannel'], ['주사율','hz'], ['해상도','resolution'], ['응답속도','speed']
					]);
			let pcs =  new Map([
					['운영체제', 'os'], ['CPU','cpu'], ['RAM','ram'], ['GPU','gpu'], ['저장공간','capacity']
					]);
			let phones =  new Map([
					['AP','ap'], ['운영체제', 'os'], ['CPU','cpu'], ['RAM','ram'], ['저장공간','capacity'], ['배터리','battery']
					]);
			
			$('#sch-ability').children('option').remove();
			
			if(gubun === 'MONITOR') {
				for(const [key, value] of monitors) {
					var option = document.createElement('option');
					option.innerText = key;
					option.value =  value;
					target.append(option);
				}
				
			} else if(gubun === 'PC') {
				for(const [key, value] of pcs) {
					var option = document.createElement('option');
					option.innerText = key;
					option.value =  value;
					target.append(option);
				}				
				
			} else if(gubun === 'PHONE') {
				for(const [key, value] of phones) {
					var option = document.createElement('option');
					option.innerText = key;
					option.value =  value;
					target.append(option);
				}
				
			}
		}
		
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
			var gubun = "${item.GUBUN}"
			if(gubun === 'MONITOR') gubun = "모니터";
			else if(gubun === 'PHONE') gubun = "핸드폰";

			// 			newRow.insertCell(0).innerHTML = "<input type='checkbox'/>";
			newRow.insertCell(0).innerHTML = "${item.ROWNUM}";
			newRow.insertCell(1).innerText = "${item.GUBUN}";
			newRow.insertCell(2).innerHTML = "<a href='/equipment/getEquipmentInfo?id=${item.ID}&code=${item.CODE}'>${item.M_NAME}</a>";
			newRow.insertCell(3).innerText = "${item.NAME}";
			newRow.insertCell(4).innerText = "${item.MANUFACTURE}";
			newRow.insertCell(5).innerText = "${item.AP}";
			newRow.insertCell(6).innerText = "${item.CPU}";
			newRow.insertCell(7).innerText = "${item.OS}";
			newRow.insertCell(8).innerText = "${item.RAM}";
			newRow.insertCell(9).innerText = "${item.CAPACITY}";
			newRow.insertCell(10).innerText = "${item.BATTERY}";
			newRow.insertCell(11).innerText = "${item.GPU}";
			newRow.insertCell(12).innerText = "${item.PANNEL}";
			newRow.insertCell(13).innerText = "${item.HZ}";
			newRow.insertCell(14).innerText = "${item.RESOLUTION}";
			newRow.insertCell(15).innerText = "${item.SPEED}";
			
			var shapeCode =  "${item.SHAPE}";
			var shape = null;
			if(shapeCode === '100') {
				newRow.insertCell(16).innerText = "커브";
			} else if(shapeCode === '200') {
				newRow.insertCell(16).innerText = "와이드";
			} else if(shapeCode === '300') {
				newRow.insertCell(16).innerText = "평면";
			}
			
// 			newRow.insertCell(16).innerText = "${item.SHAPE}";

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