<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Equipment</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<div class="section-title">장비 상세정보</div>
			<form id="frm" method="post">
				<input type="hidden" name="code" value="${item.CODE }" /> <input
					type="hidden" name="m_code" value="${item.M_CODE }" />
				<table>
					<tr>
						<td>구분</td>
						<td><input type="text" name="gubun" value=""
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>소유자</td>
						<td><input type="text" name="owner" value=""
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><input type="text" name="manufacture" value=""
							readonly="readonly" /></td>
					</tr>
				</table>
				<table id="monitor">
					<tr>
						<td>제품명</td>
						<td><input type="text" name="mo_name" value="" /></td>
					</tr>
					<tr>
						<td>패널</td>
						<td><input type="text" name="mo_pannel" value="" /></td>
					</tr>
					<tr>
						<td>주사율(hz)</td>
						<td><input type="text" name="mo_hz" value="" /></td>
					</tr>
					<tr>
						<td>해상도</td>
						<td><input type="text" name="mo_resolution" value="" /></td>
					</tr>
					<tr>
						<td>응답속도(ms)</td>
						<td><input type="text" name="mo_speed" value="" /></td>
					</tr>
					<tr>
						<td>형태</td>
						<td><input type="text" name="mo_shape" value="" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<button onclick="updateMonitor();">수정</button>
						</td>
					</tr>
				</table>
				<table id="pc">
					<tr>
						<td>종류</td>
						<td><input type="text" name="pc_division" value="" /></td>
					</tr>
					<tr>
						<td>제품명</td>
						<td><input type="text" name="pc_name" value="" /></td>
					</tr>
					<tr>
						<td>OS</td>
						<td><input type="text" name="pc_os" value="" /></td>
					</tr>
					<tr>
						<td>CPU</td>
						<td><input type="text" name="pc_cpu" value="" /></td>
					</tr>
					<tr>
						<td>RAM</td>
						<td><input type="text" name="pc_ram" value="" /></td>
					</tr>
					<tr>
						<td>GPU</td>
						<td><input type="text" name="pc_gpu" value="" /></td>
					</tr>
					<tr>
						<td>저장공간</td>
						<td><input type="text" name="pc_capacity" value="" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<button onclick="updatePC();">수정</button>
						</td>
					</tr>
				</table>
				<table id="phone">
					<tr>
						<td>제품명</td>
						<td><input type="text" name="p_name" value="" /></td>
					</tr>
					<tr>
						<td>AP</td>
						<td><input type="text" name="p_ap" value="" /></td>
					</tr>
					<tr>
						<td>OS</td>
						<td><input type="text" name="p_os" value="" /></td>
					</tr>
					<tr>
						<td>CPU</td>
						<td><input type="text" name="p_cpu" value="" /></td>
					</tr>
					<tr>
						<td>RAM</td>
						<td><input type="text" name="p_ram" value="" /></td>
					</tr>
					<tr>
						<td>저장공간</td>
						<td><input type="text" name="p_capacity" value="" /></td>
					</tr>
					<tr>
						<td>배터리</td>
						<td><input type="text" name="p_battery" value="" /></td>
					</tr>
					<tr>
						<td colspan="2" class="btn-area">
							<button onclick="updatePhone();" class="btn submit">수정</button>
							<button onclick="delEquipment();" class="btn">삭제</button>
						</td>
					</tr>
				</table>
				<table id="equipment"></table>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	window.onload = getInfo();

	function getInfo() {
		// 		const table = document.getElementById('equipment');
		// 		// 소유자, 제품명, 성능정보
		// 		if("${item.GUBUN} === '모니터'") {
		// 			// 사원 명, 제품명, 제조사, 구분, 패널,hz, 해상도, speed, shape

		// 		<c:forEach items="${item }" var="item" >
		// 			var newRow = table.insertRow();
		// 			if ("${item.key}" === 'M_NAME' || "${item.key}" === 'NAME'
		// 					|| "${item.key}" === 'MA_NAME'
		// 					|| "${item.key}" === 'PANNEL' || "${item.key}" === 'HZ'
		// 					|| "${item.key}" === 'RESOLUTION'
		// 					|| "${item.key}" === 'SPEED' || "${item.key}" === 'SHAPE') {
		// 				newRow.insertCell(0).innerText = "${item.key}";
		// 				newRow.insertCell(1).innerText = "${item.value}";
		// 			}
		// 		</c:forEach>

		// 		}
		document.getElementById('monitor').style.display = 'none';
		document.getElementById('pc').style.display = 'none';
		document.getElementById('phone').style.display = 'none';

		var tag = document.getElementsByTagName('input');
		if ("${item.GUBUN}" === '모니터') {
			document.getElementById('monitor').style.display = 'block';
			tag.gubun.value = '${item.GUBUN}';
			tag.owner.value = '${item.M_NAME}';
			tag.mo_name.value = '${item.NAME}';
			tag.manufacture.value = '${item.MA_NAME}';
			tag.mo_pannel.value = '${item.PANNEL}';
			tag.mo_hz.value = '${item.HZ}';
			tag.mo_resolution.value = '${item.RESOLUTION}';
			tag.mo_speed.value = '${item.SPEED}';
			tag.mo_shape.value = '${item.SHAPE}';

		} else if ("${item.GUBUN}" === 'PC') {
			document.getElementById('pc').style.display = 'block';
			tag.gubun.value = '${item.GUBUN}';
			tag.pc_name.value = '${item.NAME}';
			tag.manufacture.value = '${item.MA_NAME}';
			tag.pc_os.value = '${item.OS}';
			tag.pc_cpu.value = '${item.CPU}';
			tag.pc_ram.value = '${item.RAM}';
			tag.pc_gpu.value = '${item.GPU}';
			tag.pc_capacity.value = '${item.CAPACITY}';
			tag.owner.value = '${item.M_NAME}';

		} else if ("${item.GUBUN}" === '핸드폰') {
			document.getElementById('phone').style.display = 'block';
			tag.gubun.value = '${item.GUBUN}';
			tag.p_name.value = '${item.NAME}';
			tag.manufacture.value = '${item.MA_NAME}';
			tag.p_os.value = '${item.OS}';
			tag.p_cpu.value = '${item.CPU}';
			tag.p_ram.value = '${item.RAM}';
			tag.p_ap.value = '${item.AP}';
			tag.p_capacity.value = '${item.CAPACITY}';
			tag.p_battery.value = '${item.BATTERY}';
			tag.owner.value = '${item.M_NAME}';
		}

	}

	// 장비 정보 수정
	var frm = document.getElementById('frm');
	function updateMonitor() {
		frm.action = 'updateMonitor';
		frm.method = 'post';
		frm.submit();
	}

	function updatePC() {
		frm.action = 'updatePC';
		frm.method = 'post';
		frm.submit();
	}

	function updatePhone() {
		frm.action = 'updatePhone';
		frm.method = 'post';
		frm.submit();
	}

	// 장비 정보 삭제
	function delEquipment() {
		frm.action = 'delEquipment';
		frm.method = 'post';
		frm.submit();
	}
</script>
</html>